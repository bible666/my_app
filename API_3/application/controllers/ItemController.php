<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require('Origin001.php');

class ItemController extends Origin001
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
		$item_code          = isset($data['item_code']) ? $data['item_code'] : -1;

		$result     = $this->_checkToken($token);
		//print_r($result);
        if($result->user_id > 0){
			$insert_data['active_flag']    	= false;
			$insert_data['update_date']     = date("Y-m-d H:i:s");
            $insert_data['update_user']     = $result->user_id;

            $this->db->where([
				'item_code'			=> $item_code
			]);
            $this->db->update('mst_item',$insert_data);
            
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
		$item_code         = isset($data['item_code']) ? $data['item_code'] : -1;

		$result     = $this->_checkToken($token);
		if($result->user_id > 0){
			$query_str = "
			SELECT *
			FROM mst_item
			WHERE item_code = '{$item_code}'
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

				case "item_name":
					$strCond .= " LOWER(item_name) like '%".strtolower($val)."%' AND \n";	// placeholders
					break;
				case "item_code":
						$strCond .= " LOWER(item_code) like '%".strtolower($val)."%' AND \n";	// placeholders
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
			FROM mst_item
			WHERE ". $strCond." active_flag = true
			ORDER BY item_code
			LIMIT {$limit} OFFSET {$offset}
			";
			//print_r($query_str);exit;
			$query_count = "
			SELECT count(item_code) as my_count
			FROM mst_item
			WHERE ". $strCond." active_flag = true
			ORDER BY item_code
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
		$old_item_code  	= isset($data['old_item_code'])	? $data['old_item_code']	: -1;

		$item_code		= isset($data['item_code'])	? $data['item_code'] : '';
		$item_name		= isset($data['item_name'])	? $data['item_name'] : '';
		$item_type		= isset($data['item_type'])	? $data['item_type'] : '';

		$lot_flag		= isset($data['lot_flag'])	? $data['lot_flag'] : -1;
		$unit_code		= isset($data['unit_code'])	? $data['unit_code'] : '';
		$production_lead_time		= isset($data['production_lead_time'])	? $data['production_lead_time'] : 0;
		$request_decimal		= isset($data['request_decimal'])	? $data['request_decimal'] : 0;

		$mrp_flag		= isset($data['mrp_flag'])	? $data['mrp_flag'] : false;
		$standard_location		= isset($data['standard_location'])	? $data['standard_location'] : '';
		

		$remark         	= isset($data['remark'])		? $data['remark']       : '';

		//Validation Data
		if ( $token == '') {
			$dataDB['status']   = "error";
			$dataDB['message']  = "token is empty";
			$dataDB['data']     = "";
			$this->response($dataDB,200);
		}

		if ( $item_name == '') {
			$dataDB['status']   = "error";
			$dataDB['message']  = "?????????????????????";
			$dataDB['data']     = "";
			$this->response($dataDB,200);
		}

		if ( $item_code == '') {
			$dataDB['status']   = "error";
			$dataDB['message']  = "?????????????????????";
			$dataDB['data']     = "";
			$this->response($dataDB,200);
		}


		//get data from token
		$result     = $this->_checkToken($token);

		if($result->user_id > 0){

			if ($this->is_dupplicate_data($old_item_code,$item_code)){
				$dataDB['status']   = "error";
				$dataDB['message']  = "??????????????????????????????";
				$dataDB['data']     = "";
				$this->response($dataDB,200);

			}

			$insert_data = [];

			//$insert_data['m_company_id']    = $result->company_id;

			//set data to array for add or update
			$insert_data['item_code']				= $item_code;
			$insert_data['item_name']				= $item_name;
			$insert_data['item_type']				= $item_type;
			$insert_data['lot_flag']				= $lot_flag;
			$insert_data['unit_code']				= $unit_code;
			$insert_data['standard_location']		= $standard_location;
			$insert_data['production_lead_time']	= $production_lead_time;
			$insert_data['request_decimal']			= $request_decimal;
			$insert_data['mrp_flag']				= $mrp_flag;

            $insert_data['remark']					= $remark;
			$insert_data['active_flag']				= true;
			

			$this->db->trans_start();

			if ($old_item_code == '-1' ){
				$insert_data['create_date']        = date("Y-m-d H:i:s");
				$insert_data['create_user']        = $result->user_id;
				$this->db->insert('mst_item', $insert_data);
			}else{
				$insert_data['update_date']    = date("Y-m-d H:i:s");
				$insert_data['update_user']    = $result->user_id;

				$this->db->update('mst_item',$insert_data,['item_code' => $old_item_code]);
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
	private function is_dupplicate_data($old_item_code,$item_code){
		$is_check	= true;

		if ($old_item_code == $item_code)  {
			return false; // OK data
		}

		$data	= $this->db->get_where('mst_item',[
			'item_code'	=> $item_code,
			'item_code !=' => $old_item_code
		])->row();

		if (isset($data)){

		} else {
			$is_check = false;
		}
		return $is_check;
	}

	public function get_unit_post(){
		$token		= $this->getAuthHeader();

		$query_str = " SELECT * FROM mst_unit where active_flag = true order by unit_code asc";

		$itemn_data = $this->db->query($query_str)->result();

		$dataDB['status']   = "success";
		$dataDB['message']  = "";
		$dataDB['data']     = $itemn_data;

		$this->response($dataDB,200);
	}
}

?>