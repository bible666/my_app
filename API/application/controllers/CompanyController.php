<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require('Origin001.php');

class CompanyController extends Origin001
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
        $token		= $this->getAuthHeader();
        $id         = isset($data['id']) ? $data['id'] : -1;

		$result     = $this->_checkToken($token);
		//print_r($result);
        if($result->user_id > 0){
			$insert_data['active_flag']    	= false;
			$insert_data['update_date']     = date("Y-m-d H:i:s");
            $insert_data['update_user']     = $result->user_id;

            $this->db->where([
				'company_code'			=> $id,
			]);
            $this->db->update('mst_company',$insert_data);
            
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
		$id         = isset($data['id']) ? $data['id'] : -1;

		$result     = $this->_checkToken($token);
		if($result->user_id > 0){
			$query_str = "
			SELECT *
			FROM mst_company
			WHERE company_code = '{$id}'
				AND active_flag = true
			";

			$itemn_data = $this->db->query($query_str)->row();
			$dataDB['status']   = "success";
			$dataDB['message']  = "";
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

				case "company_name":
					$strCond .= " LOWER(company_name) like '%".strtolower($val)."%' AND \n";	// placeholders
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

	public function get_calendar_post(){
		$token		= $this->getAuthHeader();

		$query_str = " SELECT * FROM mst_calendar where active_flag = true";

		$itemn_data = $this->db->query($query_str)->result();

		$dataDB['status']   = "success";
		$dataDB['message']  = "";
		$dataDB['data']     = $itemn_data;

		$this->response($dataDB,200);
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
			FROM mst_company
			WHERE ". $strCond." active_flag = true
			ORDER BY company_code
			LIMIT {$limit} OFFSET {$offset}
			";
			//print_r($query_str);exit;
			$query_count = "
			SELECT count(company_code) as my_count
			FROM mst_company
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
	 * à¸µupdate / insert data to database
	 */
	public function update_data_post(){
		$token			= $this->getAuthHeader();
		$data           = $this->post();

		//init data
		$id  		        = isset($data['id'])			? $data['id']			: -1;
		$company_code		= isset($data['company_code'])	? $data['company_code'] : '';
        $company_name		= isset($data['company_name'])	? $data['company_name'] : '';
        $addr_1             = isset($data['addr_1'])		? $data['addr_1']       : '';
        $addr_2             = isset($data['addr_2'])		? $data['addr_2']       : '';
        $addr_3             = isset($data['addr_3'])		? $data['addr_3']       : '';
        $zip                = isset($data['zip'])           ? $data['zip']          : '';
        $telno              = isset($data['telno'])         ? $data['telno']        : '';
        $faxno              = isset($data['faxno'])         ? $data['faxno']        : '';
        $email              = isset($data['email'])         ? $data['email']        : '';
		$cal_no             = isset($data['cal_no'])        ? $data['cal_no']       : null;
		$remark         	= isset($data['remark'])		? $data['remark']       : '';

		//Validation Data
		if ( $token == '') {
			$dataDB['status']   = "error";
			$dataDB['message']  = "token is empty";
			$dataDB['data']     = "";
			$this->response($dataDB,200);
		}

		if ( $company_name == '') {
			$dataDB['status']   = "error";
			$dataDB['message']  = "???????????????????????????";
			$dataDB['data']     = "";
			$this->response($dataDB,200);
		}


		//get data from token
		$result     = $this->_checkToken($token);

		if($result->user_id > 0){

			// if ($this->chk_currency_code($result->company_id,$currency_code,$id)){
			// 	$dataDB['status']   = "error";
			// 	$dataDB['message']  = "???????????????????";
			// 	$dataDB['data']     = "";
			// 	$this->response($dataDB,200);

			// }

			$insert_data = [];

			//$insert_data['m_company_id']    = $result->company_id;

			//set data to array for add or update
			$insert_data['company_code']	= $company_code;
			$insert_data['company_name']	= $company_name;
			$insert_data['addr_1']		= $addr_1;
            $insert_data['addr_2']		= $addr_2;
            $insert_data['addr_3']		= $addr_3;
            $insert_data['zip']			= $zip;
            $insert_data['telno']		= $telno;
            $insert_data['faxno']		= $faxno;
            $insert_data['email']		= $email;
            $insert_data['cal_no']		= $cal_no;
			$insert_data['active_flag']	= true;
			$insert_data['remark']		= $remark;

			$this->db->trans_start();

			if ($id == '-1' ){
				$insert_data['create_date']        = date("Y-m-d H:i:s");
				$insert_data['create_user']        = $result->user_id;
				$this->db->insert('mst_company', $insert_data);
			}else{
				$insert_data['update_date']    = date("Y-m-d H:i:s");
				$insert_data['update_user']    = $result->user_id;

				$this->db->where('company_code', $id);
				$this->db->update('mst_company',$insert_data);
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
    * @return boolean
    */
	private function chk_currency_code($m_company_id,$currency_code,$old_currency){
		$is_check	= true;

		if ($currency_code == $old_currency) {
			return false; // OK data
		}

		$currency_data	= $this->db->get_where('mst_currency',[
			'currency_code'	=> $currency_code
		])->row();

		if (isset($currency_data)){

		} else {
			$is_check = false;
		}
		return $is_check;
	}
}

?>