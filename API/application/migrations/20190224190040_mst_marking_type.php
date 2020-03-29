<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_marking_type extends CI_Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_marking_type(
                mark_type_id INT AUTO_INCREMENT PRIMARY KEY,
                type_name varchar(50),
                description varchar(200),

                create_date DATETIME NOT NULL,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT 
            )
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_marking_type');
    }
}
?>