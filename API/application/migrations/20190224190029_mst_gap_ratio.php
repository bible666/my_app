<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_gap_ratio extends CI_Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_gap_ratio(
                gap_ratio_id INT AUTO_INCREMENT PRIMARY KEY,
                gap_ratio_code varchar(100) ,
                
                create_date DATETIME NOT NULL,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT 
            )
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_gap_ratio');
    }
}
?>