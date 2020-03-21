<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_user_level extends CI_Migration {

    public function up()
    {
        $this->db->query("
			CREATE TABLE mst_user_level(
				level_id INT PRIMARY KEY,
				level_name VARCHAR(100),
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