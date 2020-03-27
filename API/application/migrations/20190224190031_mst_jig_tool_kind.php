<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_jig_tool_kind extends CI_Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_jig_tool_kind(
                jig_tool_kind_id INT AUTO_INCREMENT PRIMARY KEY,
                jig_tool_kind_name varchar(100) ,
                description varchar(100) ,
                
                create_date DATETIME NOT NULL,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT 
            )
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_jig_tool_kind');
    }
}
?>