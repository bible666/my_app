<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_item extends CI_Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_item(
                item_id INT AUTO_INCREMENT PRIMARY KEY,
                item_cat INT NOT NULL,
                item_code VARCHAR(50) NOT NULL,
                description VARCHAR(200),
                contrast INT,
    
                create_date DATETIME NOT NULL,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT 
            )
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_item');
    }
}
?>