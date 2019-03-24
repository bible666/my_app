<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require('Origin001.php');


class GetGolfCorseReport extends Origin001
{

    public function index_post()
    {
        $data = $this->post();

        if(isset($data['token']) && $data['token'] <> ""){ //check post data

            $token = $data['token'];
            $golf_course_name = @$data['golf_course_name'];
            $year = @$data['year'];
            $entries = $data['entries'];
            $liststat = $data['liststat'];

            $dbData = new db_class();
            $flaqCheck = 0; //0=no error, 1=error

            $this->addTokenTransactions($token,"GetGolfCorseReport",json_encode($data));
            //checkToken
            $checkToken = $this->checkToken($token)->status;
            $user_id_token = $this->checkToken($token)->user_id;
            if($checkToken==false){
                $flaqCheck = 1;
                $dbData->status = "error";
                $dbData->message = "token error.";
                $this->response($dbData,401);
            }

            //checkGolfcourses

            if($flaqCheck == 0){ //flaqCheck
                $Ysql = date("Y");
                if($year){
                    $Ysql = $year;
                }
                $sWhere = '';
                $this->load->database();

                    $sqlquery="
                    SELECT a.golf_course_id, a.golf_course_name,
                        (SELECT COUNT(b.reservation_id)
                            FROM reservation_headers b
                            WHERE b.golf_course_id=a.golf_course_id 
                                and b.status = '1' 
                                and to_char(b.reservation_date,'YYYY') IN ('".$Ysql."')
                        ) as numbooking,
                        (SELECT sum(c.number_of_player)
                            FROM reservation_detail c inner join reservation_headers b on c.reservation_id = b.reservation_id 
                            WHERE b.golf_course_id=a.golf_course_id 
                                and b.status = '1' 
                                and to_char(b.reservation_date,'YYYY') IN ('".$Ysql."')
                        ) as pax,
                        (SELECT COUNT(c.tee_time_detail_id)
                            FROM reservation_detail c inner join reservation_headers b on c.reservation_id = b.reservation_id 
                            WHERE b.golf_course_id=a.golf_course_id 
                            and b.status = '1' 
                            and to_char(b.reservation_date,'YYYY') IN ('".$Ysql."')
                        ) as group
                    FROM golf_courses a ";
                    $sWhere = " WHERE lower(a.golf_course_name) like lower('%".$golf_course_name."%') 
                        and a.status = '1' ";
                        
                $sqlquery=$sqlquery.$sWhere."Order by a.golf_course_name ";
                $sqlqueryfool="";
                    if (isset($data['entries']) && $data['entries'] <> ""){
                        $sqlqueryfool="limit ".$entries." OFFSET ".$liststat."";
                    }
                
                $sqlqueryall=$sqlquery.$sqlqueryfool;
                // print_r($sqlqueryall);
                $query = $this->db->query($sqlqueryall);
                    
                $count = 0;
                
                foreach ($query->result() as $row){	
                    $gRData = new getR_class();
                    $gRData->golf_course_id = $row->golf_course_id; 
                    $gRData->golf_course_name = $row->golf_course_name; 
                    $gRData->numbooking = $row->numbooking; 
                    $gRData->pax = $row->pax; 
                    $gRData->group = $row->group; 


                    array_push($dbData->data,$gRData);
                    $count++;
                }

                $sqlqueryCOUNT="
                SELECT count(a.golf_course_id) AS Count_id
                FROM golf_courses a ".$sWhere;

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
    public $golf_course_id =   '';
    public $golf_course_name =   '';
    public $numbooking =   '';
    public $pax =   '';
    public $group =   '';
}