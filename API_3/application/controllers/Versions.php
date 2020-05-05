<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH.'libraries/REST_Controller.php');


class Versions extends REST_Controller
{

    public function index_post()
    {
        $this->response("Version: 1.0.0.00000 Last updated: ".date("Y-m-d H:i:s"));
    }
}


