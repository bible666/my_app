<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_status extends CI_Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_status(
                status_id INT PRIMARY KEY,
                status_name VARCHAR(100) ,
                product_flag INT,
                jig_tool_flag INT,
                create_date DATETIME NOT NULL,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT 
            )
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_user_group');
    }
}
?>