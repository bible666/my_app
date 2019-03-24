<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require('Origin001.php');


class Getgolfcourse extends Origin001
{

    public function index_post()
    {
        $data = $this->post();

        if(isset($data['token']) && $data['token'] <> "" ){ //check post data

            $token = $data['token'];
            // $golf_course_id = @$data['golf_course_id'];
            $golf_course_name = @$data['golf_course_name'];
            $entries = @$data['entries'];
            $liststat = @$data['liststat'];

            $area_id = @$data['area_id'];

            $dbData = new db_class();
            $flaqCheck = 0; //0=no error, 1=error

            $this->addTokenTransactions($token,"Getgolfcourse",json_encode($data));
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
                    SELECT a.*
                    FROM golf_courses a  
                    where a.status = 1 ";
                    $sWhere = '';
                    if ($golf_course_name <> "" ){
                        $sWhere = " and a.golf_course_name like '%".$golf_course_name."%' 
                        ";
                    }else{
                    }
                    // $sqlquery=$sqlquery."and a.branch_id = '0' ";

                    $sqlquery=$sqlquery.$sWhere." Order by golf_course_id Asc ";

                    $sqlqueryfool="";
                    if (isset($data['entries']) && $data['entries'] <> ""){
                        $sqlqueryfool="limit ".$entries." OFFSET ".$liststat."";
                    }

                // print_r($sqlquery);

                $sqlqueryall=$sqlquery.$sqlqueryfool;

                $query = $this->db->query($sqlqueryall);
                    
                $count = 0;
                
                foreach ($query->result() as $row){	
                    $ggolf_courseData = new getgolf_course_class();
                    $ggolf_courseData->golf_course_id = $row->golf_course_id;
                    $ggolf_courseData->golf_course_name = $row->golf_course_name;
                    $ggolf_courseData->company_name = $row->company_name;
                    $ggolf_courseData->address = $row->address;
                    $ggolf_courseData->zipcode = $row->zipcode;
                    $ggolf_courseData->tel = $row->tel;
                    $ggolf_courseData->fax = $row->fax;
                    $ggolf_courseData->mobile = $row->mobile;
                    $ggolf_courseData->logo = $row->logo;
                    $ggolf_courseData->document = $row->document;
                    $ggolf_courseData->email = $row->email;
                    $ggolf_courseData->contract_name = $row->contract_name;
                    $ggolf_courseData->contract_phone = $row->contract_phone;
                    $ggolf_courseData->account_detail = $row->account_detail;
                    $ggolf_courseData->area_id = $row->area_id;
                    $ggolf_courseData->map_picture = $row->map_picture;
                    $ggolf_courseData->tax_id = $row->tax_id;
                    
                    array_push($dbData->data,$ggolf_courseData);
                    $count++;
                }

                $sqlqueryCOUNT="
                SELECT count(a.golf_course_id) AS CountUser_id
                FROM golf_courses a where a.status = 1  ".$sWhere;

                // print_r($sqlqueryCOUNT);

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

class getgolf_course_class{
    public $golf_course_id;
    public $golf_course_name ;
    public $company_name ;
    public $address ;
    public $zipcode ;
    public $tel ;
    public $fax ;
    public $mobile ;
    public $logo ;
    public $document ;
    public $email ;
    public $contract_name ;
    public $contract_phone ;
    public $account_detail ;
    public $area_id ;
    public $map_picture ;
    public $tax_id ;
    
}

