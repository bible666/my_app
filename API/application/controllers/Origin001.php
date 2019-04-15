<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH.'libraries/REST_Controller.php');
require(APPPATH.'libraries/PHPMailer-master/PHPMailerAutoload.php');


class Origin001 extends REST_Controller
{
	
	/**
	 * get menu perission for user
	 * 
	 * @param $menuId id from table m_menu_controls
	 * @param $userType user category
	 * 
	 * @return int
	 */
	protected function _getMenuPermission($menuId,$userType){
		$permission	= -1;
		$this->db->select('m_permission_id');
		$dataRow = $this->db->get_where('m_menu_staff_category',[
			'm_menu_control_id'		=> $menuId,
			'm_staff_category_id'	=> $userType
		])->row();

		if(isset($dataRow)){
			$permission	= $dataRow->m_permission_id;
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
			$tokenData->staff_cat	= $staff_data->staff_cat;
        }

        return $tokenData;
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
	public $staff_cat	= -1;
}

abstract class menuPermission{
	const error = -1;
	const read	= 1;
	const write	= 2;
}