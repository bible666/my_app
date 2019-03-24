<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require('Origin001.php');


class GetUserId extends Origin001
{

    public function index_post()
    {
        $data = $this->post();

        if(isset($data['token']) && $data['token'] <> "" && isset($data['user_id']) && $data['user_id'] <> ""){ //check post data
            $token = $data['token'];
            $user_id = $data['user_id'];

            $dbData = new db_class();
            $flaqCheck = 0; //0=no error, 1=error

            $this->addTokenTransactions($token,"GetUserId",json_encode($data));
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

                $query = $this->db->query("
                        SELECT * 
                        FROM users a
                        WHERE a.user_id = '".$user_id."'
                ");

                $guserData = new getUser_class();
                $count = 0;
                foreach ($query->result() as $row){	
                    $guserData = new getUser_class();
                    $guserData->user_id = $row->user_id; 
                    $guserData->branch_id = $row->branch_id; 
                    $guserData->login = $row->login; 
                    $guserData->password = $row->password; 
                    $guserData->user_identification = $row->user_identification; 
                    $guserData->user_name = $row->user_name; 
                    $guserData->user_type = $row->user_type_id; 
                    $guserData->user_image = $row->user_image; 
                    $count++;
                }

                if($count>0){
                    $dbData->status = "success";
                    $dbData->message = "";
                    array_push($dbData->data,$guserData);
                    
                }else{
                    $dbData->status = "error";
                    $dbData->message = "no user.";
                }
               

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
}

