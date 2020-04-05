<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require('Origin001.php');

class CurrencyController extends Origin001
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
		$data		= json_decode($data[0]);

        //init data
        $token      = isset($data->token) ? $data->token : '';
        $id         = isset($data->id) ? $data->id : -1;

		$result     = $this->_checkToken($token);
		//print_r($result);
        if($result->user_id > 0){
			$insert_data['del_flag']    	= 1;
			$insert_data['updated_date']    = date("Y-m-d H:i:s");
            $insert_data['updated']         = $result->user_id;

            $this->db->where([
				'id'			=> $id,
				'm_company_id'	=> $result->company_id
			]);
            $this->db->update('m_suppliers',$insert_data);
            
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
			FROM mst_currency
			WHERE currency_code = '{$id}'
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

				case "currency_code":
					$strCond .= " LOWER(currency_code) like '%".strtolower($val)."%' AND \n";	// placeholders
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
			FROM mst_currency
			WHERE ". $strCond." active_flag = true
			ORDER BY currency_code
			LIMIT {$limit} OFFSET {$offset}
			";
			//print_r($query_str);exit;
			$query_count = "
			SELECT count(currency_code) as my_count
			FROM mst_currency
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
	 * ีupdate / insert data to database
	 */
	public function update_data_post(){
		$token			= $this->getAuthHeader();
		$data           = $this->post();

		//init data
		$id  		        = isset($data['id'])				? $data['id']				: -1;
		$currency_code      = isset($data['currency_code'])		? $data['currency_code']	: -1;
		$currency_name		= isset($data['currency_name'])		? $data['currency_name']	: '';
		$default_currency	= isset($data['default_currency'])	? $data['default_currency']	: false;
		$remark         	= isset($data['remark'])			? $data['remark']			: '';

		//Validation Data
		if ( $token == '') {
			$dataDB['status']   = "error";
			$dataDB['message']  = "token is empty";
			$dataDB['data']     = "";
			$this->response($dataDB,200);
		}

		if ( $currency_code == '') {
			$dataDB['status']   = "error";
			$dataDB['message']  = "???????????????????????????";
			$dataDB['data']     = "";
			$this->response($dataDB,200);
		}

		if ( $currency_name == '') {
			$dataDB['status']   = "error";
			$dataDB['message']  = "???????????????????????????????";
			$dataDB['data']     = "";
			$this->response($dataDB,200);
		}

		//get data from token
		$result     = $this->_checkToken($token);

		if($result->user_id > 0){

			if ($this->chk_currency_code($result->company_id,$currency_code,$id)){
				$dataDB['status']   = "error";
				$dataDB['message']  = "???????????????????";
				$dataDB['data']     = "";
				$this->response($dataDB,200);

			}

			$insert_data = [];

			//$insert_data['m_company_id']    = $result->company_id;

			//set data to array for add or update
			$insert_data['currency_code']		= $currency_code;
			$insert_data['currency_name']		= $currency_name;
			$insert_data['default_currency']	= $default_currency;
			$insert_data['active_flag']			= true;
			$insert_data['remark']				= $remark;

			$this->db->trans_start();

			if ($default_currency == true){
				$update_data['update_date']    		= date("Y-m-d H:i:s");
				$update_data['update_user']    		= $result->user_id;
				$update_data['default_currency']    = false;

				$this->db->update('mst_currency',$update_data);
			}
			if ($id == '-1' ){
				$insert_data['create_date']        = date("Y-m-d H:i:s");
				$insert_data['create_user']        = $result->user_id;
				$this->db->insert('mst_currency', $insert_data);
			}else{
				$insert_data['update_date']    = date("Y-m-d H:i:s");
				$insert_data['update_user']    = $result->user_id;

				$this->db->where('currency_code', $id);
				$this->db->update('mst_currency',$insert_data);
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