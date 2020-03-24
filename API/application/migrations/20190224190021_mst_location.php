<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_location extends CI_Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_location(
                location_id INT AUTO_INCREMENT PRIMARY KEY,
                location_code varchar(10) ,
                description VARCHAR(100) ,
                relate_cat INT,
                relate_id INT,
                stock_summary INT,
                report_for_acc INT,
                
                create_date DATETIME NOT NULL,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT 
            )
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_location');
    }
}
?>