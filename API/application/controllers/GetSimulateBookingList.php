<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require('Origin001.php');


class GetSimulateBookingList extends Origin001
{
    public function index_post()
    {
        $data = $this->post();

        if(isset($data['token']) && $data['token'] <> "" 
        && isset($data['golf_course_id']) && $data['golf_course_id'] <> "" 
        && isset($data['course_date']) && $data['course_date'] <> ""){ //check post data

            $token = $data['token'];
            $golf_course_id = $data['golf_course_id'];
            $course_date = $data['course_date'];

            $dbData = new db_class();
            $dbManual = new db_class();
            $dbDB = new db_class();

            $flaqCheck = 0; //0=no error, 1=error

            $this->addTokenTransactions($token,"GetSimulateBookingList",json_encode($data));
            //checkToken
            $checkToken = $this->checkToken($token)->status;
            $user_id_token = $this->checkToken($token)->user_id;
            if($checkToken==false){
                $flaqCheck = 1;
                $dbData->status = "error";
                $dbData->message = "token error.";
                $this->response($dbData,401);
            }

            if($flaqCheck == 0){ //flaqCheck

                $this->load->database();
                $c_data = 0;
                
                //simulate defaut
                $sqlquery="
                    select *
                    from golf_course_tee_time_header th 
                    left join golf_courses a on th.golf_course_id = a.golf_course_id
                    Where th.golf_course_id = ".$golf_course_id." and th.tee_time_type = 1
                ";
                $query = $this->db->query($sqlquery);
                foreach ($query->result() as $row){	
                    $tee_time_id = $row->tee_time_id;
                    $course_name01 = $row->course_name01;
                    $course_name02 = $row->course_name02;
                    $course_name03 = $row->course_name03;
                    $course_name04 = $row->course_name04;
                    $time_start = $row->time_start;
                    $time_end = $row->time_end;
                    $gap = $row->gap;     
                    
                    if($time_start <> '00:00:00' && $time_end <> '00:00:00' && $gap <> 0){
                        $time_start01 = strtotime($time_start);
                        $time_end01 = strtotime($time_end);
                        if($time_start01 < $time_end01){
                            $time_loop = $time_start01;
                            while ($time_loop <= $time_end01) {
                                //print_r(date("H:i", $time_loop).'<br>');
                                if($course_name01<>''){
                                    $getBData = new get_list_day();
                                    $getBData->tee_time_detail_id = '';
                                    $getBData->tee_time_id = $tee_time_id;
                                    $getBData->course_type = 'A';
                                    $getBData->course_time = date("H:i", $time_loop);
                                    $getBData->status = 0;
                                    array_push($dbData->data,$getBData); 
                                    $c_data++;
                                }
                                if($course_name02<>''){
                                    $getBData = new get_list_day();
                                    $getBData->tee_time_detail_id = '';
                                    $getBData->tee_time_id = $tee_time_id;
                                    $getBData->course_type = 'B';
                                    $getBData->course_time = date("H:i", $time_loop);
                                    $getBData->status = 0;
                                    array_push($dbData->data,$getBData); 
                                    $c_data++;
                                }
                                if($course_name03<>''){
                                    $getBData = new get_list_day();
                                    $getBData->tee_time_detail_id = '';
                                    $getBData->tee_time_id = $tee_time_id;
                                    $getBData->course_type = 'C';
                                    $getBData->course_time = date("H:i", $time_loop);
                                    $getBData->status = 0;
                                    array_push($dbData->data,$getBData); 
                                    $c_data++;
                                }
                                if($course_name04<>''){
                                    $getBData = new get_list_day();
                                    $getBData->tee_time_detail_id = '';
                                    $getBData->tee_time_id = $tee_time_id;
                                    $getBData->course_type = 'D';
                                    $getBData->course_time = date("H:i", $time_loop);
                                    $getBData->status = 0;
                                    array_push($dbData->data,$getBData); 
                                    $c_data++;
                                }
        
                                $time_loop = strtotime('+'.$gap.' minutes', $time_loop);
                            }
                        }
                    }

                }  
                //print_r($tee_time_id.' '.$course_name01.' '.$course_name02.' '.$course_name03.' '.$course_name04.' '.$time_start.' '.$time_end.' '.$gap);

                //print_r(date('w', strtotime($course_date)));
                $weekday = date('w', strtotime($course_date)); //0=sun;6=sat

                //simulate manual
                $sql_manual="
                    select *
                    from golf_course_tee_time_header th
                    Where th.golf_course_id = ".$golf_course_id." and th.tee_time_type = 2 and '".$course_date."' between th.date_start and th.date_end and th.status <> 0
                ";

                switch ($weekday){
                    case 0: //sunday
                        $sql_manual .= " and sunday = 1 ";
                        break;
                    case 1: //monday
                        $sql_manual .= " and monday = 1 ";
                        break;
                    case 2: //tuesday
                        $sql_manual .= " and tuesday = 1 ";
                        break;
                    case 3: //wednesday
                        $sql_manual .= " and wednesday = 1 ";
                        break;
                    case 4: //thursday
                        $sql_manual .= " and thursday = 1 ";
                        break;
                    case 5: //friday
                        $sql_manual .= " and friday = 1 ";
                        break;
                    case 6: //saturday
                        $sql_manual .= " and saturday = 1 ";
                        break;
                }

                //print_r($sql_manual);
                //break;
                $query_m = $this->db->query($sql_manual);
                foreach ($query_m->result() as $row_manual){	
                    
                    $tee_time_id = $row_manual->tee_time_id;
                    $course_name01 = $row_manual->course_1;
                    $course_name02 = $row_manual->course_2;
                    $course_name03 = $row_manual->course_3;
                    $course_name04 = $row_manual->course_4;
                    $time_start = $row_manual->time_start;
                    $time_end = $row_manual->time_end;
                    $gap = $row_manual->gap;

                    $time_start01 = strtotime($time_start);
                    $time_end01 = strtotime($time_end);
                    $time_loop = $time_start01;
                    while ($time_loop <= $time_end01) {
                        //print_r(date("H:i", $time_loop).'<br>');
                        if($course_name01<>''){
                            $getBData = new get_list_day();
                            $getBData->tee_time_detail_id = '';
                            $getBData->tee_time_id = $tee_time_id;
                            $getBData->course_type = 'A';
                            $getBData->course_time = date("H:i", $time_loop);
                            $getBData->status = 0;
                            array_push($dbManual->data,$getBData); 
                        }
                        if($course_name02<>''){
                            $getBData = new get_list_day();
                            $getBData->tee_time_detail_id = '';
                            $getBData->tee_time_id = $tee_time_id;
                            $getBData->course_type = 'B';
                            $getBData->course_time = date("H:i", $time_loop);
                            $getBData->status = 0;
                            array_push($dbManual->data,$getBData); 
                        }
                        if($course_name03<>''){
                            $getBData = new get_list_day();
                            $getBData->tee_time_detail_id = '';
                            $getBData->tee_time_id = $tee_time_id;
                            $getBData->course_type = 'C';
                            $getBData->course_time = date("H:i", $time_loop);
                            $getBData->status = 0;
                            array_push($dbManual->data,$getBData); 
                        }
                        if($course_name04<>''){
                            $getBData = new get_list_day();
                            $getBData->tee_time_detail_id = '';
                            $getBData->tee_time_id = $tee_time_id;
                            $getBData->course_type = 'D';
                            $getBData->course_time = date("H:i", $time_loop);
                            $getBData->status = 0;
                            array_push($dbManual->data,$getBData); 
                        }

                        $time_loop = strtotime('+'.$gap.' minutes', $time_loop);
                    }
                }

                //data from golf_course_tee_time_detail
                $sql_data="
                    select td.*,to_char(course_time,'HH24:mi') as tt
                    from golf_course_tee_time_header th 
                    join golf_course_tee_time_detail td on th.tee_time_id = td.tee_time_id
                    Where th.golf_course_id = ".$golf_course_id." and td.course_date =  '".$course_date."' and td.status <> 0
                    order by tt
                ";
                
                $query_d = $this->db->query($sql_data);
                foreach ($query_d->result() as $row_d){	
                    $getBData = new get_list_day();
                    $getBData->tee_time_detail_id = $row_d->tee_time_detail_id;
                    $getBData->tee_time_id = $row_d->tee_time_id;
                    $getBData->course_type = $row_d->course_type;
                    $getBData->course_time = $row_d->tt;
                    $getBData->status = $row_d->status;
                    array_push($dbDB->data,$getBData); 
                }

                //manual -> defaut
                foreach($dbManual->data as $mManualData ){
                    $staCheck = false;
                    foreach($dbData->data as $mData ){
                        if($mManualData->course_time == $mData->course_time && $mManualData->course_type == $mData->course_type){
                            $staCheck = true;
                            $mData->tee_time_detail_id = $mManualData->tee_time_detail_id;
                            $mData->tee_time_id = $mManualData->tee_time_id;
                            $mData->course_type = $mManualData->course_type;
                            $mData->course_time = $mManualData->course_time;
                            $mData->status = $mManualData->status;
                        }
                        $c_data++;
                    }

                    if ($staCheck == false){
                        $getBData = new get_list_day();
                        $getBData->tee_time_detail_id = $mManualData->tee_time_detail_id;
                        $getBData->tee_time_id = $mManualData->tee_time_id;
                        $getBData->course_type = $mManualData->course_type;
                        $getBData->course_time = $mManualData->course_time;
                        $getBData->status = $mManualData->status;
                        array_push($dbData->data,$getBData); 
                        $c_data++;
                    }
                }

                //golf_course_tee_time_detail -> defaut
                foreach($dbDB->data as $mManualData ){
                    $staCheck = false;
                    foreach($dbData->data as $mData ){
                        if($mManualData->course_time == $mData->course_time && $mManualData->course_type == $mData->course_type){
                            $staCheck = true;
                            $mData->tee_time_detail_id = $mManualData->tee_time_detail_id;
                            $mData->tee_time_id = $mManualData->tee_time_id;
                            $mData->course_type = $mManualData->course_type;
                            $mData->course_time = $mManualData->course_time;
                            $mData->status = $mManualData->status;
                        }
                        $c_data++;
                    }

                    if ($staCheck == false){
                        $getBData = new get_list_day();
                        $getBData->tee_time_detail_id = $mManualData->tee_time_detail_id;
                        $getBData->tee_time_id = $mManualData->tee_time_id;
                        $getBData->course_type = $mManualData->course_type;
                        $getBData->course_time = $mManualData->course_time;
                        $getBData->status = $mManualData->status;
                        array_push($dbData->data,$getBData); 
                        $c_data++;
                    }
                } 

                
                if($c_data > 0){
                    $dbData->status = "success";
                    $dbData->message = "";
                    
                }else{
                    $dbData->status = "error";
                    $dbData->message = "No Information.";
                }

            } //flaqCheck

        }else{ //check post data
            $dbData->status = "error";
            $dbData->message = "post data is null.";
        } //check post data

        
        $this->response($dbData,200);
    }
 
}

class get_list_day{
    public $tee_time_detail_id = '';
    public $tee_time_id = '';
    public $course_type = '';
    public $course_time = '';
    public $status = '';
}