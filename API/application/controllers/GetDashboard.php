<?php
defined('BASEPATH') OR exit('No direct script access allowed');
error_reporting(0);
require('Origin001.php');

class GetDashboard extends Origin001
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper(array('form', 'url'));
    }

    public function index_post()
    {
        $data = $this->post();

        if(isset($data['token']) && $data['token'] <> "" 
        && isset($data['golf_course_id']) && $data['golf_course_id'] <> ""){ //check post data

            $token = $data['token'];
            $golf_course_id = $data['golf_course_id'];

            // $reservation_year = trim($data['reservation_year']);
            $reservation_year = date('Y', time());
            // print_r($reservation_year);

            $year1 =  $reservation_year;
            $year2 =  $reservation_year-1;
            
            $dbData = new db_class();
            $flaqCheck = 0; //0=no error, 1=error

            $this->addTokenTransactions($token,"GetDashboard",json_encode($data));
            //checkToken
            $checkToken = $this->checkToken($token)->status;
            $user_id_token = $this->checkToken($token)->user_id;
            if($checkToken==false){
                $flaqCheck = 1;
                $dbData->status = "error";
                $dbData->message = "check token error.";
                $this->response($dbData,401);
            }

            //check golf_course_id
            if($golf_course_id <> -1){
                $checkGolfcourses = $this->checkGolfcourses($golf_course_id)->status;
                if($checkGolfcourses==false){
                    $flaqCheck = 1;
                    $dbData->status = "error";
                    $dbData->message = "golfcourses error.";
                }
            }


            if($flaqCheck == 0){ //flaqCheck
               
                $dbData->status = "success";
                $dbData->message = "";  

                array_push($dbData->data, $this->GetReservReport($golf_course_id,$year1));  
                array_push($dbData->data, $this->GetReservReport($golf_course_id,$year2)); 
                  
            } //flaqCheck

        }else{ //check post data
            $dbData->status = "error";
            $dbData->message = "post data is null.";
        } //check post data

        
        $this->response($dbData,200);

    }

  
}
