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

    private function _getCond($s)
    {
        $strCond    = "";
		$params     = [];

        foreach ($s as $key =>$val) {

            if($val=="") continue;

            switch($key){
				//case "example":
				//		$strCond .= "(example == false OR example IS NULL) \n";	// placeholders
				//		//$params["{$key}"] = "%{$val}%";						// bindParam
				//    break;
				//case "start_date":
				//		$strCond .= "start_date >= :{$key} AND \n";	// placeholders
				//		$params["{$key}"] = "%{$val}%";				// bindParam
				//    break;
				//case "name":
				//		$strCond .= "name like :{$key} AND \n";		// placeholders
				//		$params["{$key}"] = "%{$val}%";				// bindParam
				//    break;
				case "rowsPerpage":
				case "page_index":
				case "sort":
				case "sort_preset":
				case "direction":
					break;
				default:
					$strCond .= "{$key}='{$val}' AND \n";	// placeholders		"key" = :key
					$params["{$key}"] = "{$val}";			// bindParam		"key"=>val
					break;
            }
        }

        return [$strCond,$params];
    }

    /**
	 * get list data
	 */
	public function get_data_list_post(){
		$data       = $this->post();
		$token		= $this->getAuthHeader();

		//Validate Data


		$limit		= intval($data['rowsPerpage']);
		$offset		= ($data['page_index']-1) * $limit;

		$result     = $this->_checkToken($token);
		if($result->user_id >= 0){

			// ???? Condition
			list($strCond,$params) = $this->_getCond($data);


			$query_str = "
			SELECT *
			FROM mst_calendar
			WHERE ". $strCond." active_flag = true
			ORDER BY cal_no
			LIMIT {$limit} OFFSET {$offset}
			";
			//print_r($query_str);exit;
			$query_count = "
			SELECT count(cal_no) as my_count
			FROM mst_calendar
			WHERE ". $strCond." active_flag = true
			";
			
			$itemn_data = $this->db->query($query_str,[$result->company_id])->result();

			$itemn_count = $this->db->query($query_count, [$result->company_id])->result();

			$dataDB['status']   = "success";
			$dataDB['message']  = "";
			$dataDB['data']     = $itemn_data;
			$dataDB['max_rows']	= $itemn_count[0]->my_count;

		}else{
			$dataDB['status']   = "error";
			$dataDB['message']  = "token not found";
			$dataDB['data']     = "";
		}
		$this->response($dataDB,200);
	}

    /**
     * 
     */
    private function _is_dupplicate($cal_no,$cal_name){
        $ret    = false;
        $query  = " SELECT * FROM mst_calendar WHERE cal_no <> ? AND cal_name = ? ";
        $data   = $this->db->query($query,[$cal_no,$cal_name])->row();
        if (isset($data)){
            $ret = true;
        }
        return $ret;
    }
    /**
     * insert / update  data
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
        
        if ($this->_is_dupplicate($id,$cal_name)){
            $dataDB['status']   = "error";
			$dataDB['message']  = "มีการใช้ชื่อปฏิทินนี้แล้วในระบบ";
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




