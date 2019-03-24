<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require('Origin001.php');
error_reporting(0);


class ReSendMail extends Origin001
{
    public function index_post()
    {
        $data = $this->post();

        $this->addTokenTransactions($data['token'],"ReSendMail",json_encode($data));
        
        if(isset($data['token']) && $data['token'] <> "" && isset($data['reservation_id']) && $data['reservation_id'] <> ""){ //check post data
            
            $token = $data['token'];
            $reservation_id = $data['reservation_id'];

            //checkToken
            $flaqCheck = 0;
            $checkToken = $this->checkToken($token)->status;
            $user_id = $this->checkToken($token)->user_id;
            if($checkToken==false){
                $flaqCheck = 1;
                $dbData->status = "error";
                $dbData->message = "token error.";
                $this->response($dbData,401);
            }

            if($flaqCheck == 0){ //flaqCheck
                
			    $messagex= $this->sendMail($reservation_id,$user_id);
                $dbData->status = "success";
                $dbData->message = "";
                $dataAdd["reservation_id"] = $reservation_id;
                array_push($dbData->data,$dataAdd);

            } //flaqCheck

        }else{ //check post data
            $dbData->status = "error";
            $dbData->message = "post data is null. golf_course_id=".$data['golf_course_id'];
        } //check post data
        $this->response($dbData,200);
    }
 
}


