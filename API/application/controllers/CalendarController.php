<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require('Origin001.php');

class CalendarController extends Origin001
{
    /**
     * Constructure class
     */
    public function __construct()
    {
        parent::__construct();
        $this->load->helper(array('form', 'url'));
        $this->load->helper('date');
        $this->load->database();
        $this->load->library('encrypt');
        
    }

    /**
     * get company data
     */
    public function get_data_post(){
        $data       = $this->post();
        $token      = isset($data['token']) ? $data['token'] : '';
        $company_id = -1;

        $query_str = "
            SELECT c.*
            FROM t_tokens t INNER JOIN m_staffs s ON t.m_staff_id = s.id
                INNER JOIN m_companies c ON s.m_company_id = c.id
            WHERE t.token = ?
                AND t.del_flag = 0
        ";

        $company_data = $this->db->query($query_str, [$token])->row();

        if (isset($company_data)){
            //Remove Unuse data
            

            //return data
            $dataDB['status']   = "success";
            $dataDB['message']  = "";
            $dataDB['data']     = $company_data;
        }else{
            $dataDB['status']   = "error";
            $dataDB['message']  = "data not found";
            $dataDB['data']     = "";
        }

        $this->response($dataDB,200);
    }

    /**
     * insert / update company data
     */
    public function update_data_post()
    {
        $data = $this->post();

        $token		= $this->getAuthHeader();
        $id         = isset($data['id'])        ? $data['id']       : '';
        $cal_name   = isset($data['cal_no'])    ? $data['cal_no']   : '';
        $remark     = isset($data['remark'])    ? $data['remark']   : '';
        $holidays   = isset($data['holidays'])  ? $data['holidays'] : [];

        //validate data
        if ( $token == '') {
			$dataDB['status']   = "error";
			$dataDB['message']  = "token is empty";
			$dataDB['data']     = "";
			$this->response($dataDB,200);
        }
        
        if ( $cal_name == '') {
			$dataDB['status']   = "error";
			$dataDB['message']  = "กรุณากรอกชื่อปฏิทิน";
			$dataDB['data']     = "";
			$this->response($dataDB,200);
		}

        $result     = $this->_checkToken($token);

        if($result->user_id > 0){
            $this->db->trans_start();

            $insert_data = [];

            //set data to array for add or update
            $insert_data['cal_name']        = $cal_name;
            $insert_data['active_flag']     = true;
            $insert_data['remark']          = $remark;

            if ($id == '-1' ){
				$insert_data['create_date']        = date("Y-m-d H:i:s");
				$insert_data['create_user']        = $result->user_id;
                $this->db->insert('mst_calendar', $insert_data);
                $id = $this->db->insert_id();
			}else{
				$insert_data['update_date']    = date("Y-m-d H:i:s");
				$insert_data['update_user']    = $result->user_id;

				$this->db->where('cal_no', $id);
				$this->db->update('mst_calendar',$insert_data);
            }
            
            foreach($holidays as $holiday){
                $ar_holidays                    = [];
                $ar_holidays['cal_no']          = $id;
                $ar_holidays['cal_date']        = $holiday['holiday_date'];
                $ar_holidays['holiday_flag']    = true;
                $ar_holidays['remark']          = $holiday['holiday_name'];
                $ar_holidays['create_date']        = date("Y-m-d H:i:s");
				$ar_holidays['create_user']        = $result->user_id;
                $this->db->insert('mst_calendar_detail', $ar_holidays);
            }

            $this->db->trans_complete();

			$dataDB['status']   = "success";
			$dataDB['message']  = "บันทึกสำเร็จ";
			$dataDB['data']     = $insert_data;
        } else {
            $dataDB['status']   = "error";
            $dataDB['message']  = "token not found";
            $dataDB['data']     = "";
        }
        
        $this->response($dataDB,200);

    }
  
}




