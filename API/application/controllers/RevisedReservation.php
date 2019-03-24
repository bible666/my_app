<?php
error_reporting(0);
defined('BASEPATH') OR exit('No direct script access allowed');
//require(APPPATH.'libraries/REST_Controller.php');
require('Origin001.php');


class RevisedReservation extends Origin001
{

    private $pdo;

    public function index_post()
    {
        // ini_set('display_errors', 0); 
        $data = $this->post();

        if(isset($data['token']) && $data['token'] <> "" && 
            isset($data['golf_course_id']) && $data['golf_course_id'] <> '' &&
            isset($data['reservation_date']) && $data['reservation_date'] <> "" &&
            // isset($data['member_id']) && $data['member_id'] <> "" && ////////
            isset($data['member_name']) && $data['member_name'] <> "" && 
            isset($data['member_email']) && $data['member_email'] <> "" && 
            isset($data['member_phone']) && $data['member_phone'] <> "" && 
            // isset($data['remark']) && $data['remark'] <> "" && ////////
            isset($data['club_contract_name']) && $data['club_contract_name'] <> "" && 
            isset($data['club_contract_phone']) && $data['club_contract_phone'] <> "" && 
            isset($data['golf_contract_name']) && $data['golf_contract_name'] <> "" && 
            isset($data['golf_contract_phone']) && $data['golf_contract_phone'] <> "" && 
            isset($data['green_fee_vistor']) && $data['green_fee_vistor'] <> "" && 
            isset($data['green_fee_member']) && $data['green_fee_member'] <> "" && 
            isset($data['caddy_fee']) && $data['caddy_fee'] <> "" && 
            isset($data['cart_fee']) && $data['cart_fee'] <> "" && 
            isset($data["Times"][0]['number_of_player']) && $data["Times"][0]['number_of_player'] <> "" &&
            isset($data["Times"][0]['tee_time_detail_id']) && $data["Times"][0]['tee_time_detail_id'] <> "" &&
            isset($data['reservation_id']) && $data['reservation_id'] <> ""){
            
            $token = $data['token'];
            $reservation_id = trim($data['reservation_id']);
            $id_no = @$data['id_no'];
            $reservation_date = $data['reservation_date'];
            $golf_course_id = trim($data['golf_course_id']);
            $member_id = $data['member_id'];
            $member_name = $data['member_name'];
            $member_email = $data['member_email'];
            $remark = $data['remark'];
            $memo = $data['memo'];
            $user_id = $data['club_contract_id'];
            $club_contract_name = $data['club_contract_name'];
            $club_contract_phone = $data['club_contract_phone'];
            $golf_contract_name = $data['golf_contract_name'];
            $golf_contract_phone = $data['golf_contract_phone'];
            $green_fee_vistor = $data['green_fee_vistor'];
            $green_fee_member = $data['green_fee_member'];
            $caddy_fee = $data['caddy_fee'];
            $cart_fee = $data['cart_fee'];
            $member_phone = @$data['member_phone'];
            $reservation_id = $data['reservation_id'];
            

            $dbData = new db_class();
            $flaqCheck = 0; //0=no error, 1=error

            // @$reservation_id = trim($data['reservation_id']);

            $this->addTokenTransactions($token,"RevisedReservation",json_encode($data));
            
            //checkToken
            $checkToken = $this->checkToken($token)->status;
            $user_id_token = $this->checkToken($token)->user_id;
            $branch_id_token = $this->checkToken($token)->branch_id;
            if($checkToken==false){
                $flaqCheck = 1;
                $dbData->status = "error";
                $dbData->message = "token error.";
                $this->response($dbData,401);
            }

            //checkGolfcourses
            if($golf_course_id<>''){
                $checkGolfcourses = $this->checkGolfcourses($golf_course_id)->status;
                if($checkGolfcourses==false){
                    $flaqCheck = 1;
                    $dbData->status = "error";
                    $dbData->message = "golfcourses error.";
                }
            }else{
                $golf_course_id='';
            }
            //////////////////integer is null///////////////////////
            if($member_id){
            }else{
                $member_id=Null;
            }
            if($green_fee_vistor){
            }else{
                $green_fee_vistor=Null;
            }
            if($green_fee_member){
            }else{
                $green_fee_member=Null;
            }
            if($caddy_fee){
            }else{
                $caddy_fee=Null;
            }
            if($cart_fee){
            }else{
                $cart_fee=Null;
            }
           
            ////////////////////end integer is null////////////////////////

            $this->load->database();

            try{

                $this->db->trans_begin();
                if($flaqCheck == 0){ //flaqCheck
                    //Cancel Booking
                    $query = $this->db->query("
                    select a.*, b.tee_time_id, b.course_date, d.cancel_date_before, CURRENT_DATE + d.cancel_date_before as cancel_date, c.status as tth_status
                    from reservation_detail a, golf_course_tee_time_detail b, golf_course_tee_time_header c, golf_courses d
                    where a.tee_time_detail_id = b.tee_time_detail_id and b.tee_time_id = c.tee_time_id and c.golf_course_id = d.golf_course_id and a.reservation_id = ".$reservation_id."
                    ");
                    $count = 0;
                    foreach ($query->result() as $row){	
                        $branchData = new check_gc();
                        $branchData->tee_time_id = $row->tee_time_id; 
                        $branchData->tee_time_detail_id = $row->tee_time_detail_id; 
                        
                        //check date cancel
                        $cancel_date = $row->cancel_date; 
                        $course_date = $row->course_date; 
                        $tth_status = $row->tth_status; 
                       
                        //Check course_date <= cancel_date will send mail
                        if($course_date<=$cancel_date){
                            $checkStatus = 3;
                            //send mail
                            //$messagex= $this->sendMailCancel($reservation_id,$user_id_token);
                        }else{
                            $checkStatus = 1;
                        }
                        //golf_course_tee_time_header status = 0 , $checkStatus = 0;
                        if($tth_status == 0){
                            $checkStatus = 0;
                        }
                        // print_r($checkStatus);
                        // exit();
                        //update golf_course_tee_time_detail status = 1
                        $DataGCTT = array(
                            'status'		        => $checkStatus,
                            'updated_id'		    => $user_id_token,
                            'updated_date'	        => date("Y-m-d H:i:s")
                        );			
                        $this->db->where('tee_time_detail_id', $row->tee_time_detail_id);
                        $this->db->update('golf_course_tee_time_detail',$DataGCTT);
                        $count++;
                    }

                    //update reservation_headers status = 0
                    $DataRH = array(
                        'status'		        => 0,
                        'updated_id'		    => $user_id_token,
                        'updated_date'	        => date("Y-m-d H:i:s")
                    );			
                    $this->db->where('reservation_id', $reservation_id);
                    $this->db->update('reservation_headers',$DataRH);

                    //update reservation_detail status = 0
                    $DataRD = array(
                        'status'		        => 0,
                        'updated_id'		    => $user_id_token,
                        'updated_date'	        => date("Y-m-d H:i:s")
                    );			
                    $this->db->where('reservation_id', $reservation_id);
                    $this->db->update('reservation_detail',$DataRD);

                    if($tth_status > 0){ //ถ้า golf_course_tee_time_header ยังไม่ถูกลบ

                        //select golf_course_tee_time_detail ว่ามี status = 2 หรือไม่ ถ้าไม่มีแล้วให้  golf_course_tee_time_header = 1
                        $query = $this->db->query("
                            select max(a.status) as status_max
                            from golf_course_tee_time_detail a
                            where a.tee_time_id = ".$branchData->tee_time_id."
                        ");        
                        foreach ($query->result() as $row){	                   
                            $status_max = $row->status_max;
                        }
                        if($status_max == 1){
                            //update golf_course_tee_time_header status = 1
                            $DataGH = array(
                                'status'		        => 1,
                                'updated_id'		    => $user_id_token,
                                'updated_date'	        => date("Y-m-d H:i:s")
                            );			
                            $this->db->where('tee_time_id', $branchData->tee_time_id);
                            $this->db->update('golf_course_tee_time_header',$DataGH);
                        }
                   
                    }

                    if ($this->db->trans_status() === FALSE)
                    {
                        $this->db->trans_rollback();
                        $dbData->status = "error";
                        $dbData->message = "Database Error.";
                    }
                    else
                    {
                        $this->db->trans_commit();
                        // $messagex= $this->sendMailCancel($reservation_id,$user_id_token);
                        $dbData->status = "success";
                        $dbData->message = "";             
                    }

                    // array_push($dbData->data,"reservation_id=".$reservation_id); 
                    //End Cancel Booking

                    $booking_no_Where= date("Ymd");

                    $sqlquery="
                    SELECT 
                        a.booking_no
                        FROM reservation_headers a 
                    WHERE booking_no like '".$booking_no_Where."%' 
                    Order by booking_no Desc
                    limit 1 
                    ";

                    $query = $this->db->query($sqlquery);
                        
                    $count = 0;
                    
                    foreach ($query->result() as $row){	
                        $booking_no = $row->booking_no;
                        $booking_no++;
                        $count++;
                    }

                    if($count==0){
                        $booking_no=date("Ymd")."0001";
                    }
                    
		                $datei = date("_YmdHis");
                        $Booking_No_PDF=$booking_no.$datei.".pdf";

                        $addData = array(
                            'reservation_date'	            => $reservation_date,
                            'golf_course_id'	            => $golf_course_id,
                            'id_no'	                        => $member_id,
                            'member_id'	                    => $member_id,
                            'member_name'	                => $member_name,
                            'member_email'	                => $member_email,
                            'member_phone'	                => $member_phone,
                            'booking_no'	                => $booking_no,
                            'remark'	                    => $remark,
                            'memo'	                        => $memo,
                            'branch_id'	                    => $branch_id_token,
                            'club_contract_name'	        => $club_contract_name,
                            'club_contract_phone'	        => $club_contract_phone,
                            'golf_contract_name'	        => $golf_contract_name,
                            'golf_contract_phone'	        => $golf_contract_phone,
                            'green_fee_vistor'	            => $green_fee_vistor,
                            'green_fee_member'	            => $green_fee_member,
                            'caddy_fee'	                    => $caddy_fee,
                            'cart_fee'	                    => $cart_fee,
                            'pdf_filename'                  => $Booking_No_PDF,
                            'status'	                    => 1,
                            'created_date'                  => date('Y-m-d H:i:s'),
                            'created_id'                    => $user_id_token
                        );
                       
                        //////insert header///////
                        // $this->db->where('reservation_id', $reservation_id);
                        $this->db->insert('reservation_headers',$addData);
                        $reservation_id = $this->db->insert_id();
    
                         /////insert detail//////
                        $Time_Of_Reser = "";
                        $Time_of_Reser2x = "";
                        $seq = 0;
                        $number_of_player_num = 0;
                        foreach($data['Times'] as $x =>$x_value){
                            $tee_time_detail_id=$data['Times'][$x]["tee_time_detail_id"];
                            $number_of_player=$data['Times'][$x]["number_of_player"];
                            $course_time=$data['Times'][$x]["course_time"];
                            $member_price=$data['Times'][$x]["MemberPrice"];
                            $regular_price=$data['Times'][$x]["RegularPrice"];
                            $number_of_player_num = $number_of_player_num + $number_of_player;
                            $seq++;
                            $addDataInsert = array(
                                'reservation_id'	        => $reservation_id,
                                'tee_time_detail_id'	    => $tee_time_detail_id,
                                'seq'	                    => $seq,
                                'number_of_player'	        => $number_of_player,
                                'regular_price'	            => $regular_price,
                                'member_price'	            => $member_price,

                                'status'	                => 1,
                                'created_date'	            => date('Y-m-d H:i:s'),
                                'created_id'	            => $user_id_token
                            );
                            // $this->db->where('reservation_id', $reservation_id);
                            $this->db->insert('reservation_detail',$addDataInsert);
            
                            ///////////// update golf_course_tee_time_detail /////////////
                            $addTimes = array(
                                'status'        => 2,
                                'updated_date'  => date("Y-m-d H:i:s"), 
                                'updated_id'    => $user_id_token,
                            );
                            $this->db->where('tee_time_detail_id',$tee_time_detail_id);    
                            $this->db->update('golf_course_tee_time_detail', $addTimes);

                            $sqlupH='';
                            $sqlupH = "
                            UPDATE golf_course_tee_time_header a
                            SET status = 2
                            FROM golf_course_tee_time_detail b
                            WHERE a.tee_time_id = b.tee_time_id 
                            and b.tee_time_detail_id = '".$tee_time_detail_id."'
                            ";
                            $query = $this->db->query($sqlupH);

                            if($seq==1){
                                $Time_Of_Reser = date("H:i", strtotime($course_time));
                            }else if($seq<=4){
                                $Time_Of_Reser = $Time_Of_Reser."/".date("H:i", strtotime($course_time));
                            }else if($seq==5){
                                $Time_of_Reser2x = date("H:i", strtotime($course_time));
                            }else {
                                $Time_of_Reser2x = $Time_of_Reser2x."/".date("H:i", strtotime($course_time));
                            }

                        }

                    ///// end update golf_course ///// 
                     $dbData->status = "success";
                     $dbData->message = "";
                     $dataAdd["reservation_id"] = $reservation_id;

                     $dataPDF= array(
                        'reservation_id'=>$dataAdd["reservation_id"],
                        'Booking_No_PDF'=>$Booking_No_PDF,
                        'logo_GC'=>$data["logo"],
                        'Date'=>date('d.M.Y'),
                        'Golf_Course'=>$data["golf_course_name"],
                        'Id_No'=>$data["member_id"],
                        'Person_Name'=>$data["member_name"],
                        'Booking_No'=>$booking_no,
                        'Date_Of_Reser'=>date('d.M.Y', strtotime($data["reservation_date"])),
                        'Time_Of_Reser'=>$Time_Of_Reser,
                        'Number_of_group'=>$seq,
                        'Numder_of_person'=>$number_of_player_num,
                        'Comfirm_by'=>$data["golf_contract_name"],
                        'Person_in_charge_for_ATAP'=>$data["club_contract_name"],
                        'Green_fee_vistor'=>$data["green_fee_vistor"],
                        'Green_fee_club_thai'=>$data["green_fee_member"],
                        'Caddy_fee'=>$data["caddy_fee"],
                        'Cart_fee'=>$data["cart_fee"],
                        'Time_of_Reser2'=>$Time_of_Reser2x,
                        'Remark'=>$data["remark"],
                        'branch_name'=>$data["branch_name"],
                        'branch_phone'=>$data["branch_phone"],
                        'user_id'=>$user_id_token,
                        'branch_open_detail'=>$data["branch_open_detail"]);

                    //  $this->Create_PDF($dataPDF);
                        
                     if ($this->Create_PDF($dataPDF)){
                        $messagex= $this->sendMailRevised($reservation_id,$user_id_token);
                     }
                     
                     array_push($dbData->data,$dataAdd);                     
        
                } //flaqCheck


                if ($this->db->trans_status() === FALSE)
                {
                    $this->db->trans_rollback();
                }
                else
                {
                    $this->db->trans_commit();
                }

            } catch(PDOException  $e){
                $this->db->trans_rollback();
                throw $e;
            }

           
        }else{ //check post data
            $dbData->status = "error";
            $dbData->message = "post data is null.";
        } //check post data

        $this->response($dbData,200);
    }

}

class check_gc{
    public $tee_time_id =   '';
    public $tee_time_detail_id =   '';
}