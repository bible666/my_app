<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH.'libraries/REST_Controller.php');
require(APPPATH.'libraries/PHPMailer-master/PHPMailerAutoload.php');


class Origin001 extends REST_Controller
{

    /**
     * check token is ok and get staff data
     * 
     * return check_token_class
     */
    protected function _checkToken($token){
        $this->load->database();
        $query_str = "
            SELECT s.*
            FROM t_tokens t INNER JOIN m_staffs s ON t.m_staff_id = s.id
            WHERE t.token = ?
                AND t.del_flag = 0
        ";
        $staff_data = $this->db->query($query_str, [$token])->row();

        $tokenData = new check_token_class();
        
        //print_r($staff_data);
        if (isset($staff_data)){
            $tokenData->status      = $staff_data->del_flag;
            $tokenData->user_id     = $staff_data->id;
            $tokenData->staff_name  = $staff_data->sur_name. ' ' . $staff_data->given_name;
            $tokenData->company_id  = $staff_data->m_company_id;
        }

        return $tokenData;
   }


   public function checkBranch($id){
        $this->load->database();
        $query = $this->db->query("
            SELECT * 
            FROM branches a
            WHERE a.branch_id = '".$id."'
        ");
        $branchData = new check_branch_class();
        $count = 0;
        foreach ($query->result() as $row){	
            $branchData->name = $row->name; 
            $branchData->phone = $row->phone; 
            $count++;
        }
        if($count>0){
            $branchData->status = true;
        }else{
            $branchData->status = false;          
        }
        return $branchData;   
    }

    public function checkGolfcourses($id){
        $this->load->database();
        $query = $this->db->query("
            SELECT * 
            FROM golf_courses a
            WHERE a.golf_course_id = '".$id."'
        ");
        $golfData = new check_golf_courses_class();
        $count = 0;
        foreach ($query->result() as $row){	
            $golfData->golf_course_name = $row->golf_course_name; 
            $golfData->contract_name = $row->contract_name; 
            $golfData->contract_phone = $row->contract_phone; 
            $golfData->caddy_fee = $row->caddy_fee; 
            $golfData->cart_fee = $row->cart_fee; 
            $count++;
        }
        if($count>0){
            $golfData->status = true;            
        }else{
            $golfData->status = false;          
        }
        return $golfData; 
    }

    public function checkNameGolfcourses($golf_course_name){
        $this->load->database();
        $query = $this->db->query("
            SELECT * 
            FROM golf_courses a
            WHERE a.golf_course_name = '".$golf_course_name."'
        ");
        $golfData = new check_golf_courses_class();
        $count = 0;
        $golfData->status = false;  

        foreach ($query->result() as $row){	   
            $golfData->golf_course_id = $row->golf_course_id; 
            $golfData->status = true;
            $count++;
        }
        return $golfData; 
    }

    public function checkUsertypes($id){
        $this->load->database();
        $query = $this->db->query("
            SELECT * 
            FROM user_types a
            WHERE a.user_type_id = '".$id."'
        ");
        $Data = new check_user_types_class();
        $count = 0;
        foreach ($query->result() as $row){	
            $count++;
        }
        if($count>0){
            $Data->status = true;            
        }else{
            $Data->status = false;          
        }
        return $Data; 
    }
    
    public function checkUserid($login){
        $this->load->database();
        $query = $this->db->query("
            SELECT user_id 
            FROM users a
            WHERE a.login = '".$login."'
        ");
        
        $count = 0;
        foreach ($query->result() as $row){	
            $user_id = $row->user_id;
        }
        return $user_id; 
    }

    public function checkFormatDate($date01){
        if(preg_match("/^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/",$date01)){
            return true; 
        }else{
            return false;
        }
    }

    public function checkArea($id){
        $this->load->database();
        $query = $this->db->query("
            SELECT * 
            FROM areas a
            WHERE a.area_id = '".$id."'
        ");
        $Data = new check_user_types_class();
        $count = 0;
        foreach ($query->result() as $row){	
            $count++;
        }
        if($count>0){
            return true;           
        }else{
            return false;         
        }
    }

    public function checkMemberId($id){
        $this->load->database();
        $query = $this->db->query("
            SELECT * 
            FROM members a
            WHERE a.member_id = '".$id."'
        ");
        $Data = new check_member_class();
        $Data->status = false; 
        foreach ($query->result() as $row){	
            $Data->status = true; 
            $Data->name = $row->name; 
            $Data->email = $row->email; 
            $Data->phone = $row->phone;
        }            
        return $Data;         
    }

    public function Create_PDF($data){
        
		ob_start();
		
		$filename = "order.pdf";

		$namePDF = $data['Booking_No_PDF'];
		$html = $this->load->view('PDF',$data,true);
		// echo($html);
		 ob_end_clean();

		$this->load->library('M_pdf');

		$a = new M_pdf();
			
		$a->pdf->WriteHTML($html);
		// $a->pdf->Output();
		
		if($a->pdf->Output("./PDFBooking/".$namePDF,"F")){

        } else if($data['donotSendmail']<=0){
            // print_r("1");
            return true;
			// $messagex= $this->sendMail($data['reservation_id'],$data['user_id']);
            // print_r("2");
        }
        return false;
    }

    
	public function sendMail($Reservation_id,$Users_id){
        // send  mail
        $sqlquery="
        SELECT a.member_email,a.club_contract_name,a.pdf_filename,a.booking_no,a.member_name,sum(c.number_of_player) as person,
        count(c.seq) as group,b.email,b.golf_course_name,d.course_time,d.course_date
        
        FROM reservation_headers a left join reservation_detail c on a.reservation_id=c.reservation_id
        inner join golf_courses b on a.golf_course_id=b.golf_course_id 
        inner join golf_course_tee_time_detail d on c.tee_time_detail_id=d.tee_time_detail_id
        WHERE a.reservation_id = '".$Reservation_id."'

        group by a.member_email,a.club_contract_name,a.pdf_filename,a.booking_no,a.member_name,
	    b.email,b.golf_course_name,d.course_time,d.course_date,c.tee_time_detail_id
        ";
        $query = $this->db->query($sqlquery);
        // send mail users
        $sqluser="
        SELECT u.email,u.user_name FROM users u
        WHERE u.user_id = '".$Users_id."'
        ";
        $queryuser = $this->db->query($sqluser);
        // set config
        $sqlconfig="SELECT * FROM configs order by code ASC";
        // print_r($sqlconfig);
        $queryconfig = $this->db->query($sqlconfig);

        $count = 0;
        $countuser = 0;
        $countconfig = 0;

        // config
        foreach ($queryconfig->result() as $rowconfig){	
            // print_r($rowconfig);
            $data['Values_Text'] .= $rowconfig->value_text. ',';
            $data['Values_Integer'] .= $rowconfig->value_integer. ',';
            $countconfig++;
        }
        // print_r($data['Values_Integer']);
        list($_val1,$_SMTP,$_SMTP_TYPE,$_val2,$_User_Name,$_PASSWORD,$_CLUB_Thailand_email) = explode(',', $data['Values_Text']);

        list($_DATA,$_val2,$_val3,$_PORT,$_val5,$_val6,$_val7) = explode(',', $data['Values_Integer']);
        // print_r($_PORT);
        // exit;
        // email user
        foreach ($queryuser->result() as $rowuser){	
            // print_r($rowuser->user_name);
            $data['E-mail_User'] = $rowuser->email;
            $data['User_Name'] = $rowuser->user_name;
            $countuser++;
        }
        // exit;
        // email  
        foreach ($query->result() as $row){	
            // print_r($row);
            $data['E-mail_Mender'] = $row->member_email;
            $data['E-mail_GC'] = $row->email;
            $data['club_contract_name'] = $row->club_contract_name;
            $data['pdf_filename'] = $row->pdf_filename;
            $data['Booking_no'] = $row->booking_no;
            $data['Golf_Course_Name'] = $row->golf_course_name;
            $data['Member_Name'] = $row->member_name;
            $data['Booking_name'] = $row->member_name;
            $data['Course_Date'] = $row->course_date;
            $data['Course_Time'] .= substr($row->course_time, 0, -3).',';
            $data['Person'] += $row->person;
            $data['Group'] += $row->group;

            $count++;
        }
        $sumdate = $data['Course_Date'];
        $Dates = date("d/M/Y", strtotime($sumdate));

        $sumTime = substr($data['Course_Time'], 0, -1);

        $data['E-mail_CT']= $_CLUB_Thailand_email;
        // print_r($data);
        $receiveName='Support';
        $receiveNameClub='Club Thailland';
        $receiveEmail1 = $data['E-mail_Mender'];
        $receiveEmail2 = $data['E-mail_GC'];
        // $receiveEmail3 = $_CLUB_Thailand_email;
        $receiveEmail3 = $data['E-mail_CT'];
        $receiveEmail4 = $data['E-mail_User'];

        $subject = "(".$data['Golf_Course_Name'].")"."ご予約完了いたしました　/ BOOKING FROM CLUB THAILAND";
        $body = "Dear Sir or Madam,<br>
        We already booked your golf course via club Thailand.<br>
        Anyway, please kindly find the attachment for our confirmation voucher and confirm.<br>".
        "<br>--------------------------------------------<br>".
        "BOOKING NO:".$data['Booking_no']."<br>".
        "GOLF COURSE:".$data['Golf_Course_Name']."<br>".
        "BOOKING NAME:".$data['Booking_name']."<br>".
        "DATE:".$Dates."<br>".
        "TIME:".$sumTime."<br>".
        "GROUP:".$data['Group']."<br>".
        "PERSON:". $data['Person']."<br>".

         "<br><br>".

        "(Notes)<br>
        ・Club thailand member<br>
        　Please submit this attachment voucher and <br>
        　Club thailand member card at golf course.<br><br>
        ・Due to contract may it be cancelation fee,<br>".
        "--------------------------------------------<br><br>".
        "Best Regards,<br>"
        .$data['club_contract_name'].
        "<br><br>--------------------------------------------<br>
        CLUB THAILAND INFORMATION<br><br>
        
        SUKHUMVIT 35<br>
        　OPEN:09:00-20:00(MON-FRI) / 09:00-18:00(SAT,SUN,PUBLIC HOLIDAY)<br>
        HOLIDAY:NONE<br>
        　TEL:02-662-1191<br><br>
        
        THANIYA<br>
        OPEN:10:00-19:00(MON-SAT)<br>
        HOLIDAY:SUN,PUBLIC HOLIDAY<br>
        TEL:02-652-4414<br><br>
        
        SRIRACHA<br>
        OPEN:10:00-19:00(MON-FRI) / 09:00-18:00(SAT,SUN,PUBLIC HOLIDAY)<br>
        HOLIDAY:NONE<br>
        TEL:038-313-221<br><br>
        
        PATTAYA<br>
        OPEN:11:00-20:00(MON-FRI) / 09:00-18:00(SAT,SUN)<br>
        HOLIDAY:WED,PUBLIC HOLIDAY<br>
        TEL:038-488-022<br>
        --------------------------------------------";
        
		$namePDF = $data['pdf_filename'];
        $attachments = $namePDF;

        if($receiveEmail1 || $receiveEmail2 || $receiveEmail3 || $receiveEmail4 || $attachments){
            $mail = new PHPMailer;
            //$mail->SMTPDebug = 3;    
            $mail->isSMTP();                                      // Set mailer to use SMTP
				  // Specify main and backup SMTP servers
            $mail->Host = $_SMTP;
            $mail->SMTPAuth = true;                               // Enable SMTP authentication
               // SMTP username
            $mail->Username = $_User_Name; 
                    // SMTP password
            $mail->Password = $_PASSWORD; 
            // $mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
            //$mail->SMTPSecure = $_SMTP_TYPE;
            $mail->SMTPSecure = false;      // Enable TLS encryption, `ssl` also accepted
            $mail->SMTPAutoTLS = false;
            $mail->Port = $_PORT;                                    // TCP port to connect to
            $mail->setFrom('onlinebooking@thailandcard.com', 'Support');
            if ($receiveEmail1 != ""){
                $mail->addAddress($receiveEmail1, $data['Member_Name']);     // Add a recipient
            }
            if ($receiveEmail2 != ""){
                $mail->addAddress($receiveEmail2, $data['Golf_Course_Name']);     // Add a recipient
            }
            if ($receiveEmail3 != ""){
                $mail->addAddress($receiveEmail3, $receiveNameClub);     // Add a recipient
            }
            if ($receiveEmail4 != ""){
                $mail->addAddress($receiveEmail4, $data['User_Name']);     // Add a recipient
            }
            if ($attachments != ""){
                $mail->addAttachment("./PDFBooking/".$attachments);         // Add attachments
            }
            //$mail->addAddress('ellen@example.com');               // Name is optional
            //$mail->addReplyTo('info@example.com', 'Information');
            //$mail->addCC('cc@example.com');
            //$mail->addBCC('bcc@example.com');

            
            //$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name
            $mail->SMTPOptions = array(
                'ssl' => array(
                    'verify_peer' => false,
                    'verify_peer_name' => false,
                    'allow_self_signed' => true
                )
            );
            $mail->isHTML(true);                                  // Set email format to HTML
            $mail->Encoding = "quoted-printable";
            $mail->CharSet = "utf-8";

            $mail->Subject = $subject;//'Test Send subject';
            $mail->Body    = $body;//'This is body na ja <b>in bold!</b>';
            $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

            if(!$mail->send()) {
                $Data= 'Message could not be sent.';
                $Data=$Data.'Mailer Error: ' . $mail->ErrorInfo;
                
                return $Data;      
            } else {
                $Data= 'Message has been sent';
                
                return $Data;      
            }
        }
    }

    public function sendMailCancel($Reservation_id,$Users_id){

        // send  mail
        $sqlquery="
        SELECT a.member_email,a.club_contract_name,a.pdf_filename,a.booking_no,a.member_name,sum(c.number_of_player) as person,
        count(c.seq) as group,b.email,b.golf_course_name,d.course_time,d.course_date
        
        FROM reservation_headers a left join reservation_detail c on a.reservation_id=c.reservation_id
        inner join golf_courses b on a.golf_course_id=b.golf_course_id 
        inner join golf_course_tee_time_detail d on c.tee_time_detail_id=d.tee_time_detail_id
        WHERE a.reservation_id = '".$Reservation_id."'

        group by a.member_email,a.club_contract_name,a.pdf_filename,a.booking_no,a.member_name,
	    b.email,b.golf_course_name,d.course_time,d.course_date,c.tee_time_detail_id
        ";
        $query = $this->db->query($sqlquery);

        // send mail users
        $sqluser="
        SELECT u.email,u.user_name FROM users u
        WHERE u.user_id = '".$Users_id."'
        ";
        $queryuser = $this->db->query($sqluser);

        // set config
        $sqlconfig="SELECT * FROM configs order by code ASC";
        // print_r($sqlconfig);
        $queryconfig = $this->db->query($sqlconfig);
        $count = 0;
        $countuser = 0;
        $countconfig = 0;
        $Values_Text = "";
        $Values_Integer = "";

        // config
        foreach ($queryconfig->result() as $rowconfig){	
            //print_r($rowconfig);
            $Values_Text = $Values_Text.$rowconfig->value_text.',';
            $Values_Integer = $Values_Integer.$rowconfig->value_integer.',';
            $countconfig++;
        }
        // print_r($data['Values_Integer']);
        list($_val1,$_SMTP,$_SMTP_TYPE,$_val2,$_User_Name,$_PASSWORD,$_CLUB_Thailand_email) = explode(',', $Values_Text);

        list($_DATA,$_val2,$_val3,$_PORT,$_val5,$_val6,$_val7) = explode(',', $Values_Integer);
        // print_r($_PORT);
        // exit;
        // email user
        foreach ($queryuser->result() as $rowuser){	
            // print_r($rowuser);
            $data['E-mail_User'] = $rowuser->email;
            $data['User_Name'] = $rowuser->user_name;
            $countuser++;
        }
        // email  
        $data['Course_Time'] = "";
        $data['Person'] = 0;
        $data['Group'] = 0;
        foreach ($query->result() as $row){	
            // print_r($row);
            $data['E-mail_Mender'] = $row->member_email;
            $data['E-mail_GC'] = $row->email;
            $data['club_contract_name'] = $row->club_contract_name;
            $data['Booking_no'] = $row->booking_no;
            $data['Golf_Course_Name'] = $row->golf_course_name;
            $data['Member_Name'] = $row->member_name;
            $data['Booking_name'] = $row->member_name;
            $data['Course_Date'] = $row->course_date;
            $data['Course_Time'] = $data['Course_Time'].substr($row->course_time, 0, -3).',';
            $data['Person'] += $row->person;
            $data['Group'] += $row->group;
            $count++;
        }
        $sumdate = $data['Course_Date'];
        $Dates = date("d/M/Y", strtotime($sumdate));

        $sumTime = substr($data['Course_Time'], 0, -1);

        $data['E-mail_CT']= $_CLUB_Thailand_email;
        // print_r($data);
        $receiveName='Support';
        $receiveNameClub='Club Thailland';
        $receiveEmail1 = $data['E-mail_Mender'];
        $receiveEmail2 = $data['E-mail_GC'];
        // $receiveEmail3 = $_CLUB_Thailand_email;
        $receiveEmail3 = $data['E-mail_CT'];
        $receiveEmail4 = $data['E-mail_User'];

        $subject = "(".$data['Golf_Course_Name'].")"."CANCEL BOOKING FROM CLUB THAILAND";
        $body = "Dear Sir or Madam,<br>
        We already cancel booked your golf course via club Thailand.<br>".
        "<br>--------------------------------------------<br>".
        "BOOKING NO:".$data['Booking_no']."<br>".
        "GOLF COURSE:".$data['Golf_Course_Name']."<br>".
        "BOOKING NAME:".$data['Booking_name']."<br>".
        "DATE:".$Dates."<br>".
        "TIME:".$sumTime."<br>".
        "GROUP:".$data['Group']."<br>".
        "PERSON:". $data['Person']."<br>".

         "<br><br>".

        "--------------------------------------------<br><br>".
        "Best Regards,<br>"
        .$data['club_contract_name'].
        "<br><br>--------------------------------------------<br>
        CLUB THAILAND INFORMATION<br><br>
        
        SUKHUMVIT 35<br>
        　OPEN:09:00-20:00(MON-FRI) / 09:00-18:00(SAT,SUN,PUBLIC HOLIDAY)<br>
        HOLIDAY:NONE<br>
        　TEL:02-662-1191<br><br>
        
        THANIYA<br>
        OPEN:10:00-19:00(MON-SAT)<br>
        HOLIDAY:SUN,PUBLIC HOLIDAY<br>
        TEL:02-652-4414<br><br>
        
        SRIRACHA<br>
        OPEN:10:00-19:00(MON-FRI) / 09:00-18:00(SAT,SUN,PUBLIC HOLIDAY)<br>
        HOLIDAY:NONE<br>
        TEL:038-313-221<br><br>
        
        PATTAYA<br>
        OPEN:11:00-20:00(MON-FRI) / 09:00-18:00(SAT,SUN)<br>
        HOLIDAY:WED,PUBLIC HOLIDAY<br>
        TEL:038-488-022<br>
        --------------------------------------------";

        if($receiveEmail1 || $receiveEmail2 || $receiveEmail3 || $receiveEmail4){
            $mail = new PHPMailer;
            //$mail->SMTPDebug = 3;    
            $mail->isSMTP();                                      // Set mailer to use SMTP
            // $mail->Host = 'smtpm.csloxinfo.com';  					  // Specify main and backup SMTP servers
            $mail->Host = $_SMTP;
            $mail->SMTPAuth = true;                               // Enable SMTP authentication
            // $mail->Username = 'pattharaporn.j@egg.co.th';                 // SMTP username
            $mail->Username = $_User_Name; 
            // $mail->Password = 'Egg-0869449454';                           // SMTP password
            $mail->Password = $_PASSWORD; 
            // $mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
            //$mail->SMTPSecure = $_SMTP_TYPE;
            $mail->SMTPSecure = false;      // Enable TLS encryption, `ssl` also accepted
            $mail->SMTPAutoTLS = false;
            $mail->Port = $_PORT;                                    // TCP port to connect to
            $mail->setFrom('pattharaporn.j@egg.co.th', 'Support');
            if ($receiveEmail1 != ""){
                $mail->addAddress($receiveEmail1, $data['Member_Name']);     // Add a recipient
            }
            if ($receiveEmail2 != ""){
                $mail->addAddress($receiveEmail2, $data['Golf_Course_Name']);     // Add a recipient
            }
            if ($receiveEmail3 != ""){
                $mail->addAddress($receiveEmail3, $receiveNameClub);     // Add a recipient
            }
            if ($receiveEmail4 != ""){
                $mail->addAddress($receiveEmail4, $data['User_Name']);     // Add a recipient
            }


            
            //$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name

            $mail->SMTPOptions = array(
                'ssl' => array(
                    'verify_peer' => false,
                    'verify_peer_name' => false,
                    'allow_self_signed' => true
                )
            );

            $mail->isHTML(true);                                  // Set email format to HTML
            $mail->Encoding = "quoted-printable";
            $mail->CharSet = "utf-8";

            $mail->Subject = $subject;//'Test Send subject';
            $mail->Body    = $body;//'This is body na ja <b>in bold!</b>';
            $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

            if(!$mail->send()) {
                $Data= 'Message could not be sent.';
                $Data=$Data.'Mailer Error: ' . $mail->ErrorInfo;
                
                return $Data;      
            } else {
                $Data= 'Message has been sent';
                
                return $Data;      
            }
        }
    }

    public function sendMailRevised($Reservation_id,$Users_id){
        // send  mail
        $sqlquery="
        SELECT a.member_email,a.club_contract_name,a.pdf_filename,a.booking_no,a.member_name,sum(c.number_of_player) as person,
        count(c.seq) as group,b.email,b.golf_course_name,d.course_time,d.course_date
        
        FROM reservation_headers a left join reservation_detail c on a.reservation_id=c.reservation_id
        inner join golf_courses b on a.golf_course_id=b.golf_course_id 
        inner join golf_course_tee_time_detail d on c.tee_time_detail_id=d.tee_time_detail_id
        WHERE a.reservation_id = '".$Reservation_id."'

        group by a.member_email,a.club_contract_name,a.pdf_filename,a.booking_no,a.member_name,
	    b.email,b.golf_course_name,d.course_time,d.course_date,c.tee_time_detail_id
        ";
        $query = $this->db->query($sqlquery);
        // send mail users
        $sqluser="
        SELECT u.email,u.user_name FROM users u
        WHERE u.user_id = '".$Users_id."'
        ";
        $queryuser = $this->db->query($sqluser);
        // set config
        $sqlconfig="SELECT * FROM configs order by code ASC";
        // print_r($sqlconfig);
        $queryconfig = $this->db->query($sqlconfig);

        $count = 0;
        $countuser = 0;
        $countconfig = 0;

        // config
        foreach ($queryconfig->result() as $rowconfig){	
            $data['Values_Text'] .= $rowconfig->value_text. ',';
            $data['Values_Integer'] .= $rowconfig->value_integer. ',';
            $countconfig++;
        }

        list($_val1,$_SMTP,$_SMTP_TYPE,$_val2,$_User_Name,$_PASSWORD,$_CLUB_Thailand_email) = explode(',', $data['Values_Text']);

        list($_DATA,$_val2,$_val3,$_PORT,$_val5,$_val6,$_val7) = explode(',', $data['Values_Integer']);

        // email user
        foreach ($queryuser->result() as $rowuser){	
            // print_r($rowuser->user_name);
            $data['E-mail_User'] = $rowuser->email;
            $data['User_Name'] = $rowuser->user_name;
            $countuser++;
        }
        // exit;
        // email  
        foreach ($query->result() as $row){	
            // print_r($row);
            $data['E-mail_Mender'] = $row->member_email;
            $data['E-mail_GC'] = $row->email;
            $data['club_contract_name'] = $row->club_contract_name;
            $data['pdf_filename'] = $row->pdf_filename;
            $data['Booking_no'] = $row->booking_no;
            $data['Golf_Course_Name'] = $row->golf_course_name;
            $data['Member_Name'] = $row->member_name;
            $data['Booking_name'] = $row->member_name;
            $data['Course_Date'] = $row->course_date;
            $data['Course_Time'] .= substr($row->course_time, 0, -3).',';
            $data['Person'] += $row->person;
            $data['Group'] += $row->group;

            $count++;
        }
        $sumdate = $data['Course_Date'];
        $Dates = date("d/M/Y", strtotime($sumdate));

        $sumTime = substr($data['Course_Time'], 0, -1);

        $data['E-mail_CT']= $_CLUB_Thailand_email;
        // print_r($data);
        $receiveName='Support';
        $receiveNameClub='Club Thailland';
        $receiveEmail1 = $data['E-mail_Mender'];
        $receiveEmail2 = $data['E-mail_GC'];
        // $receiveEmail3 = $_CLUB_Thailand_email;
        $receiveEmail3 = $data['E-mail_CT'];
        $receiveEmail4 = $data['E-mail_User'];

        $subject = "(".$data['Golf_Course_Name'].")"."ご予約完了いたしました　/ REVISED FROM CLUB THAILAND";
        $body = "Dear Sir or Madam,<br>
        We revised booked your golf course via club Thailand.<br>
        Anyway, please kindly find the attachment for our confirmation voucher and confirm.<br>".
        "<br>--------------------------------------------<br>".
        "BOOKING NO:".$data['Booking_no']."<br>".
        "GOLF COURSE:".$data['Golf_Course_Name']."<br>".
        "BOOKING NAME:".$data['Booking_name']."<br>".
        "DATE:".$Dates."<br>".
        "TIME:".$sumTime."<br>".
        "GROUP:".$data['Group']."<br>".
        "PERSON:". $data['Person']."<br>".

         "<br><br>".

        "(Notes)<br>
        ・Club thailand member<br>
        　Please submit this attachment voucher and <br>
        　Club thailand member card at golf course.<br><br>
        ・Due to contract may it be cancelation fee,<br>".
        "--------------------------------------------<br><br>".
        "Best Regards,<br>"
        .$data['club_contract_name'].
        "<br><br>--------------------------------------------<br>
        CLUB THAILAND INFORMATION<br><br>
        
        SUKHUMVIT 35<br>
        　OPEN:09:00-20:00(MON-FRI) / 09:00-18:00(SAT,SUN,PUBLIC HOLIDAY)<br>
        HOLIDAY:NONE<br>
        　TEL:02-662-1191<br><br>
        
        THANIYA<br>
        OPEN:10:00-19:00(MON-SAT)<br>
        HOLIDAY:SUN,PUBLIC HOLIDAY<br>
        TEL:02-652-4414<br><br>
        
        SRIRACHA<br>
        OPEN:10:00-19:00(MON-FRI) / 09:00-18:00(SAT,SUN,PUBLIC HOLIDAY)<br>
        HOLIDAY:NONE<br>
        TEL:038-313-221<br><br>
        
        PATTAYA<br>
        OPEN:11:00-20:00(MON-FRI) / 09:00-18:00(SAT,SUN)<br>
        HOLIDAY:WED,PUBLIC HOLIDAY<br>
        TEL:038-488-022<br>
        --------------------------------------------";
        
		$namePDF = $data['pdf_filename'];
        $attachments = $namePDF;
        if($receiveEmail1 || $receiveEmail2 || $receiveEmail3 || $receiveEmail4 || $attachments){
            $mail = new PHPMailer;
            //$mail->SMTPDebug = 3;    
            $mail->isSMTP();                                      // Set mailer to use SMTP
            // $mail->Host = 'smtpm.csloxinfo.com';  					  // Specify main and backup SMTP servers
            $mail->Host = $_SMTP;
            $mail->SMTPAuth = true;                               // Enable SMTP authentication
            // $mail->Username = 'pattharaporn.j@egg.co.th';                 // SMTP username
            $mail->Username = $_User_Name; 
            // $mail->Password = 'Egg-0869449454';                           // SMTP password
            $mail->Password = $_PASSWORD; 
            // $mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
            //$mail->SMTPSecure = $_SMTP_TYPE;
            $mail->SMTPSecure = false;      // Enable TLS encryption, `ssl` also accepted
            $mail->SMTPAutoTLS = false;
            $mail->Port = $_PORT;                                    // TCP port to connect to
            $mail->setFrom('pattharaporn.j@egg.co.th', 'Support');
            if ($receiveEmail1 != ""){
                $mail->addAddress($receiveEmail1, $data['Member_Name']);     // Add a recipient
            }
            if ($receiveEmail2 != ""){
                $mail->addAddress($receiveEmail2, $data['Golf_Course_Name']);     // Add a recipient
            }
            if ($receiveEmail3 != ""){
                $mail->addAddress($receiveEmail3, $receiveNameClub);     // Add a recipient
            }
            if ($receiveEmail4 != ""){
                $mail->addAddress($receiveEmail4, $data['User_Name']);     // Add a recipient
            }
            if ($attachments != ""){
                $mail->addAttachment("./PDFBooking/".$attachments);         // Add attachments
            }
            //$mail->addAddress('ellen@example.com');               // Name is optional
            //$mail->addReplyTo('info@example.com', 'Information');
            //$mail->addCC('cc@example.com');
            //$mail->addBCC('bcc@example.com');

            
            //$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name
            $mail->SMTPOptions = array(
                'ssl' => array(
                    'verify_peer' => false,
                    'verify_peer_name' => false,
                    'allow_self_signed' => true
                )
            );
            $mail->isHTML(true);                                  // Set email format to HTML
            $mail->Encoding = "quoted-printable";
            $mail->CharSet = "utf-8";

            $mail->Subject = $subject;//'Test Send subject';
            $mail->Body    = $body;//'This is body na ja <b>in bold!</b>';
            $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

            if(!$mail->send()) {
                $Data= 'Message could not be sent.';
                $Data=$Data.'Mailer Error: ' . $mail->ErrorInfo;
                
                return $Data;      
            } else {
                $Data= 'Message has been sent';
                
                return $Data;      
            }
        }
    }
    
    public function GetReservReport($golf_course_id,$year){
        $DataReport = new dataReserv_class();

        //search golf_course_tee_time_detail Week Day.
        $this->load->database();

        if($golf_course_id == -1){
            $query = $this->db->query("
            select Years,Months,
                Count(wd_id) As booking,Sum(wd_player) As numbers,Sum(wd_gp) As groups,
                Count(we_id) As bookingWE ,Sum(we_player) As numbersWE ,Sum(we_gp) As groupsWE
            from (
                select Years, Months, wd_id, sum(wd_num) as wd_player, count(wd_group) as wd_gp, we_id, sum(we_num) as we_player, count(we_group) as we_gp
                from(
                    SELECT c.golf_course_id,to_char(b.course_date,'YYYY') AS Years, to_char(b.course_date,'MM') as Months,
                    case when trim(to_char(b.course_date,'day')) in ('monday','tuesday','wednesday','thursday','friday') and (h.holiday_id is null or h.status = 0) then a.reservation_id end as wd_id,
                    case when trim(to_char(b.course_date,'day')) in ('monday','tuesday','wednesday','thursday','friday') and (h.holiday_id is null or h.status = 0) then a.number_of_player else 0 end as wd_num,
                    case when trim(to_char(b.course_date,'day')) in ('monday','tuesday','wednesday','thursday','friday') and (h.holiday_id is null or h.status = 0) then a.seq end as wd_group,
                    case when trim(to_char(b.course_date,'day')) in ('sunday','saturday') or (h.holiday_id is not null and h.status = 1) then a.reservation_id end as we_id,
                    case when trim(to_char(b.course_date,'day')) in ('sunday','saturday') or (h.holiday_id is not null and h.status = 1) then a.number_of_player else 0 end as we_num,
                    case when trim(to_char(b.course_date,'day')) in ('sunday','saturday') or (h.holiday_id is not null and h.status = 1) then a.seq end as we_group,
                    b.course_date,b.course_time,h.*
                    FROM reservation_detail a INNER JOIN golf_course_tee_time_detail b ON a.tee_time_detail_id = b.tee_time_detail_id
                    INNER JOIN golf_course_tee_time_header c ON b.tee_time_id = c.tee_time_id
                    LEFT JOIN holiday h on c.golf_course_id = h.golf_course_id and b.course_date = h.holiday_date
                    WHERE  to_char(b.course_date,'YYYY') = '".$year."' and a.status = 1
                )all_detail
                group by Years, Months, wd_id, we_id
            )annual_report
            group by Years, Months
        "); 
        }else{
            $query = $this->db->query("
            select Years,Months,
                Count(wd_id) As booking,Sum(wd_player) As numbers,Sum(wd_gp) As groups,
                Count(we_id) As bookingWE ,Sum(we_player) As numbersWE ,Sum(we_gp) As groupsWE
            from (
                select Years, Months, wd_id, sum(wd_num) as wd_player, count(wd_group) as wd_gp, we_id, sum(we_num) as we_player, count(we_group) as we_gp
                from(
                    SELECT c.golf_course_id,to_char(b.course_date,'YYYY') AS Years, to_char(b.course_date,'MM') as Months,
                    case when trim(to_char(b.course_date,'day')) in ('monday','tuesday','wednesday','thursday','friday') and (h.holiday_id is null or h.status = 0) then a.reservation_id end as wd_id,
                    case when trim(to_char(b.course_date,'day')) in ('monday','tuesday','wednesday','thursday','friday') and (h.holiday_id is null or h.status = 0) then a.number_of_player else 0 end as wd_num,
                    case when trim(to_char(b.course_date,'day')) in ('monday','tuesday','wednesday','thursday','friday') and (h.holiday_id is null or h.status = 0) then a.seq end as wd_group,
                    case when trim(to_char(b.course_date,'day')) in ('sunday','saturday') or (h.holiday_id is not null and h.status = 1) then a.reservation_id end as we_id,
                    case when trim(to_char(b.course_date,'day')) in ('sunday','saturday') or (h.holiday_id is not null and h.status = 1) then a.number_of_player else 0 end as we_num,
                    case when trim(to_char(b.course_date,'day')) in ('sunday','saturday') or (h.holiday_id is not null and h.status = 1) then a.seq end as we_group,
                    b.course_date,b.course_time,h.*
                    FROM reservation_detail a INNER JOIN golf_course_tee_time_detail b ON a.tee_time_detail_id = b.tee_time_detail_id
                    INNER JOIN golf_course_tee_time_header c ON b.tee_time_id = c.tee_time_id
                    LEFT JOIN holiday h on c.golf_course_id = h.golf_course_id and b.course_date = h.holiday_date
                    WHERE  to_char(b.course_date,'YYYY') = '".$year."' and c.golf_course_id = '".$golf_course_id."' and a.status = 1
                )all_detail
                group by Years, Months, wd_id, we_id
            )annual_report
            group by Years, Months
        "); 
        }


        $count = 0;

        $tmpnow = array();
        $tmpnowWE = array();

                
        for($imon=1;$imon<=12;$imon++){
            $a = new get_reserv_report_class();
            $b = new get_reserv_report_class();

            $a->months = $imon;
            $a->booking = "0";
            $a->number = "0";
            $a->group = "0";
            array_push($tmpnow, $a);

            $b->months = $imon;
            $b->booking = "0";
            $b->number = "0";
            $b->group = "0";
            array_push($tmpnowWE, $b);

            $count++;
        }

        foreach ($query->result() as $row){	
            for($imon=1;$imon<=12;$imon++){
                if($row->months==$imon){
                    $c01 = $imon - 1;
                    $tmpnow[$c01]->months = $imon;
                    $tmpnow[$c01]->booking = $row->booking;
                    $tmpnow[$c01]->number = $row->numbers;
                    $tmpnow[$c01]->group = $row->groups;

                    $tmpnowWE[$c01]->months = $imon;
                    $tmpnowWE[$c01]->booking = $row->bookingwe;
                    $tmpnowWE[$c01]->number = $row->numberswe;
                    $tmpnowWE[$c01]->group = $row->groupswe;

                    $count++;
                }
            }
        }

        $tmpnow_A = array();
        $tmpnowWE_A = array();
        for($imons=0;$imons<=count($tmpnow)-1;$imons++){
            $DataWeekDay = new get_reserv_report_class();
            $DataWeekDay->months = $tmpnow[$imons]->months;
            $DataWeekDay->booking = $tmpnow[$imons]->booking;
            $DataWeekDay->number = $tmpnow[$imons]->number;
            $DataWeekDay->group = $tmpnow[$imons]->group;
            array_push($tmpnow_A, $DataWeekDay);

            $DataWeekEnd = new get_reserv_report_class();
            $DataWeekEnd->months = $tmpnowWE[$imons]->months;
            $DataWeekEnd->booking = $tmpnowWE[$imons]->booking;
            $DataWeekEnd->number = $tmpnowWE[$imons]->number;
            $DataWeekEnd->group = $tmpnowWE[$imons]->group;
            array_push($tmpnowWE_A, $DataWeekEnd);
        }

        $DataReport->years = $year;
        $DataReport->resultweekday = $tmpnow_A;
        $DataReport->resultweekend = $tmpnowWE_A;
        
        return $DataReport;
    }

    public function checkCancelDateBefore($golf_course_id){
        $this->load->database();
        $query = $this->db->query("
            SELECT CURRENT_DATE, a.cancel_date_before, CURRENT_DATE + a.cancel_date_before as cancel_date
            FROM golf_courses a
            WHERE a.golf_course_id = ".$golf_course_id."
        ");
        $cancel_date = "";
        foreach ($query->result() as $row){	   
            $cancel_date = $row->cancel_date; 
        }
        return $cancel_date; 
    }

}


class db_class{
    public $status =   '';
    public $message =   '';
    public $data = [];
}

class check_token_class{
    public $status      = '';
    public $user_id     = '';
    public $staff_name  = '';
    public $company_id  = -1;
}

class check_branch_class{
    public $status =   '';
    public $name =   '';
    public $phone =   '';
}

class check_golf_courses_class{
    public $status =   '';
    public $golf_course_name = '';
    public $contract_name = '';
    public $contract_phone = '';
    public $caddy_fee = '';
    public $cart_fee = '';
    
}

class check_user_types_class{
    public $status =   '';
}

class check_member_class{
    public $status =   '';
    public $name = '';
    public $email = '';
    public $phone = '';
}

class dataReserv_class{
    public $years =   '';
    public $resultweekday = [];
    public $resultweekend = [];
}

class get_reserv_report_class{
    public $months ;
    public $booking ;
    public $number ;
    public $group ;   
}
