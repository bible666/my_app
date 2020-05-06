<?php
namespace App\Controllers;

use Config\App;

class LocationController extends Origin001
{
	protected $format    = 'json';
    
	protected $mst_factory;
	protected $mst_location;

	/**
	 * Constructure class
	 */
    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
	{

		// Do Not Edit This Line
		parent::initController($request, $response, $logger);

		//--------------------------------------------------------------------
		// Preload any models, libraries, etc, here.
		//--------------------------------------------------------------------
		// E.g.:
        // $this->session = \Config\Services::session();

		$this->mst_location        = $this->db->table('mst_location');
		$this->mst_factory        = $this->db->table('mst_factory');
		
	}

	/**
     * delete data by id
     */
    public function delete_data_by_id(){
		$data       = $this->request->getJSON();
 
        //init data
		$token				= $this->getAuthHeader();
		$location_cd        = isset($data->location_code) ? $data->location_code : -1;
        $factory_cd         = isset($data->factory_code) ? $data->factory_code : -1;

		$result     = $this->_checkToken($token);
		//print_r($result);
        if($result->user_id > 0){
			$insert_data['active_flag']    	= false;
			$insert_data['update_date']     = date("Y-m-d H:i:s");
            $insert_data['update_user']     = $result->user_id;

            $where = [
				'factory_code'			=> $factory_cd,
				'location_code'			=> $location_cd
			];
            $this->mst_location->update($insert_data,$where);
            
            $dataDB['status']   = "success";
            $dataDB['message']  = "";
            $dataDB['data']     = $data;

        }else{
            $dataDB['status']   = "error";
            $dataDB['message']  = "token not found";
            $dataDB['data']     = "";
        }
        return $this->respond($dataDB,200);
    }

	/**
	 * get data by id
	 */
	public function get_data_by_id(){
		$token		= $this->getAuthHeader();
		$data       = $this->request->getJSON();

		//init data
		$location_cd        = isset($data->location_code) ? $data->location_code : -1;
        $factory_cd         = isset($data->factory_code) ? $data->factory_code : -1;

		$result     = $this->_checkToken($token);
		if($result->user_id > 0){
			$query_str = "
			SELECT *
			FROM mst_location
			WHERE factory_code = :factory_cd:
				AND location_code = :location_cd:
				AND active_flag = true
			";

			$itemn_data = $this->db->query($query_str,['factory_cd'=>$factory_cd,'location_cd'=>$location_cd])->getRow();
			$dataDB['status']   = "success";
			$dataDB['message']  = $query_str;
			$dataDB['data']     = $itemn_data;

		}else{
			$dataDB['status']   = "error";
			$dataDB['message']  = "token not found";
			$dataDB['data']     = "";
		}
		return $this->respond($dataDB,200);
	}


	private function _getCond($s)
    {
        $strCond    = "";
		$params     = [];

        foreach ($s as $key =>$val) {

            if($val=="") continue;

            switch($key){
				//case "example":
				//		$strCond .= "(example == false OR example IS NULL) \n";	// placeholders
				//		//$params["{$key}"] = "%{$val}%";						// bindParam
				//    break;
				//case "start_date":
				//		$strCond .= "start_date >= :{$key} AND \n";	// placeholders
				//		$params["{$key}"] = "%{$val}%";				// bindParam
				//    break;
				//case "name":
				//		$strCond .= "name like :{$key} AND \n";		// placeholders
				//		$params["{$key}"] = "%{$val}%";				// bindParam
				//    break;

				case "location_name":
					$strCond .= " LOWER(location_name) like '%".strtolower($val)."%' AND \n";	// placeholders
					break;
				case "location_code":
						$strCond .= " LOWER(location_code) like '%".strtolower($val)."%' AND \n";	// placeholders
						break;
				case "rowsPerpage":
				case "page_index":
				case "sort":
				case "sort_preset":
				case "direction":
					break;
				default:
					$strCond .= "{$key}='{$val}' AND \n";	// placeholders		"key" = :key
					$params["{$key}"] = "{$val}";			// bindParam		"key"=>val
					break;
            }
        }

        return [$strCond,$params];
    }

	public function get_factory(){
		$token		= $this->getAuthHeader();

		$query_str = " SELECT * FROM mst_factory where active_flag = true";

		$itemn_data = $this->db->query($query_str)->getResult();

		$dataDB['status']   = "success";
		$dataDB['message']  = "";
		$dataDB['data']     = $itemn_data;

		return $this->respond($dataDB,200);
	}

	/**
	 * get list data
	 */
	public function get_data_list(){
		$data       = $this->request->getJSON();
		$token		= $this->getAuthHeader();

		//Validate Data


		$limit		= intval($data->rowsPerpage);
		$offset		= ($data->page_index-1) * $limit;

		$result     = $this->_checkToken($token);
		if($result->user_id >= 0){

			// ???? Condition
			list($strCond,$params) = $this->_getCond($data);


			$query_str = "
			SELECT *
			FROM mst_location
			WHERE ". $strCond." active_flag = true
			ORDER BY factory_code
			LIMIT {$limit} OFFSET {$offset}
			";
			//print_r($query_str);exit;
			$query_count = "
			SELECT count(location_code) as my_count
			FROM mst_location
			WHERE ". $strCond." active_flag = true
			ORDER BY factory_code,location_code
			";
			
			$itemn_data = $this->db->query($query_str,[$result->company_id])->getResult();

			$itemn_count = $this->db->query($query_count, [$result->company_id])->getResult();

			$dataDB['status']   = "success";
			$dataDB['message']  = "";
			$dataDB['data']     = $itemn_data;
			$dataDB['max_rows']	= $itemn_count[0]->my_count;

		}else{
			$dataDB['status']   = "error";
			$dataDB['message']  = "token not found";
			$dataDB['data']     = "";
		}
		return $this->respond($dataDB,200);
	}
	

	/**
	 * à¸µupdate / insert data to database
	 */
	public function update_data(){
		
		$token			= $this->getAuthHeader();
		$data           = $this->request->getJSON();
		
		//init data
		$old_location  		= isset($data->old_location)	? $data->old_location			: -1;
		$old_factory  		= isset($data->old_factory)	? $data->old_factory			: -1;

		
		$factory_code		= isset($data->factory_code)	? $data->factory_code : '';
		$location_code		= isset($data->location_code)	? $data->location_code : '';
		$location_name		= isset($data->location_name)	? $data->location_name : '';
		
        $mrp_flag             = isset($data->mrp_flag)		? $data->mrp_flag       : '';
        $expire_flag             = isset($data->expire_flag)		? $data->expire_flag       : '';
	
		$remark         	= isset($data->remark)		? $data->remark       : '';

		//Validation Data
		if ( $token == '') {
			$dataDB['status']   = "error";
			$dataDB['message']  = "token is empty";
			$dataDB['data']     = "";
			return $this->respond($dataDB,200);
		}

		if ( $location_name == '') {
			$dataDB['status']   = "error";
			$dataDB['message']  = "กรุณาระบุชื่อพื้นที่เก็บของ";
			$dataDB['data']     = "";
			return $this->respond($dataDB,200);
		}

		if ( $location_code == '') {
			$dataDB['status']   = "error";
			$dataDB['message']  = "กรุณาระบุรหัสพื้นที่เก็บของ";
			$dataDB['data']     = "";
			return $this->respond($dataDB,200);
		}


		//get data from token
		$result     = $this->_checkToken($token);
		
		if($result->user_id > 0){

			if ($this->is_dupplicate_data($old_factory,$old_location, $factory_code,$location_code)){
				$dataDB['status']   = "error";
				$dataDB['message']  = "รหัสนี้ใช้งานแล้ว";
				$dataDB['data']     = "";
				return $this->respond($dataDB,200);

			}

			$insert_data = [];

			//$insert_data['m_company_id']    = $result->company_id;

			//set data to array for add or update
			$insert_data['factory_code']	= $factory_code;
			$insert_data['location_code']	= $location_code;
			$insert_data['location_name']	= $location_name;
			$insert_data['mrp_flag']		= $mrp_flag;
            $insert_data['expire_flag']		= $expire_flag;
            $insert_data['remark']			= $remark;
			$insert_data['active_flag']		= true;
			

			$this->db->transStart();

			if ($old_location == '-1' ){
				$insert_data['create_date']        = date("Y-m-d H:i:s");
				$insert_data['create_user']        = $result->user_id;
				$this->mst_location->insert( $insert_data);
			}else{
				$insert_data['update_date']    = date("Y-m-d H:i:s");
				$insert_data['update_user']    = $result->user_id;

				$this->mst_location->update($insert_data,['factory_code' => $old_location, 'location_code' => $old_factory]);
			}
			$this->db->transComplete();

			$dataDB['status']   = "success";
			$dataDB['message']  = "";
			$dataDB['data']     = $insert_data;
		}else{
			$dataDB['status']   = "error";
			$dataDB['message']  = "token not found";
			$dataDB['data']     = "";
		}
		return $this->respond($dataDB,200);
	}

	/**
    * check suppliser code dupplicate
    *
    * @param $m_company_id company id
	* @param $currency_code currency code
    *
    * @return boolean true= dupplicate, false not dupplicate
    */
	private function is_dupplicate_data($old_factory,$old_location,$factory,$location){
		$is_check	= true;

		if (($old_location == $location) && ($old_factory == $factory)) {
			return false; // OK data
		}

		$data	= $this->mst_location->getWhere([
			'factory_code'	    => $factory,
			'factory_code !='   => $old_factory,
			'location_code'     => $location,
			'location_code != ' => $old_location,
			'active_flag'       => true
		])->getRow();

		if (isset($data)){

		} else {
			$is_check = false;
		}
		return $is_check;
	}
}

?>