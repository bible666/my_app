<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require('Origin001.php');


class GetReservByID extends Origin001
{

    public function index_post()
    {
        $data = $this->post();

        if(isset($data['token']) && $data['token'] <> "" && isset($data['reservation_id']) && $data['reservation_id'] <> ""){ //check post data

            $token = $data['token'];
            $reservation_id = @$data['reservation_id'];
            

            $dbData = new db_class();
            $flaqCheck = 0; //0=no error, 1=error

            $this->addTokenTransactions($token,"GetReservByID",json_encode($data));
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
                    $sWhere = '';
                    $sqlquery="
                    SELECT a.reservation_id, a.member_id, a.member_name, a.member_email, a.member_phone, a.remark,a.memo, a.pdf_filename,
                     a.booking_no, a.club_contract_name, a.club_contract_phone, a.golf_contract_name, a.golf_contract_phone, a.branch_id,
                     a.green_fee_vistor, a.green_fee_member, a.caddy_fee, a.cart_fee, a.reservation_date, a.created_date, c.name,
                     b.golf_course_id, b.logo, b.golf_course_name , b.address, b.zipcode, b.tel, b.fax,
                     b.mobile, b.map_picture,b.cancel_date_before,
                     CASE WHEN trim(to_char(a.reservation_date,'day')) in ( 'sunday','saturday')
                     THEN
                          b.week_end_min_pax
                     ELSE
                          b.week_day_min_pax
                     END as golfer_min,
                     CASE WHEN trim(to_char(a.reservation_date,'day')) in ( 'sunday','saturday')
                     THEN
                          b.week_end_max_pax
                     ELSE
                          b.week_day_max_pax
                     END as golfer_max
                    FROM reservation_headers a inner join golf_courses b on a.golf_course_id = b.golf_course_id inner join branches c on a.branch_id = c.branch_id
                    WHERE a.reservation_id = '".$reservation_id."' ";
                    $sqlqueryfool="";


                $sqlqueryall=$sqlquery.$sqlqueryfool;

                $query = $this->db->query($sqlqueryall);
                    
                $count = 0;
                
                foreach ($query->result() as $row){	
                    $ggolf_courseData = new getR_class();
                    $ggolf_courseData->reservation_id = $row->reservation_id;
                    $ggolf_courseData->member_id = $row->member_id;
                    $ggolf_courseData->member_name = $row->member_name;
                    $ggolf_courseData->member_email = $row->member_email;
                    $ggolf_courseData->member_phone = $row->member_phone;
                    $ggolf_courseData->remark = $row->remark;
                    $ggolf_courseData->memo = $row->memo;
                    $ggolf_courseData->pdf_filename = $row->pdf_filename;
                    $ggolf_courseData->booking_no = $row->booking_no;
                    $ggolf_courseData->club_contract_name = $row->club_contract_name;
                    $ggolf_courseData->club_contract_phone = $row->club_contract_phone;
                    $ggolf_courseData->golf_contract_name = $row->golf_contract_name;
                    $ggolf_courseData->golf_contract_phone = $row->golf_contract_phone;
                    $ggolf_courseData->green_fee_vistor = $row->green_fee_vistor;
                    $ggolf_courseData->green_fee_member = $row->green_fee_member;
                    $ggolf_courseData->caddy_fee = $row->caddy_fee;
                    $ggolf_courseData->cart_fee = $row->cart_fee;
                    $ggolf_courseData->branch_id = $row->branch_id;
                    $ggolf_courseData->reservation_date = $row->reservation_date;
                    $ggolf_courseData->created_date = $row->created_date;
                    $ggolf_courseData->name = $row->name;
                    $ggolf_courseData->golf_course_id = $row->golf_course_id;
                    $ggolf_courseData->logo = $row->logo;
                    $ggolf_courseData->golf_course_name = $row->golf_course_name;
                    $ggolf_courseData->address = $row->address;
                    $ggolf_courseData->zipcode = $row->zipcode;
                    $ggolf_courseData->tel = $row->tel;
                    $ggolf_courseData->fax = $row->fax;
                    $ggolf_courseData->mobile = $row->mobile;
                    $ggolf_courseData->map_picture = $row->map_picture;
                    $ggolf_courseData->cancel_date_before = $row->cancel_date_before;
                    $ggolf_courseData->golfer_min = $row->golfer_min;
                    $ggolf_courseData->golfer_max = $row->golfer_max;
                    
                    $sqlseq = "
                    SELECT d.seq, d.tee_time_detail_id, f.course_type, f.course_time, d.number_of_player, d.member_price, d.regular_price
                    FROM reservation_detail d inner join golf_course_tee_time_detail f on d.tee_time_detail_id = f.tee_time_detail_id
                    WHERE d.reservation_id = ".$reservation_id."
                    ";


                    $queryseq = $this->db->query($sqlseq);
                    foreach ($queryseq->result() as $row){	
                        $ggolf_Time_seq = new time_seq();
                        $ggolf_Time_seq->seq = $row->seq;
                        $ggolf_Time_seq->tee_time_detail_id = $row->tee_time_detail_id;
                        $ggolf_Time_seq->course_type = $row->course_type;
                        $ggolf_Time_seq->course_time = $row->course_time;
                        $ggolf_Time_seq->number_of_player = $row->number_of_player;
                        $ggolf_Time_seq->member_price = $row->member_price;
                        $ggolf_Time_seq->regular_price = $row->regular_price;
                        array_push($ggolf_courseData->seq,$ggolf_Time_seq);
                    }

                    array_push($dbData->data,$ggolf_courseData);
                    $count++;
                }

                
                $dbData->status = "success";
                $dbData->message = "";
                

            } //flaqCheck

        }else{ //check post data
            $dbData->status = "error";
            $dbData->message = "post data is null.";
        } //check post data

        
        $this->response($dbData,200);
    }
}

class getR_class{
    public $reservation_id = '';
    public $member_id = '';
    public $member_name = '';
    public $member_email  = '';
    public $member_phone  = '';
    public $remark = '';
    public $memo = '';
    public $pdf_filename = '';
    public $booking_no = '';
    public $club_contract_name  = '';
    public $club_contract_phone  = '';
    public $golf_contract_name  = '';
    public $golf_contract_phone  = '';
    public $green_fee_vistor  = '';
    public $green_fee_member  = '';
    public $caddy_fee = '';
    public $cart_fee = '';
    public $branch_id = '';
    public $reservation_date = '';
    public $created_date  = '';
    public $name  = '';
    public $golf_course_id = '';
    public $logo  = '';
    public $golf_course_name  = '';
    public $address  = '';
    public $zipcode  = '';
    public $tel  = '';
    public $fax  = '';
    public $mobile  = '';
    public $map_picture  = '';
    public $cancel_date_before  = '';
    public $golfer_min = '';
    public $golfer_max = '';
    public $seq  = [];
}

class time_seq{
    public $seq = '';
    public $tee_time_detail_id = '';
    public $course_type = '';
    public $course_time = '';
    public $number_of_player = '';
    public $member_price = '';
    public $regular_price = '';
}