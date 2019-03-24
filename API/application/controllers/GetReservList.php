<?php
error_reporting(0);
defined('BASEPATH') OR exit('No direct script access allowed');
require('Origin001.php');


class GetReservList extends Origin001
{

    public function index_post()
    {
        $data = $this->post();

        if(isset($data['token']) && $data['token'] <> "" ){ //check post data
            $token = $data['token'];
            $member_name = @$data['member_name'];
            //$golf_course_name = @$data['golf_course_name'];
            $Date = @$data['Date'];
            $entries = $data['entries'];
            $liststat = $data['liststat'];
            //$chacksuerid = $data['chacksuerid'];

            $dbData = new db_class();
            $flaqCheck = 0; //0=no error, 1=error

            $this->addTokenTransactions($token,"GetReservList",json_encode($data));
            //checkToken
            $checkToken = $this->checkToken($token)->status;
            $user_id = $this->checkToken($token)->user_id;
            if($checkToken==false){
                $flaqCheck = 1;
                $dbData->status = "error";
                $dbData->message = "token error.";
                $this->response($dbData,401);
            }

            if($flaqCheck == 0){ //flaqCheck
                $sWhere = '';
                $this->load->database();

                    $sqlquery="
                    SELECT a.reservation_id, a.booking_no, a.member_id, a.member_name, b.golf_course_name, a.reservation_date,
                        (SELECT d.course_time
                            FROM reservation_detail c inner join golf_course_tee_time_detail d on c.tee_time_detail_id = d.tee_time_detail_id 
                            WHERE c.reservation_id=a.reservation_id
                            limit 1 
                        ) as tee_time,
                        (SELECT sum(c.number_of_player)
                            FROM reservation_detail c
                            WHERE c.reservation_id=a.reservation_id
                        ) as pax
                    FROM reservation_headers a inner join golf_courses b on a.golf_course_id = b.golf_course_id ";
                    
                    $sWhere = " WHERE 
                        (lower(b.golf_course_name) like lower('%".$member_name."%') 
                        or lower(a.member_name) like lower('%".$member_name."%')
                        or lower(a.booking_no) like lower('%".$member_name."%')
                        or lower(a.member_id) like lower('%".$member_name."%')
                        )
                        and a.status = '1' ";
                    if($Date){
                        $sWhere = $sWhere." and a.reservation_date = '".$Date."' ";
                    }
                        
                $sqlquery=$sqlquery.$sWhere."Order by a.booking_no DESC ";
                $sqlqueryfool="";
                    if (isset($data['entries']) && $data['entries'] <> ""){
                        $sqlqueryfool="limit ".$entries." OFFSET ".$liststat."";
                    }
                
                $sqlqueryall=$sqlquery.$sqlqueryfool;
                //print_r($sqlqueryall);
                //exit();
                $query = $this->db->query($sqlqueryall);
                    
                $count = 0;
                
                foreach ($query->result() as $row){	
                    $gRData = new getR_class();
                    $gRData->reservation_id = $row->reservation_id; 
                    $gRData->booking_no = $row->booking_no; 
                    $gRData->member_id = $row->member_id; 
                    $gRData->member_name = $row->member_name; 
                    $gRData->golf_course_name = $row->golf_course_name; 
                    $gRData->reservation_date = $row->reservation_date; 
                    $gRData->tee_time = $row->tee_time; 
                    $gRData->pax = $row->pax; 
                    array_push($dbData->data,$gRData);
                    $count++;
                }

                $sqlqueryCOUNT="
                SELECT count(a.reservation_id) AS Count_id
                FROM reservation_headers a inner join golf_courses b on a.golf_course_id = b.golf_course_id ".$sWhere;

                $queryc = $this->db->query($sqlqueryCOUNT);

                $count = 0;
                foreach ($queryc->result() as $row){
                    $count=$row->count_id; 
                }

                $dbData->status = "success";
                $dbData->message = "";
                $dbData->COUNT = $count;
                

            } //flaqCheck

        }else{ //check post data
            $dbData->status = "error";
            $dbData->message = "post data is null.";
        } //check post data

        
        $this->response($dbData,200);
    }
 
}

class getR_class{
    public $reservation_id =   '';
    public $booking_no =   '';
    public $member_id =   '';
    public $member_name =   '';
    public $golf_course_name =   '';
    public $reservation_date =   '';
    public $tee_time =   '';
    public $pax =   '';
}

