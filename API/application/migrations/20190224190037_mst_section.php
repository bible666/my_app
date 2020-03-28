<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_section extends CI_Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_section(
                section_code varchar(10) PRIMARY KEY,
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
        $this->dbforge->drop_table('mst_section');
    }
}
?>