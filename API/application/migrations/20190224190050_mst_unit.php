<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_unit extends CI_Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_unit(
                unit_code varchar(10) PRIMARY KEY,
                unit_name varchar(100) NOT NULL,

                remark       varchar(200),
                active_flag  int NOT NULL,

                create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT 
                
            );
        ");

    }

    public function down()
    {
        $this->dbforge->drop_table('mst_unit');
    }
}
?>