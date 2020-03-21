<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_unit extends CI_Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_unit(
                unit_code VARCHAR(10) PRIMARY KEY,
                description VARCHAR(100) ,
                
                create_date DATETIME NOT NULL,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT 
            )
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_unit');
    }
}
?>