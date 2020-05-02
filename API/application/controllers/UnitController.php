<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require('Origin001.php');

class UnitController extends Origin001
{
	/**
	 * Constructure class
	 */
	public function __construct()
	{
		parent::__construct();
		$this->load->helper('date');
		$this->load->database();
		
	}

	/**
     * delete data by id
     */
    public function delete_data_by_id_post(){
		$data       = $this->post();
 
        //init data
		$token				= $this->getAuthHeader();
		$unit_code         = isset($data['unit_code']) ? $data['unit_code'] : -1;

		$result     = $this->_checkToken($token);
		//print_r($result);
        if($result->user_id > 0){
			$insert_data['active_flag']    	= false;
			$insert_data['update_date']     = date("Y-m-d H:i:s");
            $insert_data['update_user']     = $result->user_id;

            $this->db->where([
				'unit_code'			=> $unit_code
			]);
            $this->db->update('mst_unit',$insert_data);
            
            $dataDB['status']   = "success";
            $dataDB['message']  = "";
            $dataDB['data']     = $data;

        }else{
            $dataDB['status']   = "error";
            $dataDB['message']  = "token not found";
            $dataDB['data']     = "";
        }
        $this->response($dataDB,200);
    }

	/**
	 * get data by id
	 */
	public function get_data_by_id_post(){
		$token		= $this->getAuthHeader();
		$data       = $this->post();

		//init data
		$unit_code         = isset($data['unit_code']) ? $data['unit_code'] : -1;
       
		$result     = $this->_checkToken($token);
		if($result->user_id > 0){
			$query_str = "
			SELECT *
			FROM mst_unit
			WHERE unit_code = '{$unit_code}'
				AND active_flag = true
			";

			$itemn_data = $this->db->query($query_str)->row();
			$dataDB['status']   = "success";
			$dataDB['message']  = $query_str;
			$dataDB['data']     = $itemn_data;

		}else{
			$dataDB['status']   = "error";
			$dataDB['message']  = "token not found";
			$dataDB['data']     = "";
		}
		$this->response($dataDB,200);
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

				case "unit_code":
					$strCond .= " LOWER(unit_code) like '%".strtolower($val)."%' AND \n";	// placeholders
					break;
				case "unit_name":
						$strCond .= " LOWER(unit_code) like '%".strtolower($val)."%' AND \n";	// placeholders
						break;
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
			FROM mst_unit
			WHERE ". $strCond." active_flag = true
			ORDER BY unit_code
			LIMIT {$limit} OFFSET {$offset}
			";
			//print_r($query_str);exit;
			$query_count = "
			SELECT count(factory_code) as my_count
			FROM mst_unit
			WHERE ". $strCond." active_flag = true
			ORDER BY unit_code
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
	 * à¸µupdate / insert data to database
	 */
	public function update_data_post(){
		$token			= $this->getAuthHeader();
		$data           = $this->post();

		//init data
		$old_unit_code  		= isset($data['old_unit_code'])	? $data['old_unit_code']	: -1;


		
		$unit_code		= isset($data['unit_code'])	? $data['unit_code'] : '';
		$unit_name		= isset($data['unit_name'])	? $data['unit_name'] : '';
	
		$remark         	= isset($data['remark'])		? $data['remark']       : '';

		//Validation Data
		if ( $token == '') {
			$dataDB['status']   = "error";
			$dataDB['message']  = "token is empty";
			$dataDB['data']     = "";
			$this->response($dataDB,200);
		}

		if ( $unit_code == '') {
			$dataDB['status']   = "error";
			$dataDB['message']  = "กรุณาระบุรหัสหน่วย";
			$dataDB['data']     = "";
			$this->response($dataDB,200);
		}

		if ( $unit_name == '') {
			$dataDB['status']   = "error";
			$dataDB['message']  = "กรุณาระบุชื่อหน่วย";
			$dataDB['data']     = "";
			$this->response($dataDB,200);
		}


		//get data from token
		$result     = $this->_checkToken($token);

		if($result->user_id > 0){

			if ($this->is_dupplicate_data($old_unit_code,$unit_code)){
				$dataDB['status']   = "error";
				$dataDB['message']  = "รหัสนี้ใช้งานแล้ว";
				$dataDB['data']     = "";
				$this->response($dataDB,200);

			}

			$insert_data = [];

			//$insert_data['m_company_id']    = $result->company_id;

			//set data to array for add or update
			$insert_data['unit_code']	= $unit_code;
			$insert_data['unit_name']	= $unit_name;
            $insert_data['remark']			= $remark;
			$insert_data['active_flag']		= true;
			

			$this->db->trans_start();

			if ($old_location == '-1' ){
				$insert_data['create_date']        = date("Y-m-d H:i:s");
				$insert_data['create_user']        = $result->user_id;
				$this->db->insert('mst_unit', $insert_data);
			}else{
				$insert_data['update_date']    = date("Y-m-d H:i:s");
				$insert_data['update_user']    = $result->user_id;

				$this->db->update('mst_unit',$insert_data,['unit_code' => $old_unit_code]);
			}
			$this->db->trans_complete();

			$dataDB['status']   = "success";
			$dataDB['message']  = "";
			$dataDB['data']     = $insert_data;
		}else{
			$dataDB['status']   = "error";
			$dataDB['message']  = "token not found";
			$dataDB['data']     = "";
		}
		$this->response($dataDB,200);
	}

	/**
    * check suppliser code dupplicate
    *
    * @param $m_company_id company id
	* @param $currency_code currency code
    *
    * @return boolean true= dupplicate, false not dupplicate
    */
	private function is_dupplicate_data($old_unit_code,$unit_code){
		$is_check	= true;

		if (($old_location == $location) && ($old_factory == $factory)) {
			return false; // OK data
		}

		$data	= $this->db->get_where('mst_unit',[
			'unit_code'	=> $unit_code,
			'unit_code !=' => $old_unit_code
		])->row();

		if (isset($data)){

		} else {
			$is_check = false;
		}
		return $is_check;
	}
}

?>