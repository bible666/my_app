<?php
error_reporting(0);
defined('BASEPATH') OR exit('No direct script access allowed');
require('Origin001.php');


class GetUser extends Origin001
{

    public function index_post()
    {
        $data = $this->post();

        if(isset($data['token']) && $data['token'] <> "" && isset($data['user_type']) && $data['user_type'] <> ""){ //check post data
            $token = $data['token'];
            $branch_id = $data['branch_id'];
            $user_name = $data['user_name'];
            $login = $data['login'];
            $user_type = $data['user_type'];
            $golf_course_id = $data['golf_course_id'];
            $email = $data['email'];
            $entries = $data['entries'];
            $liststat = $data['liststat'];

            $dbData = new db_class();
            $flaqCheck = 0; //0=no error, 1=error

            $this->addTokenTransactions($token,"GetUser",json_encode($data));
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
                    
                    if ($branch_id >-1){ //ถ้าส่งค่า branch_id มา
                        //print_r($branch_id);
                        if ($branch_id <> 0){
                            $sqlquery="
                            SELECT a.*, b.name
                            FROM users a inner join branches b on a.branch_id = b.branch_id ";
                            
                            $sWhere = " WHERE a.user_name like '%".$user_name."%' 
                                and a.login like '%".$login."%'
                                and a.user_status = '1' 
                                and a.branch_id = '".$branch_id."' ";
                        }else{ //0 = all branch
                            $sqlquery="
                            SELECT a.*, b.name
                            FROM users a inner join branches b on a.branch_id = b.branch_id ";
                            
                            $sWhere = " WHERE a.user_name like '%".$user_name."%' 
                                and a.login like '%".$login."%'
                                and a.user_status = '1' ";
                        }

                        $sqlqueryCOUNT="
                        SELECT count(a.user_id) AS CountUser_id
                        FROM users a inner join branches b on a.branch_id = b.branch_id " . $sWhere; 

                    }else if($golf_course_id > -1){ //ถ้าส่งค่า golf_course_id มา
                        if ( $golf_course_id <> 0 ){
                            $sqlquery="
                            SELECT a.*
                            FROM users a  ";

                            $sWhere = " WHERE a.user_name like '%".$user_name."%' 
                                and a.login like '%".$login."%'
                                and a.user_status = '1' 
                                and a.golf_course_id = '".$golf_course_id."' ";
                        }else{
                            $sqlquery="
                            SELECT a.*
                            FROM users a  ";

                            $sWhere = " WHERE a.user_name like '%".$user_name."%' 
                                and a.login like '%".$login."%'
                                and a.user_status = '1' ";
                        }

                        $sqlqueryCOUNT="
                        SELECT count(a.user_id) AS CountUser_id
                        FROM users a " . $sWhere; 

                    }else{
                        $dbData->status = "error";
                        $dbData->message = "post data is null.";
                        $this->addTokenTransactions($token,"GetUser",json_encode($data));
                        $this->response($dbData,200);
                    }

                $sqlquery = $sqlquery . $sWhere . "Order by a.branch_id , a.user_id ";
                $sqlqueryfool = "";
                    if (isset($data['entries']) && $data['entries'] <> ""){
                        $sqlqueryfool = "limit ".$entries." OFFSET ".$liststat."";
                    }
                
                $sqlqueryall = $sqlquery . $sqlqueryfool;
                //print_r($sqlqueryall);
                //exit();

                $query = $this->db->query($sqlqueryall);
                    
                $count = 0;
                
                foreach ($query->result() as $row){	
                    $guserData = new getUser_class();
                    $guserData->user_id = $row->user_id; 
                    $guserData->branch_id = $row->branch_id; 
                    $guserData->name = $row->name; 
                    $guserData->login = $row->login; 
                    $guserData->password = $row->password; 
                    $guserData->user_identification = $row->user_identification; 
                    $guserData->user_name = $row->user_name; 
                    $guserData->user_type = $row->user_type_id; 
                    $guserData->email = $row->email; 
                    $guserData->user_image = $row->user_image; 
                    array_push($dbData->data,$guserData);
                    $count++;
                }


                //print_r('<br><br>'.$sqlqueryCOUNT);
                //exit();
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

class getUser_class{
    public $user_id =   '';
    public $branch_id =   '';
    public $login =   '';
    public $password =   '';
    public $user_identification =   '';
    public $user_name =   '';
    public $user_type =   '';
    public $user_image =   '';
    public $email =   '';
}

