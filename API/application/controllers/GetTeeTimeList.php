<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require('Origin001.php');


class GetTeeTimeList extends Origin001
{

    public function index_post()
    {
        $data = $this->post();

        if(isset($data['token']) && $data['token'] <> "" && isset($data['golf_course_id']) && $data['golf_course_id'] <> ""){ //check post data
            $token = $data['token'];
            $golf_course_id = $data['golf_course_id'];
            $date_start = @$data['date_start'];
            $time_start = @$data['time_start'];
            $entries = $data['entries'];
            $liststat = $data['liststat'];

            $dbData = new db_class();
            $flaqCheck = 0; //0=no error, 1=error

            $this->addTokenTransactions($token,"GetTeeTimeList",json_encode($data));
            //checkToken
            $checkToken = $this->checkToken($token)->status;
            $user_id = $this->checkToken($token)->user_id;
            if($checkToken==false){
                $flaqCheck = 1;
                $dbData->status = "error";
                $dbData->message = "token error.";
                $this->response($dbData,401);
            }

            //checkGolfcourses
            if($golf_course_id<>''){
                $checkGolfcourses = $this->checkGolfcourses($golf_course_id)->status;
                if($checkGolfcourses==false){
                    $flaqCheck = 1;
                    $dbData->status = "error";
                    $dbData->message = "golfcourses error.";
                }
            }else{
                $golf_course_id='';
            }

            if($flaqCheck == 0){ //flaqCheck

                $this->load->database();
                $sqlquery="
                SELECT a.* 
                    FROM golf_course_tee_time_header a";
                $sWhere ="
                WHERE ( a.golf_course_id = '".$golf_course_id."' and a.status >= '1' )  and tee_time_type = '2' ";

                if ($date_start<>''){
                    $sWhere=$sWhere."and a.date_start = '".$date_start."' ";
                }
                if ($time_start<>''){
                    $sWhere=$sWhere."and a.time_start = '".$time_start."' ";
                }

                $sqlquery=$sqlquery.$sWhere." Order by date_start Desc, time_start Desc ";
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
                    $TeeTimeData = new getTeeTime_class();
                    $TeeTimeData->golf_course_id = $row->golf_course_id;
                    $TeeTimeData->tee_time_id = $row->tee_time_id;
                    $TeeTimeData->tee_time_name = $row->tee_time_name;
                    $TeeTimeData->date_start = $row->date_start;
                    $TeeTimeData->date_end = $row->date_end;
                    $TeeTimeData->time_start = $row->time_start;
                    $TeeTimeData->time_end = $row->time_end;
                    $TeeTimeData->promotion_regular = $row->promotion_regular;
                    $TeeTimeData->promotion_member = $row->promotion_member;
                    $TeeTimeData->gap = $row->gap;
                    $TeeTimeData->sunday = $row->sunday;
                    $TeeTimeData->monday = $row->monday;
                    $TeeTimeData->tuesday = $row->tuesday;
                    $TeeTimeData->wednesday = $row->wednesday;
                    $TeeTimeData->thursday = $row->thursday;
                    $TeeTimeData->friday = $row->friday;
                    $TeeTimeData->saturday = $row->saturday;
                    $TeeTimeData->tee_time_type = $row->tee_time_type;
                    $TeeTimeData->course_1 = $row->course_1;
                    $TeeTimeData->course_2 = $row->course_2;
                    $TeeTimeData->course_3 = $row->course_3;
                    $TeeTimeData->course_4 = $row->course_4;
                    $TeeTimeData->status = $row->status;
                    array_push($dbData->data,$TeeTimeData);
                    $count++;
                }

                $sqlqueryCOUNT="
                SELECT count(a.tee_time_id) AS CountUser_id
                FROM golf_course_tee_time_header a ".$sWhere;

                $queryc = $this->db->query($sqlqueryCOUNT);

                $count = 0;
                foreach ($queryc->result() as $row){
                    $count=$row->countuser_id; 
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

class getTeeTime_class{
    public $golf_course_id =  '';
    public $tee_time_id =  '';
    public $tee_time_name =  '';
    public $date_start =  '';
    public $date_end =  '';
    public $time_start =  '';
    public $time_end =  '';
    public $promotion_regular =  '';
    public $promotion_member =  '';
    public $gap =  '';
    public $sunday =  '';
    public $monday =  '';
    public $tuesday =  '';
    public $wednesday =  '';
    public $thursday =  '';
    public $friday =  '';
    public $saturday =  '';
    public $tee_time_type =  '';
    public $course_1 =  '';
    public $course_2 =  '';
    public $course_3 =  '';
    public $course_4 =  '';
}
