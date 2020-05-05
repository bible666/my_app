<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require('Origin001.php');

class DropdownController extends Origin001
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
     * get list data
     */
    public function get_data_combo_post(){
        $data       = $this->post();
		$data		= json_decode($data[0]);

        //init data
		$token		= isset($data->token) ? $data->token : '';

		$colVal		= isset($data->colVal) ? $data->colVal : '';
		$colDisplay	= isset($data->colDisplay) ? $data->colDisplay : '';
		$tableName	= isset($data->tableName) ? $data->tableName : '';

		$whereCondition	= isset($data->whereCondition) ? $data->whereCondition : '';
		$orderBy		= isset($data->orderBy) ? $data->orderBy : '';


		$searchCode	= isset($data->searchCode) ? $data->searchCode : '';
		$searchName	= isset($data->searchName) ? $data->searchName : '';

        $result     = $this->_checkToken($token);
        if($result->user_id > 0){
            $query_str = "
            SELECT id,".$colVal." as code, ". $colDisplay . " as display
            FROM ".$tableName."
            WHERE m_company_id = ? AND ".$colVal." like '%".$searchCode."%' AND ".$colDisplay." like '%".$searchName."%'
			";
			
			if ($whereCondition <> '') {
				$query_str .= " AND " . $whereCondition;
			}

			if ($orderBy <> '') {
				$query_str .= " ORDER BY " . $orderBy;
			}

			$query_str .= " LIMIT 5";

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
     * get data by code
     */
    public function get_data_by_code_post(){
        $data	= $this->post();
		$data			= json_decode($data[0]);

        //init data
        $token				= isset($data->token) ? $data->token : '';
		$code				= isset($data->code) ? $data->code : -1;
		$col_display		= isset($data->col_display) ? $data->col_display : '';
		$col_value			= isset($data->col_value) ? $data->col_value : '';
		$table_name			= isset($data->table_name) ? $data->table_name : '';
		$where_condition	= isset($data->where_condition) ? $data->where_condition : '';
		$order_by			= isset($data->order_by) ? $data->order_by : '';

        $result     = $this->_checkToken($token);
        if($result->user_id > 0){
            $query_str = "
            SELECT id,".$col_value.",".$col_display."
            FROM ".$table_name."
            WHERE m_company_id = ? AND ".$col_value." = ?
			";
			
			if ($where_condition <> '' ) {
				$query_str .= " AND ". $where_condition;
			}

			if ( $order_by <> '') {
				$query_str .= " ORDER BY ". $order_by;
			}

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

}

?>