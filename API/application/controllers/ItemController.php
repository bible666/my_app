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
     * get data by id
     */
    public function get_data_by_id_post(){
        $data       = $this->post();

        //init data
        $token      = isset($data['token']) ? $data['token'] : '';
        $id         = isset($data['id']) ? $data['id'] : -1;

        $result     = $this->_checkToken($token);
        if($result->user_id > 0){
            $query_str = "
            SELECT *
            FROM item
            WHERE m_company_id = ? AND id = ?
                AND del_flag = 0
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
     * get data by code
     */
    public function get_data_by_code_post(){
        $data	= $this->post();
		$data			= json_decode($data[0]);

        //init data
        $token	= isset($data->token) ? $data->token : '';
        $code	= isset($data->code) ? $data->code : -1;

        $result     = $this->_checkToken($token);
        if($result->user_id > 0){
            $query_str = "
            SELECT *
            FROM m_item
            WHERE m_company_id = ? AND item_code = ?
            ";

            $itemn_data = $this->db->query($query_str, [$result->company_id,$code])->row();
            
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
		$data		= json_decode($data[0]);

        //init data
        $token      = isset($data['token']) ? $data['token'] : '';

        $result     = $this->_checkToken($token);
        if($result->user_id > 0){
            $query_str = "
            SELECT *
            FROM item
            WHERE m_company_id = ?
                AND del_flag = 0
            ";

            $itemn_data = $this->db->query($query_str, [$result->company_id])->result();
            
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
     * ีupdate / insert data to database
     */
    public function update_data_post(){
        $data           = $this->post();

        //init data
        $token          = isset($data['token']) ? $data['token'] : '';
        $id             = isset($data['id']) ? $data['id'] : '';
        $item_code      = isset($data['item_code']) ? $data['item_code'] : '';
        $item_name      = isset($data['item_name']) ? $data['item_name'] : '';
        $m_unit_id      = isset($data['m_unit_id']) ? $data['m_unit_id'] : 1;
        $m_item_type_id = isset($data['m_item_type_id']) ? $data['m_item_type_id'] : 1;
		$lot_flag       = isset($data['lot_flag']) ? $data['lot_flag'] : 0;
		$mrp_flag       = isset($data['lot_flag']) ? $data['mrp_flag'] : 0;
        $remark         = isset($data['remark']) ? $data['remark'] : '';

        //get data from token
        $result     = $this->_checkToken($token);

        if($result->user_id > 0){

            $insert_data = [];

            $insert_data['m_company_id']    = $result->company_id;
            $insert_data['item_code']       = $item_code;
            $insert_data['item_name']       = $item_name;
            $insert_data['m_unit_id']       = $m_unit_id;
            $insert_data['m_item_type_id']  = $m_item_type_id;
			$insert_data['lot_flag']        = $lot_flag;
			$insert_data['mrp_flag']		= $mrp_flag;
            $insert_data['remark']          = $remark;

            $this->db->trans_start();
            if ($id >= 0 ){
                $insert_data['created_date']   = date("Y-m-d H:i:s");
                $insert_data['created']        = $result->user_id;
                $this->db->insert('m_items', $insert_data);
            }else{
                $insert_data['updated_date']    = date("Y-m-d H:i:s");
                $insert_data['updated']         = $result->user_id;

                $this->db->where('id', $id);
                $this->db->update('m_items',$insert_data);
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
}

?>