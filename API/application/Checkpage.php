<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH.'libraries/REST_Controller.php');


class Checkpage extends REST_Controller
{

    public function index_post()
    {
        $data = $this->post();

        if(isset($data['token']) && $data['token'] <> "" && isset($data['path']) && $data['path'] <> ""){ //check post data
            $token = $data['token'];
            $path = $data['path'];

            $this->load->database();
            $user_id = 0;
            $query = $this->db->query("
                SELECT d.*,f.*
                FROM tokens a, users b, user_types c, user_type_menu_permissions d, menus f
                WHERE a.token_id = '".$token."' AND a.status = '1' 
                AND a.user_id = b.user_id AND b.user_type_id = c.user_type_id 
                AND c.user_type_id = d.user_type_id AND d.menu_id = f.menu_id AND f.path = '".$path."'
            ");

            $dbData = new db_class();

            $count = 0;
            foreach ($query->result() as $row){	
                    $count++;
            }
            
            if($count > 0){ //check db data
                $dbData->status = "success";
                $dbData->message = "";
                $statusData = new status_class();
                $statusData->permission = "true";
                array_push($dbData->data,$statusData);

                $this->addTokenTransactions($token,"Checkpage","token=".$token."&path=".$path);
            }else{ //check db data
                $dbData->status = "error";
                $dbData->message = "checking error.";
            } //check db data

        }else{ //check post data
            $dbData->status = "error";
            $dbData->message = "post data is null.";
        } //check post data

        $this->response($dbData,200);

    }
 

    private function addTokenTransactions($token,$service_name,$input_p){
		$TokenData = array(
			'token_id' 	        => $token,
			'call_date'	        => date("Y-m-d H:i:s"),
			'service_name'		=> $service_name,
			'input_parameter'	=> $input_p
		);			
		$this->db->insert('token_transactions',$TokenData);
    }

}

class db_class{
    public $status =   '';
    public $message =   '';
    public $data = [];
}

class status_class{
    public $permission =   '';
}
