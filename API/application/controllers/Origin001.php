<?php
//use Restserver\Libraries;
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH.'libraries/REST_Controller.php');
require(APPPATH.'libraries/PHPMailer-master/PHPMailerAutoload.php');
date_default_timezone_set('Asia/Bangkok');

// use namespace
use Restserver\Libraries\REST_Controller;

class Origin001 extends REST_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->helper('date');
        $this->load->database();
        $this->load->library('encrypt');
        
    }
    
    /**
     * get menu perission for user
     * 
     * @param $menuId id from table m_menu_controls
     * @param $userType user category
     * 
     * @return int
     */
    protected function _getMenuPermission($menuId,$userType){
        $permission    = -1;
        $this->db->select('m_permission_id');
        $dataRow = $this->db->get_where('m_menu_staff_category',[
            'm_menu_control_id'        => $menuId,
            'm_staff_category_id'    => $userType
        ])->row();

        if(isset($dataRow)){
            $permission    = $dataRow->m_permission_id;
        }

        return $permission;
    }

    /**
     * check token is ok and get staff data
     * 
     * @param $token user token
     * 
     * @return check_token_class
     */
    protected function _checkToken($token){
        $query_str = "
            SELECT s.*,t.id as tokenId,t.updated_date as token_update
            FROM t_tokens t INNER JOIN m_staffs s ON t.m_staff_id = s.id
            WHERE t.token = ?
                AND t.del_flag = 0
        ";
        $staff_data = $this->db->query($query_str, [$token])->row();
        //print_r($staff_data);
        $tokenData = new check_token_class();
        
        if (isset($staff_data)){
            $minDiff = $this->dateDifference($staff_data->token_update,date("Y-m-d H:i:s"),'%i');
            //print_r($minDiff);
            if ($minDiff <= 30 ){
                $tokenData->status      = $staff_data->del_flag;
                $tokenData->user_id     = $staff_data->id;
                $tokenData->staff_name  = $staff_data->sur_name. ' ' . $staff_data->given_name;
                $tokenData->company_id  = $staff_data->m_company_id;
                $tokenData->staff_cat    = $staff_data->staff_cat;
    
                //update token data
                $this->db->set(['updated_date' => date("Y-m-d H:i:s"),'test'=>$minDiff]);
                $this->db->where(['id' => $staff_data->tokenId]);
                $this->db->update('t_tokens');
            } else {
                //update token data
                $this->db->set(['del_flag' => 1,'test'=>$minDiff]);
                $this->db->where(['id' => $staff_data->tokenId]);
                $this->db->update('t_tokens');
            }
            //echo $minDiff;
            //if ($staff_data->token_update > date("Y-m-d H:i:s"))

        }

        return $tokenData;
   }

    protected function getAuthHeader(){

        $headers = [];
        foreach (getallheaders() as $name => $value) {
            $headers[$name] = $value;
		}
		if (isset($headers['Authorization'])){
			return $headers['Authorization'];
		} else {
			return '';
		}
    }


    //////////////////////////////////////////////////////////////////////
    //PARA: Date Should In YYYY-MM-DD Format
    //RESULT FORMAT:
    // '%y Year %m Month %d Day %h Hours %i Minute %s Seconds'    =>  1 Year 3 Month 14 Day 11 Hours 49 Minute 36 Seconds
    // '%y Year %m Month %d Day'                                =>  1 Year 3 Month 14 Days
    // '%m Month %d Day'                                        =>  3 Month 14 Day
    // '%d Day %h Hours'                                        =>  14 Day 11 Hours
    // '%d Day'                                                        =>  14 Days
    // '%h Hours %i Minute %s Seconds'                                =>  11 Hours 49 Minute 36 Seconds
    // '%i Minute %s Seconds'                                        =>  49 Minute 36 Seconds
    // '%h Hours                                                    =>  11 Hours
    // '%a Days                                                        =>  468 Days
    //////////////////////////////////////////////////////////////////////
    protected function dateDifference($date_1 , $date_2 , $differenceFormat = '%a' ){
        $datetime1 = date_create($date_1);
        $datetime2 = date_create($date_2);
        
        $interval = date_diff($datetime1, $datetime2);
        
        return $interval->format($differenceFormat);
        
    }

    public function checkFormatDate($date01){
        if(preg_match("/^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/",$date01)){
            return true; 
        }else{
            return false;
        }
    }


    /**
     * example for create pdf file
     * 
     * @param $data data for send to pdf
     * 
     * @return bool
     */
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
    public $staff_cat    = -1;
}

abstract class menuPermission{
    const error = -1;
    const read    = 1;
    const write    = 2;
}

if (!function_exists('getallheaders'))
{
    function getallheaders()
    {
        $headers = [];
       foreach ($_SERVER as $name => $value)
       {
           if (substr($name, 0, 5) == 'HTTP_')
           {
               $headers[str_replace(' ', '-', ucwords(strtolower(str_replace('_', ' ', substr($name, 5)))))] = $value;
           }
       }
       return $headers;
    }
}