<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_user extends CI_Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_user(
                user_id INT PRIMARY KEY,
                employee_id VARCHAR(50) ,
                login_id	VARCHAR(100) NOT NULL,
                user_password VARCHAR(200) NOT NULL,
                user_level_id int REFERENCES mst_user_level (level_id),
                user_group_id int REFERENCES mst_user_group (user_group_id),
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