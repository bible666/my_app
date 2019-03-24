<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH.'libraries/REST_Controller.php');


class News extends REST_Controller
{
    public function index_get()
    {
        $newCat = new VersionObj();
        $newCat->id = "1";
        $newCat->name = "golf";
        $newCat->sex = "male";
        
        $this->response($newCat,200);
    }

    public function index_post()
    {
        $this->load->database();
        $data = $this->post();
        $iCount = 0;
		
        $dataDB = [];
        $sv_id = $data['sv_id'];
        
        if (!is_numeric($sv_id)){
			$dataDB['status_db'] = 'error';
		}else{
            $query = $this->db->query('SELECT * FROM service_version WHERE id > '.$sv_id);

            $iCount = 0;
            
            foreach ($query->result() as $row)
            {
                $newCat = new VersionObj();
                $newCat->id = $row->id;
                $newCat->version = $row->version;
                $newCat->core = $row->core;
                $newCat->zip = $row->zip;
                $newCat->date_update = $row->releasedate;
                $newCat->status = $row->status;

                array_push($dataDB,$newCat);
                $iCount += 1;
            } 
            //$dataDB['sv_id'] = $strWhere;
            $dataDB['status_db'] = 'success';
            $dataDB['count'] = $iCount;
        }

        $this->response($dataDB,200);
    }

    public function index_put()
    {
        // สร้างรายการข่าวใหม่
    }

    public function index_delete()
    {
        // ลบรายการข่าว
    }


}

class VersionObj
{
        public $id = -1;
        public $version = '';
        public $core = '';
	    public $zip = '';
        public $date_update = '';
        public $status = '';
}
