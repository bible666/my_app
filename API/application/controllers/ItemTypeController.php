<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require('Origin001.php');

class ItemTypeController extends Origin001
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
            FROM m_item_types
            WHERE m_company_id = ? AND id = ?
                AND del_flag = 0
            ";

            $item_data	= $this->db->query($query_str, [$result->company_id,$id])->row();
			
			if ( is_null($item_data) ){
				//insert
				$dataDB['status']   = "error";
				$dataDB['message']  = "data_not_found";
				$dataDB['data']     = '';
			} else {
				//update
				$dataDB['status']   = "success";
				$dataDB['message']  = "";
				$dataDB['data']     = $item_data;
			}
            

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
            $this->db->update('m_item_types',$insert_data);
            
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
			if (isset($data->item_type_name)){
				$where .= " AND item_type_name like '%".$data->item_type_name."%' ";
			}

            $query_str = "
            SELECT *
            FROM m_item_types
			WHERE  m_company_id = ?
                AND del_flag = 0
			";

			$query_str .= $where;
			
			if (isset($data->sort_column) && isset($data->sort_direction)){
				if ($data->sort_column !== '' && $data->sort_direction !== ''){
					$query_str .= " ORDER BY ". $data->sort_column . " ". $data->sort_direction;
				}else {
					$query_str .= " ORDER BY sorted asc ";
				}
			}else {
				$query_str .= " ORDER BY sorted asc ";
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
            FROM m_item_types
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
		$item_type_name	= isset($data->item_type_name) ? $data->item_type_name : '';
        $remark         = isset($data->remark) ? $data->remark : '';

        //get data from token
        $result     = $this->_checkToken($token);

        if($result->user_id > 0){

            $insert_data = [];

            $insert_data['m_company_id']    = $result->company_id;
            $insert_data['item_type_name']	= $item_type_name;
			$insert_data['remark']          = $remark;
			$insert_data['del_flag']		= 0;//0 Active, 1 Inactive

			$error	= $this->_validate($result->company_id,$insert_data,$id);
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
                $this->db->insert('m_item_types', $insert_data);
            }else{
                $insert_data['updated_date']    = date("Y-m-d H:i:s");
                $insert_data['updated']         = $result->user_id;

                $this->db->where('id', $id);
                $this->db->update('m_item_types',$insert_data);
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

	private function _validate($companyId,$unitData,$id){
		//init data
		$error		= [];

		//check empty data
		if ($unitData['item_type_name'] == ''){
			$error[]	= 'ประเภทข้อมูลวัตถุดิบห้ามเป็นค่าว่าง';
		}

		//check unit code same in DB
		$query_str	= "
            SELECT *
            FROM m_item_types
            WHERE m_company_id = ? AND item_type_name = ? AND id <> ?
                AND del_flag = 0
            ";

        $item_data	= $this->db->query($query_str, [$companyId,$unitData['item_type_name'],$id])->row();
		if ( !is_null($item_data) ){
			$error[]	= 'มีประเภทข้อมูลวัตถุดิบ['.$unitData['item_type_name'].']นี้แล้วในระบบ';
		}

		return $error;
	}


}


?>