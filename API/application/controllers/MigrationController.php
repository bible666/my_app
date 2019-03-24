<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require('Origin001.php');

class MigrationController extends Origin001
{
    /**
     * Constructure class
     */
    public function __construct()
    {
        parent::__construct();
        $this->load->library('migration');

    }

    public function last_version_post()
    {
        if ($this->migration->latest() === FALSE)
        {
            show_error($this->migration->error_string());
        }
    }

    public function to_version_post()
    {
        $data       = $this->post();

        //init data
        $version      = isset($data['version']) ? $data['version'] : '';
        if ($this->migration->latest() === FALSE)
        {
            show_error($this->migration->error_string());
        }
    }
}
?>