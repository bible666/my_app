<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require('Origin001.php');

class CompanyController extends Origin001
{
    /**
     * Constructure class
     */
    public function __construct()
    {
        parent::__construct();
        $this->load->helper(array('form', 'url'));
        $this->load->helper('date');
        $this->load->database();
        $this->load->library('encrypt');
        
    }

    /**
     * get company data
     */
    public function get_data_post(){
        $data       = $this->post();
        $token      = isset($data['token']) ? $data['token'] : '';
        $company_id = -1;

        $query_str = "
            SELECT c.*
            FROM t_tokens t INNER JOIN m_staffs s ON t.m_staff_id = s.id
                INNER JOIN m_companies c ON s.m_company_id = c.id
            WHERE t.token = ?
                AND t.del_flag = 0
        ";

        $company_data = $this->db->query($query_str, [$token])->row();

        if (isset($company_data)){
            //Remove Unuse data
            

            //return data
            $dataDB['status']   = "success";
            $dataDB['message']  = "";
            $dataDB['data']     = $company_data;
        }else{
            $dataDB['status']   = "error";
            $dataDB['message']  = "data not found";
            $dataDB['data']     = "";
        }

        $this->response($dataDB,200);
    }

    /**
     * insert / update company data
     */
    public function update_data_post()
    {
        $data = $this->post();
        $id = $data['id'];
        unset($data['id']);

        if ($id == -1){
            $data['created_date']   = date("Y-m-d H:i:s");
            $data['created']        = 1;

            $this->db->trans_start();

            $this->db->insert('m_companies', $data);

            $id = $this->db->insert_id();

            //-----------------------------------
            // insert item type
            //-----------------------------------
            $data_item_type['m_company_id']     = $id;
            $data_item_type['item_type_name']   = 'Product';
            $data_item_type['sorted']           = 1;
            $data_item_type['del_flag']         = 0;
            $data_item_type['created_date']     = date("Y-m-d H:i:s");
            $data_item_type['created']          = 1;
            $this->db->insert('m_item_types', $data_item_type);

            $data_item_type['m_company_id']     = $id;
            $data_item_type['item_type_name']   = 'Work In Process';
            $data_item_type['sorted']           = 2;
            $data_item_type['del_flag']         = 0;
            $data_item_type['created_date']     = date("Y-m-d H:i:s");
            $data_item_type['created']          = 1;
            $this->db->insert('m_item_types', $data_item_type);

            $data_item_type['m_company_id']     = $id;
            $data_item_type['item_type_name']   = 'Material';
            $data_item_type['sorted']           = 3;
            $data_item_type['del_flag']         = 0;
            $data_item_type['created_date']     = date("Y-m-d H:i:s");
            $data_item_type['created']          = 1;
            $this->db->insert('m_item_types', $data_item_type);

            //-----------------------------------
            // insert unit
            //-----------------------------------
            $data_unit['m_company_id']          = $id;
            $data_unit['unit_code']             = 'CM';
            $data_unit['unit_name']             = 'cm.';
            $data_unit['remark']                = 'เซนติเมตร';
            $data_unit['del_flag']              = 0;
            $data_item_type['created_date']     = date("Y-m-d H:i:s");
            $data_item_type['created']          = 1;
            $this->db->insert('m_units', $data_unit);

            $data_unit['m_company_id']          = $id;
            $data_unit['unit_code']             = 'KG';
            $data_unit['unit_name']             = 'kg.';
            $data_unit['remark']                = 'กิโลกรัม';
            $data_unit['del_flag']              = 0;
            $data_item_type['created_date']     = date("Y-m-d H:i:s");
            $data_item_type['created']          = 1;
            $this->db->insert('m_units', $data_unit);

            $data_unit['m_company_id']          = $id;
            $data_unit['unit_code']             = 'MT';
            $data_unit['unit_name']             = 'm.';
            $data_unit['remark']                = 'เมตร';
            $data_unit['del_flag']              = 0;
            $data_item_type['created_date']     = date("Y-m-d H:i:s");
            $data_item_type['created']          = 1;
            $this->db->insert('m_units', $data_unit);

            $data_unit['m_company_id']          = $id;
            $data_unit['unit_code']             = 'PS';
            $data_unit['unit_name']             = 'pcs.';
            $data_unit['remark']                = 'ชิ้น';
            $data_unit['del_flag']              = 0;
            $data_item_type['created_date']     = date("Y-m-d H:i:s");
            $data_item_type['created']          = 1;
            $this->db->insert('m_units', $data_unit);

            //-----------------------------------
            // insert staff
            //-----------------------------------
            $data_staff['m_company_id']         = $id;
            $data_staff['staff_no']             = 'A00001';
            $data_staff['title']                = 1;
            $data_staff['sur_name']             = 'ผู้ดูแลระบบ';
            $data_staff['given_name']           = 'ระบบ';
            $data_staff['staff_cat']            = 1;
            $data_staff['join_date']            = now();
            $data_staff['staff_login']          = 'admin'.str_pad($id, 4, "0", STR_PAD_LEFT) ;
            $data_staff['staff_pwd']            = $this->encrypt->encode('password');
            $data_staff['m_user_group_id']      = 1;
            $data_staff['del_flag']             = 0;
            $data_item_type['created_date']     = date("Y-m-d H:i:s");
            $data_item_type['created']          = 1;
            $this->db->insert('m_staffs', $data_staff);

            $this->db->trans_complete();
        }else{
            $data['updated_date']   = date("Y-m-d H:i:s");
            $data['updated']        = 1;

            $this->db->trans_start();

            $this->db->where('id', $id);
            $this->db->update('m_companies',$data);

            $this->db->trans_complete();
        }

        $this->response($data,200);

    }
  
}




