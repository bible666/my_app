<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_process extends CI_Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_process(
                process_code VARCHAR(50) PRIMARY KEY,
                process_name_en VARCHAR(255) NOT NULL,
                process_name_th VARCHAR(255) NOT NULL,
                process_name_cost VARCHAR(50) ,
                status_id INT,
                section_code VARCHAR(4),
                wipidcs VARCHAR(1),
                screen_id   VARCHAR(1),
                plan_group VARCHAR(50),
                qc_tag_id   INT,
    
                create_date DATETIME NOT NULL,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT 
            )
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_process');
    }
}
?>