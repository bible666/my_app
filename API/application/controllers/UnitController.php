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
            FROM m_units
            WHERE m_company_id = ? AND id = ?
                AND del_flag = 0
            ";

            $item_data	= $this->db->query($query_str, [$result->company_id,$id])->row();
			
			if ( is_null($item_data) ){
				//insert
				$item_data	= [
					'm_company_id'	=> $result->company_id,
					'unit_code'		=> $data->unitCode,
					'unit_name'		=> $data->unitName,
					'remark'		=> '',
					'del_flag'		=> 0,
					'created_date'	=> date('Y-m-d h:i:s'),
					'created'		=> $result->user_id
				];
				$this->db->insert('m_units', $item_data);
			} else {
				//update
			}
            $dataDB['status']   = "success";
            $dataDB['message']  = "";
            $dataDB['data']     = $item_data;

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

        //init data
        $token      = isset($data['token']) ? $data['token'] : '';
        $id         = isset($data['id']) ? $data['id'] : -1;

        $result     = $this->_checkToken($token);
        if($result->user_id > 0){
			
			$data	= $this->db->delete('m_units',['id'=>$id]);
            
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
			if (isset($data->unit_code)){
				$where .= " AND unit_code like '%".$data->unit_code."%' ";
			}

			if (isset($data->unit_name)){
				$where .= " AND unit_name like '%".$data->unit_name."%'";
			}


            $query_str = "
            SELECT *
            FROM m_units
			WHERE  m_company_id = ?
                AND del_flag = 0
			";

			$query_str .= $where;
			
			if (isset($data->sort_column) && isset($data->sort_direction)){
				if ($data->sort_column !== '' && $data->sort_direction !== ''){
					$query_str .= " ORDER BY ". $data->sort_column . " ". $data->sort_direction;
				}else {
					$query_str .= " ORDER BY unit_code asc ";
				}
			}else {
				$query_str .= " ORDER BY unit_code asc ";
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
            FROM m_units
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
		$data	= json_decode($data[0]);
        //init data
        $token          = isset($data->token) ? $data->token : '';
		$id             = isset($data->id) ? $data->id : '';
		$unit_code      = isset($data->unitCode) ? $data->unitCode : '';
		$unit_name      = isset($data->unitName) ? $data->unitName : '';
        $remark         = isset($data->remark) ? $data->remark : '';

        //get data from token
        $result     = $this->_checkToken($token);

        if($result->user_id > 0){

			
            $insert_data = [];

            $insert_data['m_company_id']    = $result->company_id;
            $insert_data['unit_code']       = $unit_code;
            $insert_data['unit_name']       = $unit_name;
			$insert_data['remark']          = $remark;
			$insert_data['del_flag']		= 0;//0 Active, 1 Inactive

			$error	= $this->_validate($result->company_id,$insert_data);
			if (count($error) > 0){
				$dataDB['status']	= 'error';
				$dataDB['message']	= $error;
				$dataDB['data']		= [];
				$this->response($dataDB,200);
				exit;
			}
            $this->db->trans_start();
            if ($id < 0 ){
                $insert_data['created_date']   = date("Y-m-d H:i:s");
                $insert_data['created']        = $result->user_id;
                $this->db->insert('m_units', $insert_data);
            }else{
                $insert_data['updated_date']    = date("Y-m-d H:i:s");
                $insert_data['updated']         = $result->user_id;

                $this->db->where('id', $id);
                $this->db->update('m_units',$insert_data);
            }
            $this->db->trans_complete();
			$message	= [];
			$message[]	= 'บันทึกสำเร็จ';
            $dataDB['status']   = "success";
            $dataDB['message']  = $message;
            $dataDB['data']     = $insert_data;
        }else{
			$message	= [];
			$message[]	= 'token not found';
            $dataDB['status']   = "error";
            $dataDB['message']  = $message;
            $dataDB['data']     = "";
        }
        $this->response($dataDB,200);
    }

	private function _validate($companyId,$unitData){
		//init data
		$error		= [];

		//check empty data
		if ($unitData['unit_code'] == ''){
			$error[]	= 'รหัสข้อมูลวัตถุดิบห้ามเป็นค่าว่าง';
		}

		//check unit code same in DB
		$query_str	= "
            SELECT *
            FROM m_units
            WHERE m_company_id = ? AND unit_code = ?
                AND del_flag = 0
            ";

        $item_data	= $this->db->query($query_str, [$companyId,$unitData['unit_code']])->row();
		if ( !is_null($item_data) ){
			$error[]	= 'มีรหัสข้อมูลวัตถุดิบ['.$unitData['unit_code'].']นี้แล้วในระบบ';
		}

		return $error;
	}


}


?>