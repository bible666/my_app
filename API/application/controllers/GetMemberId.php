<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require('Origin001.php');


class GetMemberId extends Origin001
{
    public function index_post()
    {
        $data = $this->post();

        if(isset($data['token']) && $data['token'] <> "" && isset($data['member_id']) && $data['member_id'] <> ""){ //check post data

            $token = $data['token'];
            $member_id = $data['member_id'];

            $flaqCheck = 0; //0=no error, 1=error
            $dbData = new db_class(); 

            $this->addTokenTransactions($token,"GetMemberId",json_encode($data));
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
                $sqlquery="
                    select *
                    from members a
                    where a.member_id = '".$member_id."'
                ";

                $query = $this->db->query($sqlquery);
                $c_data = 0;
                foreach ($query->result() as $row){	
                    $getBData = new get_b_list();
                    $getBData->member_id = $row->member_id;
                    $getBData->name = $row->name; 
                    $getBData->email = $row->email; 
                    $getBData->phone = $row->phone;          
                    array_push($dbData->data,$getBData);
                    $c_data++;
                }
        
                if($c_data > 0){
                    $dbData->status = "success";
                    $dbData->message = "";
                    
                }else{
                    $dbData->status = "error";
                    $dbData->message = "No Information.";
                }


            } //flaqCheck */

        }else{ //check post data
            $dbData->status = "error";
            $dbData->message = "post data is null.";
        } //check post data

        
        $this->response($dbData,200);
    }
 
}

class get_b_list{
    public $member_id = '';
    public $name = '';
    public $email = '';
    public $phone = '';
}