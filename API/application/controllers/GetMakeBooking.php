<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require('Origin001.php');


class GetMakeBooking extends Origin001
{

    public function index_post()
    {
        
        $data = $this->post();

        if(isset($data['token']) && $data['token'] <> "" && isset($data['golf_course_id']) && $data['golf_course_id'] <> ""){ //check post data

            $dbData = new db_class();
            $dbData->status = "success";
            $dbData->message = "";

            $gMakeData = new getBooking_class();
            $gMakeData->tee_time_id = 273;
            $gMakeData->tee_time_detail_id = "";
            $gMakeData->course_type = "A";
            $gMakeData->course_time = "09:00:00";
            $gMakeData->status = "0";
            array_push($dbData->data,$gMakeData);

            $gMakeData = new getBooking_class();
            $gMakeData->tee_time_id = 273;
            $gMakeData->tee_time_detail_id = "";
            $gMakeData->course_type = "A";
            $gMakeData->course_time = "09:30:00";
            $gMakeData->status = "0";
            array_push($dbData->data,$gMakeData);

            $gMakeData = new getBooking_class();
            $gMakeData->tee_time_id = 273;
            $gMakeData->tee_time_detail_id = "";
            $gMakeData->course_type = "A";
            $gMakeData->course_time = "10:00:00";
            $gMakeData->status = "0";
            array_push($dbData->data,$gMakeData);

            $gMakeData = new getBooking_class();
            $gMakeData->tee_time_id = 273;
            $gMakeData->tee_time_detail_id = "";
            $gMakeData->course_type = "A";
            $gMakeData->course_time = "10:30:00";
            $gMakeData->status = "0";
            array_push($dbData->data,$gMakeData);

            $gMakeData = new getBooking_class();
            $gMakeData->tee_time_id = 273;
            $gMakeData->tee_time_detail_id = "";
            $gMakeData->course_type = "A";
            $gMakeData->course_time = "11:00:00";
            $gMakeData->status = "0";
            array_push($dbData->data,$gMakeData);

            $gMakeData = new getBooking_class();
            $gMakeData->tee_time_id = 273;
            $gMakeData->tee_time_detail_id = "";
            $gMakeData->course_type = "B";
            $gMakeData->course_time = "09:00:00";
            $gMakeData->status = "0";
            array_push($dbData->data,$gMakeData);

            $gMakeData = new getBooking_class();
            $gMakeData->tee_time_id = 273;
            $gMakeData->tee_time_detail_id = "";
            $gMakeData->course_type = "B";
            $gMakeData->course_time = "09:30:00";
            $gMakeData->status = "0";
            array_push($dbData->data,$gMakeData);
 
            $gMakeData = new getBooking_class();
            $gMakeData->tee_time_id = 273;
            $gMakeData->tee_time_detail_id = "";
            $gMakeData->course_type = "B";
            $gMakeData->course_time = "10:00:00";
            $gMakeData->status = "0";
            array_push($dbData->data,$gMakeData);

            $gMakeData = new getBooking_class();
            $gMakeData->tee_time_id = 273;
            $gMakeData->tee_time_detail_id = "";
            $gMakeData->course_type = "B";
            $gMakeData->course_time = "10:30:00";
            $gMakeData->status = "0";
            array_push($dbData->data,$gMakeData);

            $gMakeData = new getBooking_class();
            $gMakeData->tee_time_id = 273;
            $gMakeData->tee_time_detail_id = "";
            $gMakeData->course_type = "B";
            $gMakeData->course_time = "11:00:00";
            $gMakeData->status = "0";
            array_push($dbData->data,$gMakeData);

            $gMakeData = new getBooking_class();
            $gMakeData->tee_time_id = 271;
            $gMakeData->tee_time_detail_id = "1111";
            $gMakeData->course_type = "A";
            $gMakeData->course_time = "13:00:00";
            $gMakeData->status = "0";
            array_push($dbData->data,$gMakeData);

            $gMakeData = new getBooking_class();
            $gMakeData->tee_time_id = 271;
            $gMakeData->tee_time_detail_id = "1112";
            $gMakeData->course_type = "A";
            $gMakeData->course_time = "13:30:00";
            $gMakeData->status = "0";
            array_push($dbData->data,$gMakeData);

            $gMakeData = new getBooking_class();
            $gMakeData->tee_time_id = 271;
            $gMakeData->tee_time_detail_id = "1113";
            $gMakeData->course_type = "A";
            $gMakeData->course_time = "14:00:00";
            $gMakeData->status = "0";
            array_push($dbData->data,$gMakeData);
    
            $gMakeData = new getBooking_class();
            $gMakeData->tee_time_id = 271;
            $gMakeData->tee_time_detail_id = "1114";
            $gMakeData->course_type = "A";
            $gMakeData->course_time = "14:30:00";
            $gMakeData->status = "0";
            array_push($dbData->data,$gMakeData);
	    
            $gMakeData = new getBooking_class();
            $gMakeData->tee_time_id = 271;
            $gMakeData->tee_time_detail_id = "1115";
            $gMakeData->course_type = "A";
            $gMakeData->course_time = "15:00:00";
            $gMakeData->status = "0";
            array_push($dbData->data,$gMakeData);

        }else{ //check post data
            $dbData->status = "error";
            $dbData->message = "post data is null.";
            
        } //check post data

        $this->addTokenTransactions($token,"GetMakeBooking",json_encode($data));
        $this->response($dbData,200);
    }
}


class getBooking_class{
    public $tee_time_id;
    public $tee_time_detail_id;
    public $course_type;
    public $course_time;
    public $status;
}