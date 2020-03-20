<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_action extends CI_Migration {

    public function up()
    {
        $this->db->query("
    CREATE TABLE mst_action(
        action_id INT AUTO_INCREMENT PRIMARY KEY,
        action_code VARCHAR(50),
        description VARCHAR(255),
        create_date VARCHAR(14) NOT NULL,
        update_date VARCHAR(14) ,
        create_user INT NOT NULL,
        update_user INT 
    )
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_action');
    }
}
?>