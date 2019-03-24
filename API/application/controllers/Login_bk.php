<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH.'libraries/REST_Controller.php');


class Login extends REST_Controller
{

    public function index_post()
    {
        
        $dataDB = [];
        $data = $this->post();

        if(isset($data['login']) && isset($data['password']) && isset($data['user_identity']) && $data['login'] <> "" && $data['password'] <> "" && $data['user_identity'] <> ""){ //check post data

            $login = $data['login'];
            $password = $data['password'];
            $user_identity = $data['user_identity'];

            $this->load->database();
            $user_id = 0;
            $query = $this->db->query("SELECT * FROM users WHERE login = '".$login."' AND password = '".$password."' AND user_identification = '".$user_identity."' AND user_status in (1,-1) ");
    
            $count = 0;
            foreach ($query->result() as $row){			        
                $user_id = $row->user_id; 
                $golf_course_id = $row->golf_course_id;	
                $user_name = $row->user_name;
                $user_type_id = $row->user_type_id;
                $user_image = $row->user_image;
                $branch_id = $row->branch_id;
                $count++;
            }

            if($count > 0){ //check db data
                $tokenData = new token_class(); 
                $token = $this->getGUID();
                $tokenData->token = $token;
                $tokenData->golf_course_id = $golf_course_id;
                $tokenData->user_name = $user_name;
                $tokenData->user_type_id = $user_type_id;
                $tokenData->user_image = $user_image;
                $tokenData->branch_id = $branch_id;


                $this->updateToken($user_id);

                $this->addToken($token,$user_id);

                $dataDB['status'] = "success";
                $dataDB['message'] = "";
                $dataDB['data'] = $tokenData;
            }else{ //check db data
                $dataDB['status'] = "error";
                $dataDB['message'] = "no user.";
                $dataDB['data'] = "";
            } //check db data
                        
        }else{ //check post data
            $dataDB['status'] = "error";
            $dataDB['message'] = "post data is null.";
            $dataDB['data'] = "";
        } //check post data

        $this->response($dataDB,200);

    }

    private function addToken($token,$user_id){
		$TokenData = array(
			'token_id' 	    => $token,
			'user_id'	    => $user_id,
			'status'		=> "1",
            'created_date'	=> date("Y-m-d H:i:s"),
            
		);			
		$this->db->insert('tokens',$TokenData);
    }

    private function updateToken($user_id){
		$TokenData = array(
			'status'		=> "0"
		);			
        $this->db->where('user_id', $user_id);
        $this->db->update('tokens',$TokenData);
    }

    private function getGUID(){
        mt_srand((double)microtime()*10000);//optional for php 4.2.0 and up.
       $charid = strtoupper(md5(uniqid(rand(), true)));
       $hyphen = chr(45);// "-"
       $uuid = substr($charid, 0, 8)
           .substr($charid, 8, 4)
           .substr($charid,12, 4)
           .substr($charid,16, 4)
           .substr($charid,20,12);// "}"
       return $uuid;
    }

}

class token_class{
    public $token =   '';
    public $golf_course_id =   '';
    public $user_name =   '';
    public $user_type_id =   '';
    public $user_image =   '';
    public $branch_id =   '';
}


