<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require('Origin001.php');
require('shared.php');

class UserController extends Origin001
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper(array('form', 'url'));
        $this->load->helper('date');
        $this->load->database();
        $this->load->library('encryption');
        
	}
	
	public function checkToken_post(){
		$data		= $this->post();
		$data		= json_decode($data);

		//init data
		$token      = isset($data->token) ? $data->token : '';
		$result     = $this->_checkToken($token);

		if($result->user_id > 0 ){
			//token active
			$dataDB['status']   = "success";
            $dataDB['message']  = "";
            $dataDB['data']     = '';
		} else {
			$dataDB['status']   = "error";
            $dataDB['message']  = "token not found or you don't have permission";
            $dataDB['data']     = '';
		}

		$this->response($dataDB,200);
	}

	public function getMenu_post(){
		$data		= $this->post();
		$data		= json_decode($data[0]);

        //init data
		$token      = isset($data->token) ? $data->token : '';
		$result     = $this->_checkToken($token);

		if($result->user_id > 0 ){

			$ret_menu_data = [];

			$sql = "
			SELECT a.*
			FROM m_menu_controls a inner join m_menu_staff_category b on a.id = b.m_menu_control_id
				INNER JOIN m_staffs c on b.m_staff_category_id = c.staff_cat
			WHERE c.m_company_id = ? and c.id = ? AND a.menu_level = 1
			ORDER BY a.menu_seq
			";

			$item_data	= $this->db->query($sql, [$result->company_id,$result->user_id])->result();

			foreach($item_data as $menuData){
				$menu1 = [];
				$menu1['name']	= $menuData->menu_name;
				$menu1['URL']	= $menuData->URL;
				$menu1['image']	= $menuData->image;
				//get sub menu level 2
				$sql2 = "
					SELECT a.*
					FROM m_menu_controls a inner join m_menu_staff_category b on a.id = b.m_menu_control_id
						INNER JOIN m_staffs c on b.m_staff_category_id = c.staff_cat
					WHERE c.m_company_id = ? and c.id = ? AND a.menu_level = 2 AND a.parent_menu_id = ?
					ORDER BY a.menu_seq
				";

				$menu_data2	= $this->db->query($sql2, [$result->company_id,$result->user_id,$menuData->id])->result();

				$subMenu = [];
				foreach($menu_data2 as $menuData2){
					$menu2 = [];
					$menu2['name']	= $menuData2->menu_name;
					$menu2['URL']	= $menuData2->URL;
					$menu2['image']	= $menuData2->image;

					$subMenu[] = $menu2;
				}

				$menu1['children']	= $subMenu;

				$ret_menu_data[]	= $menu1;
			}

			$dataDB['status']   = "success";
            $dataDB['message']  = "";
            $dataDB['data']     = $ret_menu_data;
		} else {
			$dataDB['status']   = "error";
            $dataDB['message']  = "token not found or you don't have permission";
            $dataDB['data']     = '';
		}
		$this->response($dataDB,200);
	}

    public function login_post() {

        $data           = $this->post();

        $headers = [];
        foreach (getallheaders() as $name => $value) {
            $headers[$name] = $value;
        }

        //init data
        $user_login     = '';
        $user_password  = '';
        $token          = '';

        $dataDB['status']   = "error";
        $dataDB['message']  = "";
        $dataDB['data']     = "";

        //Get Data From Post
        if (isset($data['user_login']) == 1){//$data['user_login']
            $user_login     = $data['user_login'];
        }

        if (isset($data['user_password'])){
            $user_password  = $data['user_password'];
        }
       
        $sql    = "SELECT * FROM mst_user WHERE login_id = ? AND active_flag = 1";
        $query  = $this->db->query($sql, $user_login);
        $row    = $query->row_array();
        //print_r($sql);
        if (isset($row)) {
            //print_r($row);
            //$my = $this->encryption->decrypt($row['staff_pwd']);
            //if ($user_password == $this->encryption->decrypt($row['staff_pwd'])) {

            $nowData = strtotime(date("Y-m-d H:i:s"));
            $diff_time = round(abs($nowData - strtotime($row['last_ng_time'])) / 60,2);
            if ($row['ng_count'] >= max_system::max_login_count && $diff_time <= max_system::max_lock_login_time_mininus){
                
                
                $dataDB['message'] = 'คุณ login เกินจำนวนครั้งที่กำหนด กรุณาลองใหม่อีกครั้งหลังผ่่าน 30 นาที';//.$headers['Authorization'];
            } else if ($user_password == $row['user_password']) {
                $token = $this->_getGUID();

                $staff_id = $row['user_id'];

                //Clear Old Token Data
                $data = array('del_flag' => 1);
                $where = "m_staff_id = ".$staff_id." AND del_flag = 0";
                $str = $this->db->update('prg_token', $data, $where);


                //insert New Token Data
                $TokenData['user_id']	= $staff_id;
                $TokenData['token_code']			= $token;
				$TokenData['active_flag']		= 0;
				$TokenData['create_date']	= date("Y-m-d H:i:s");
                $this->db->insert('prg_token',$TokenData);


                $result['token']        = $token;

                $dataDB['status']   = "success";
                $dataDB['message']  = "";
                $dataDB['data'] = $result;
            } else {

                $user_update = [
                    'last_ng_time'  => date("Y-m-d H:i:s"),
                    'update_date'   => date("Y-m-d H:i:s"),
                    'ng_count'      => $row['ng_count'] + 1
                ];
                $this->db->set($user_update);
                $this->db->where('user_id',$row['user_id']);
                $this->db->update('mst_user');
				$dataDB['message'] = "not user22.[".$user_login."]".time();//.$my;//.$this->encryption->encrypt('password');
			}
        }else{
            $dataDB['message'] = "not user.";//.$headers['Authorization'];
        }

        $this->response($dataDB,200);

    }

    private function _getGUID(){
        mt_srand((double)microtime()*10000);//optional for php 4.2.0 and up.
       $charid = strtoupper(md5(uniqid(rand(), true)));
       $hyphen = chr(45);// "-"
       $uuid = substr($charid, 0, 8)
           .substr($charid, 8, 4)
           .substr($charid,12, 4)
           .substr($charid,16, 4)
           .substr($charid,20,12);// "}"
       return $uuid;
    }
}

?>