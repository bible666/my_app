<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require('Origin001.php');

class CustomerController extends Origin001
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
     * get data by id
     */
    public function get_data_by_id_post(){
        $data		= $this->post();
		$data		= json_decode($data[0]);

        //init data
        $token      = isset($data->token) ? $data->token : '';
        $id         = isset($data->id) ? $data->id : -1;

        $result     = $this->_checkToken($token);
        if($result->user_id > 0){
            $query_str	= "
            SELECT *
            FROM m_customers
            WHERE m_company_id = ? AND id = ?
                AND del_flag = 0
            ";

            $data	= $this->db->query($query_str, [$result->company_id,$id])->row();
			
			// if ( is_null($data) ){
			// 	//insert
			// 	$data	= [
			// 		'm_company_id'	=> $result->company_id,
			// 		'id'			=> $data->id,
			// 		'customer_cd'	=> $data->customer_cd,
			// 		'customer_name'	=> $data->customer_name,
			// 		'customer_add1'	=> $data->customer_add1,
			// 		'customer_add2'	=> $data->customer_add2,
			// 		'customer_add3'	=> $data->customer_add3,
			// 		'del_flag'		=> 0,
			// 		'created_date'	=> date('Y-m-d h:i:s'),
			// 		'created'		=> $result->user_id
			// 	];
			// 	$this->db->insert('m_item_types', $item_data);
			// } else {
			// 	//update
			// }
            $dataDB['status']   = "success";
            $dataDB['message']  = "";
            $dataDB['data']     = $data;

        }else{
            $dataDB['status']   = "error";
            $dataDB['message']  = "token not found";
            $dataDB['data']     = '';
        }
        $this->response($dataDB,200);
	}
	
	/**
     * get data by id
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
            $this->db->update('m_customers',$insert_data);
            
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
     * get list data
     */
    public function get_data_list_post(){
		$data	= $this->post();
		$data	= json_decode($data[0]);
		
        //init data
		$token      = isset($data->token) ? $data->token : '';
		$where		= '';

        $result     = $this->_checkToken($token);
        if($result->user_id > 0){
			//Setup Where Condition
			if (isset($data->customer_name)){
				$where .= " AND customer_name like '%".$data->customer_name."%' ";
			}

            $query_str = "
            SELECT *
            FROM m_customers
			WHERE  m_company_id = ?
                AND del_flag = 0
			";

			$query_str .= $where;
			
			if (isset($data->sort_column) && isset($data->sort_direction)){
				if ($data->sort_column !== '' && $data->sort_direction !== ''){
					$query_str .= " ORDER BY ". $data->sort_column . " ". $data->sort_direction;
				}else {
					$query_str .= " ORDER BY customer_cd asc ";
				}
			}else {
				$query_str .= " ORDER BY customer_cd asc ";
			}

			if (isset($data->page_size)){
				$query_str .= " LIMIT ". $data->page_size."  OFFSET ".($data->page_index * $data->page_size);
			}

			//print_r($query_str);
			//exit;
			$itemn_data = $this->db->query($query_str, [$result->company_id])->result();
			
			//Get All Record Data
			$query_count_str = "
            SELECT count(id) AS my_count
            FROM m_customers
            WHERE m_company_id = ?
                AND del_flag = 0
			";

			$count		= $this->db->query($query_count_str,[$result->company_id]);
			$count_row	=  $count->row();
			$count_num	= 0;
			if (isset($count_row)){
				$count_num	= $count_row->my_count;
			}
            
            $dataDB['status']		= "success";
            $dataDB['message']		= "";
			$dataDB['data']			= $itemn_data;
			$dataDB['data_count']	= $count_num;

        }else{
            $dataDB['status']		= "error";
            $dataDB['message']		= "token not found";
			$dataDB['data']			= "";
			$dataDB['data_count']	= -1;
        }
        $this->response($dataDB,200);
    }

    /**
     * update / insert data to database
     */
    public function update_data_post(){
        $data           = $this->post();
		$data			= json_decode($data[0]);
        //init data
        $token          = isset($data->token) ? $data->token : '';
		$id             = isset($data->id) ? $data->id : '';
		
		//get data from token
		$result     = $this->_checkToken($token);
		
		if($result->user_id <= 0){
			$dataDB['status']	= 'error';
			$dataDB['message']	= 'Token not found';
			$dataDB['data']		= [];
			$this->response($dataDB,200);
			exit;
		}

		//Set Data for this table
		$AR_data = [];
		$AR_data['m_company_id']    = $result->company_id;
		$AR_data['customer_cd']		= isset($data->customer_cd) ? $data->customer_cd : '';
		$AR_data['customer_name']	= isset($data->customer_name) ? $data->customer_name : '';
		$AR_data['customer_add1']	= isset($data->customer_add1) ? $data->customer_add1 : '';
		$AR_data['customer_add2']	= isset($data->customer_add2) ? $data->customer_add2 : '';
		$AR_data['customer_add3']	= isset($data->customer_add3) ? $data->customer_add3 : '';
		$AR_data['customer_zip']	= isset($data->customer_zip) ? $data->customer_zip : '';
		$AR_data['customer_tel']	= isset($data->customer_tel) ? $data->customer_tel : '';
		$AR_data['customer_fa']		= isset($data->customer_fa) ? $data->customer_fa : '';
		$AR_data['customer_email']	= isset($data->customer_email) ? $data->customer_email : '';
		$AR_data['contract_name']	= isset($data->contract_name) ? $data->contract_name : '';
		//$AR_data['delivery_time']	= isset($data->delivery_time) ? $data->delivery_time : '';
		//$AR_data['m_transport_id']	= isset($data->m_transport_id) ? $data->m_transport_id : '';
		$AR_data['tax_no']			= isset($data->tax_no) ? $data->tax_no : '';
		//$AR_data['payment_tearm']	= isset($data->payment_tearm) ? $data->payment_tearm : '';
		$AR_data['remark']			= isset($data->remark) ? $data->remark : '';
		$AR_data['del_flag']		= 0;//0 Active, 1 Inactive

        //get data from token
        $result     = $this->_checkToken($token);

        if($result->user_id > 0){

			$error	= $this->_validate($result->company_id,$AR_data,$id);
			if (count($error) > 0){
				$dataDB['status']	= 'error';
				$dataDB['message']	= $error;
				$dataDB['data']		= [];
				$this->response($dataDB,200);
				exit;
			}
            $this->db->trans_start();
            if ($id < 0 ){
                $AR_data['created_date']   = date("Y-m-d H:i:s");
                $AR_data['created']        = $result->user_id;
                $this->db->insert('m_customers', $AR_data);
            }else{
                $AR_data['updated_date']    = date("Y-m-d H:i:s");
                $AR_data['updated']         = $result->user_id;

                $this->db->where('id', $id);
                $this->db->update('m_customers',$AR_data);
            }
            $this->db->trans_complete();
			$message	= [];
			$message[]	= 'บันทึกสำเร็จ';
            $dataDB['status']   = "success";
            $dataDB['message']  = $message;
            $dataDB['data']     = $AR_data;
        }else{
			$message	= [];
			$message[]	= 'token not found';
            $dataDB['status']   = "error";
            $dataDB['message']  = $message;
            $dataDB['data']     = "";
        }
        $this->response($dataDB,200);
    }

	
	/**
	 * Validate Data Befor Insert / Update
	 * 
	 * @param $companyId
	 * @param $AR_data Data For check
	 * 
	 * @return Array[] Error
	 */
	private function _validate($companyId,$AR_data,$id){
		//init data
		$error		= [];

		//check empty data
		if ($AR_data['customer_cd'] == ''){
			$error[]	= 'รหัสลูกค้าห้ามเป็นค่าว่าง';
		}

		//check unit code same in DB
		$query_str	= "
            SELECT *
            FROM m_customers
            WHERE m_company_id = ? AND customer_cd = ? AND id <> ?
                AND del_flag = 0
            ";

        $item_data	= $this->db->query($query_str, [$companyId,$AR_data['customer_cd'],$id])->row();
		if ( !is_null($item_data) ){
			$error[]	= 'มีชื่อลูกค้า['.$AR_data['customer_cd'].']นี้แล้วในระบบ';
		}

		return $error;
	}

}

?>