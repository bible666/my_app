<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require('Origin001.php');

class SupplierController extends Origin001
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
		$supplier_code      = isset($data['supplier_code']) ? $data['supplier_code'] : -1;

		$result     = $this->_checkToken($token);
		//print_r($result);
        if($result->user_id > 0){
			$insert_data['active_flag']    	= false;
			$insert_data['update_date']     = date("Y-m-d H:i:s");
            $insert_data['update_user']     = $result->user_id;

            $this->db->where([
				'supplier_code'			=> $supplier_code
			]);
            $this->db->update('mst_supplier',$insert_data);
            
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
		$supplier_code         = isset($data['supplier_code']) ? $data['supplier_code'] : -1;

		$result     = $this->_checkToken($token);
		if($result->user_id > 0){
			$query_str = "
			SELECT *
			FROM mst_supplier
			WHERE supplier_code = :supplier_code
				AND active_flag = true
			";

			$itemn_data = $this->db->query($query_str,['supplier_code' => $supplier_code])->row();
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

				case "supplier_name":
					$strCond .= " LOWER(supplier_name) like '%".strtolower($val)."%' AND \n";	// placeholders
					break;
				case "supplier_code":
						$strCond .= " LOWER(supplier_code) like '%".strtolower($val)."%' AND \n";	// placeholders
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
			FROM mst_supplier
			WHERE ". $strCond." active_flag = true
			ORDER BY supplier_code
			LIMIT {$limit} OFFSET {$offset}
			";
			//print_r($query_str);exit;
			$query_count = "
			SELECT count(supplier_code) as my_count
			FROM mst_supplier
			WHERE ". $strCond." active_flag = true
			ORDER BY supplier_code
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
		$old_supplier_code  	= isset($data['old_supplier_code'])	? $data['old_supplier_code']	: -1;

		$supplier_code		= isset($data['supplier_code'])	? $data['supplier_code'] : '';
		$supplier_name		= isset($data['supplier_name'])	? $data['supplier_name'] : '';
		$addr1				= isset($data['addr1'])	? $data['addr1'] : '';
		$addr2				= isset($data['addr2'])	? $data['addr2'] : '';
		$addr3				= isset($data['addr3'])	? $data['addr3'] : '';
		$post_code			= isset($data['post_code'])	? $data['post_code'] : '';
		$tel_no				= isset($data['tel_no'])	? $data['tel_no'] : '';
		$fax_no				= isset($data['fax_no'])	? $data['fax_no'] : '';
		$e_mail				= isset($data['e_mail'])	? $data['e_mail'] : '';
		$contact			= isset($data['contact'])	? $data['contact'] : '';
		$delivery_time		= isset($data['delivery_time'])	? $data['delivery_time'] : 0;
		$tax_id				= isset($data['tax_id'])	? $data['tax_id'] : '';
		$payment_tearm		= isset($data['payment_tearm'])	? $data['payment_tearm'] : '';

		$remark         	= isset($data['remark'])		? $data['remark']       : '';


		//Validation Data
		if ( $token == '') {
			$dataDB['status']   = "error";
			$dataDB['message']  = "token is empty";
			$dataDB['data']     = "";
			$this->response($dataDB,200);
		}

		if ( $supplier_code == '') {
			$dataDB['status']   = "error";
			$dataDB['message']  = "?????????????";
			$dataDB['data']     = "";
			$this->response($dataDB,200);
		}

		if ( $supplier_name == '') {
			$dataDB['status']   = "error";
			$dataDB['message']  = "?????????????";
			$dataDB['data']     = "";
			$this->response($dataDB,200);
		}


		//get data from token
		$result     = $this->_checkToken($token);

		if($result->user_id > 0){

			if ($this->is_dupplicate_data($old_supplier_code,$supplier_code)){
				$dataDB['status']   = "error";
				$dataDB['message']  = "??????????????????????";
				$dataDB['data']     = "";
				$this->response($dataDB,200);

			}

			$insert_data = [];

			//$insert_data['m_company_id']    = $result->company_id;

			//set data to array for add or update
			$insert_data['supplier_code']		= $supplier_code;
			$insert_data['supplier_name']		= $supplier_name;
			$insert_data['addr1']				= $addr1;
			$insert_data['addr2']				= $addr2;
			$insert_data['addr3']				= $addr3;
			$insert_data['post_code']			= $post_code;
			$insert_data['tel_no']				= $tel_no;
			$insert_data['fax_no']				= $fax_no;
			$insert_data['e_mail']				= $e_mail;
			$insert_data['contact']				= $contact;
			$insert_data['delivery_time']		= $delivery_time;
			$insert_data['tax_id']				= $tax_id;
			$insert_data['payment_tearm']		= $payment_tearm;

            $insert_data['remark']				= $remark;
			$insert_data['active_flag']			= true;
			

			$this->db->trans_start();

			if ($old_item_code == '-1' ){
				$insert_data['create_date']        = date("Y-m-d H:i:s");
				$insert_data['create_user']        = $result->user_id;
				$this->db->insert('mst_supplier', $insert_data);
			}else{
				$insert_data['update_date']    = date("Y-m-d H:i:s");
				$insert_data['update_user']    = $result->user_id;

				$this->db->update('mst_supplier',$insert_data,['supplier_code' => $old_supplier_code]);
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
	private function is_dupplicate_data($old_supplier_code,$supplier_code){
		$is_check	= true;

		if ($old_supplier_code == $supplier_code)  {
			return false; // OK data
		}

		$data	= $this->db->get_where('mst_supplier',[
			'supplier_code'	=> $supplier_code,
			'supplier_code !=' => $old_supplier_code,
			'active_flag' => true
		])->row();

		if (isset($data)){

		} else {
			$is_check = false;
		}
		return $is_check;
	}

}

?>