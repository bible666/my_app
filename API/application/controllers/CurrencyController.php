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
		$data       = $this->post();
		$data		= json_decode($data[0]);

		//init data
		$token      = isset($data->token) ? $data->token : '';
		$id         = isset($data->id) ? $data->id : -1;

		$result     = $this->_checkToken($token);
		if($result->user_id > 0){
			$query_str = "
			SELECT s.*
			FROM m_suppliers s
			WHERE s.m_company_id = ? AND s.id = ?
				AND s.del_flag = 0
			";

			$itemn_data = $this->db->query($query_str, [$result->company_id,$id])->row();
			
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
			$query_str = "
			SELECT *
			FROM mst_currency
			ORDER BY currency_code
			LIMIT {$limit} OFFSET {$offset}
			";

			$query_count = "
			SELECT count(currency_code) as my_count
			FROM mst_currency
			";
			
			$itemn_data = $this->db->query($query_str, [$result->company_id])->result();

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
		$token		= $this->getAuthHeader();
		$data           = $this->post();

		//init data
		$id             = isset($data['id'])				? $data['id']				: -1;
		$supplier_cd	= isset($data['supplier_cd'])		? $data['supplier_cd']		: '';
		$supplier_name	= isset($data['supplier_name'])		? $data['supplier_name']	: '';
		$supplier_add1	= isset($data['supplier_add1'])		? $data['supplier_add1']	: '';
		$supplier_add2	= isset($data['supplier_add2'])		? $data['supplier_add2']	: '';
		$supplier_add3	= isset($data['supplier_add3'])		? $data['supplier_add3']	: '';
		$supplier_zip	= isset($data['supplier_zip'])		? $data['supplier_zip']		: '';
		$supplier_tel	= isset($data['supplier_tel'])		? $data['supplier_tel']		: '';
		$supplier_fax	= isset($data['supplier_fax'])		? $data['supplier_fax']		: '';
		$supplier_email	= isset($data['supplier_email'])	? $data['supplier_email']	: '';
		$contract_name	= isset($data['contract_name'])		? $data['contract_name']	: '';
		$delivery_time	= isset($data['delivery_time'])		? $data['delivery_time']	: -1;
		$m_transport_id	= isset($data['m_transport_id'])	? $data['m_transport_id']	: -1;
		$tax_no			= isset($data['tax_no'])			? $data['tax_no']			: '';
		$payment_tearm	= isset($data['payment_tearm'])		? $data['payment_tearm']	: '';
		$remark         = isset($data['remark'])			? $data['remark']			: '';

		//Validation Data
		if ( $token == '') {
			$dataDB['status']   = "error";
			$dataDB['message']  = "token is empty";
			$dataDB['data']     = "";
			$this->response($dataDB,200);
		}

		if ( $supplier_cd == '') {
			$dataDB['status']   = "error";
			$dataDB['message']  = "supplier code is empty";
			$dataDB['data']     = "";
			$this->response($dataDB,200);
		}

		if ( $supplier_name == '') {
			$dataDB['status']   = "error";
			$dataDB['message']  = "supplier name is empty";
			$dataDB['data']     = "";
			$this->response($dataDB,200);
		}

		//get data from token
		$result     = $this->_checkToken($token);

		if($result->user_id > 0){

			if ($this->chk_suppliser_cd($result->company_id,$supplier_cd,$id)){
				$dataDB['status']   = "error";
				$dataDB['message']  = "supplier_code_dupplicate";
				$dataDB['data']     = "";
				$this->response($dataDB,200);
				exit;
			}

			$insert_data = [];

			$insert_data['m_company_id']    = $result->company_id;

			//set data to array for add or update
			$insert_data['supplier_cd']		= $supplier_cd;
			$insert_data['supplier_name']	= $supplier_name;
			$insert_data['supplier_add1']	= $supplier_add1;
			$insert_data['supplier_add2']	= $supplier_add2;
			$insert_data['supplier_add3']	= $supplier_add3;
			$insert_data['supplier_zip']	= $supplier_zip;
			$insert_data['supplier_tel']	= $supplier_tel;
			$insert_data['supplier_fax']	= $supplier_fax;
			$insert_data['supplier_email']	= $supplier_email;
			$insert_data['contract_name']	= $contract_name;
			$insert_data['delivery_time']	= $delivery_time;
			$insert_data['m_transport_id']	= $m_transport_id;
			$insert_data['tax_no']			= $tax_no;
			$insert_data['payment_tearm']	= $payment_tearm;
			$insert_data['remark']			= $remark;

			$this->db->trans_start();
			if ($id < 0 ){
				$insert_data['created_date']   = date("Y-m-d H:i:s");
				$insert_data['created']        = $result->user_id;
				$this->db->insert('m_suppliers', $insert_data);
			}else{
				$insert_data['updated_date']    = date("Y-m-d H:i:s");
				$insert_data['updated']         = $result->user_id;

				$this->db->where('id', $id);
				$this->db->update('m_suppliers',$insert_data);
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
	* @param $supplier_cd suppliser code
	* @param $suppliser_id suppliser id
    *
    * @return boolean
    */
	private function chk_suppliser_cd($m_company_id,$supplier_cd,$suppliser_id){
		$is_check	= true;

		$suppliser_data	= $this->db->get_where('m_suppliers',[
			'm_company_id'	=> $m_company_id,
			'supplier_cd'	=> $supplier_cd,
			'del_flag'		=> 0,
			'id != '		=> $suppliser_id
		])->row();

		if (isset($suppliser_data)){

		} else {
			$is_check = false;
		}
		return $is_check;
	}
}

?>