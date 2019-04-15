<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require('Origin001.php');

class UserController extends Origin001
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper(array('form', 'url'));
        $this->load->helper('date');
        $this->load->database();
        $this->load->library('encrypt');
        
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

    public function login_post()
    {
        $data           = $this->post();
        $data           = json_decode($data[0]);

        //init data
        $user_login     = '';
        $user_password  = '';
        $token          = '';

        $dataDB['status'] = "error";
        $dataDB['message'] = "";
        $dataDB['data'] = "";

        //Get Data From Post
        if (isset($data->user_login)){
            $user_login     = $data->user_login;
        }

        if (isset($data->user_password)){
            $user_password  = $data->user_password;
        }

        $sql    = "SELECT * FROM m_staffs WHERE staff_login = ? AND del_flag = 0";
        $query  = $this->db->query($sql, array($user_login));
        $row    = $query->row_array();

        if (isset($row))
        {
            if ($user_password == $this->encrypt->decode($row['staff_pwd'])){
                $token = $this->_getGUID();

                $staff_id = $row['id'];

                //Clear Old Token Data
                $data = array('del_flag' => 1);
                $where = "m_staff_id = ".$staff_id." AND del_flag = 0";
                $str = $this->db->update('t_tokens', $data, $where);


                //insert New Token Data
                $TokenData['m_staff_id'] = $staff_id;
                $TokenData['token'] = $token;
                $TokenData['del_flag'] = 0;
                $this->db->insert('t_tokens',$TokenData);


                $result['token']        = $token;

                $dataDB['status']   = "success";
                $dataDB['message']  = "";
                $dataDB['data'] = $result;
            }
        }else{
            $dataDB['message'] = "not user.[".$user_login."]";
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