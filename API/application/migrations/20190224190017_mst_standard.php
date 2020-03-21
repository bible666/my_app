<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_standard extends CI_Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_standard(
                standard_id INT AUTO_INCREMENT PRIMARY KEY,
                standard_name VARCHAR(100) ,
                use_flag    bool default true,
                
                create_date DATETIME NOT NULL,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT 
            )
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_standard');
    }
}
?>