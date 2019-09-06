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
		$permission	= $this->_getMenuPermission(8,$result->staff_cat);

        if($result->user_id > 0 && $permission !== menuPermission::error){
            $query_str	= "
            SELECT *, ? as permission
            FROM m_units
            WHERE m_company_id = ? AND id = ?
                AND del_flag = 0
            ";

            $item_data	= $this->db->query($query_str, [$permission,$result->company_id,$id])->row();
			
			if ( is_null($item_data) ){
				//not have unit data
				//return error
				$dataDB['status']   = "error";
				$dataDB['message']  = "data not found";
				$dataDB['data']     = '';
			} else {
				//have unit data
				$dataDB['status']   = "success";
				$dataDB['message']  = "";
				$dataDB['data']     = $item_data;
			}
            

        }else{
            $dataDB['status']   = "error";
            $dataDB['message']  = "token not found or you don't have permission";
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
		$permission	= $this->_getMenuPermission(8,$result->staff_cat);

        if($result->user_id > 0 && $permission == menuPermission::write){
			
			$data	= $this->db->update(
				'm_units',
				['del_flag'	=> 1],
				['id'=>$id,'m_company_id' => $result->company_id]
			);
            
            $dataDB['status']   = "success";
            $dataDB['message']  = "";
            $dataDB['data']     = $data;

        }else{
            $dataDB['status']   = "error";
            $dataDB['message']  = "token not found or you don't have permission";
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
		$permission	= $this->_getMenuPermission(8,$result->staff_cat);
        if($result->user_id > 0 && $permission !== menuPermission::error){
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

			$query_data_str = $query_str;
			if (isset($data->page_size)){
				$query_data_str .= " LIMIT ". $data->page_size."  OFFSET ".($data->page_index * $data->page_size);
			}

			$itemn_data = $this->db->query($query_data_str, [$result->company_id])->result();
			
			//Get All Record Data
			$count_num	= $this->db->query($query_str, [$result->company_id])->num_rows();
            
            $dataDB['status']		= "success";
            $dataDB['message']		= "";
			$dataDB['data']			= $itemn_data;
			$dataDB['data_count']	= $count_num;

        }else{
            $dataDB['status']		= "error";
            $dataDB['message']		= "token not found or you don't have permission";
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
		$unit_code      = isset($data->unitCode) ? $data->unitCode : '';
		$unit_name      = isset($data->unitName) ? $data->unitName : '';
        $remark         = isset($data->remark) ? $data->remark : '';

        //get data from token
		$result     = $this->_checkToken($token);
		$permission	= $this->_getMenuPermission(8,$result->staff_cat);

        if($result->user_id > 0 && $permission == menuPermission::write){

            $insert_data = [];

            $insert_data['m_company_id']    = $result->company_id;
            $insert_data['unit_code']       = $unit_code;
            $insert_data['unit_name']       = $unit_name;
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
                $this->db->insert('m_units', $insert_data);
            }else{
                $insert_data['updated_date']    = date("Y-m-d H:i:s");
                $insert_data['updated']         = $result->user_id;

                $this->db->where([
					'id' =>  $id, 
					'm_company_id' => $result->company_id
				]);
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
			$message[]	= "token not found or you don't have permission";
            $dataDB['status']   = "error";
            $dataDB['message']  = $message;
            $dataDB['data']     = "";
        }
        $this->response($dataDB,200);
    }

	/**
	 * validate data befor save
	 * 
	 * @param $companyId company id from user
	 * @param $id id of update/insert table
	 * 
	 * @return int
	 */
	private function _validate($companyId,$unitData,$id){
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
            WHERE m_company_id = ? AND unit_code = ? AND id <> ?
                AND del_flag = 0
            ";

        $item_data	= $this->db->query($query_str, [
			$companyId,
			$unitData['unit_code'
		],$id])->row();

		if ( !is_null($item_data) ){
			$error[]	= 'มีรหัสข้อมูลวัตถุดิบ['.$unitData['unit_code'].']นี้แล้วในระบบ';
		}

		return $error;
	}

}


?>