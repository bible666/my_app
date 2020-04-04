<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_currency extends CI_Migration {

    public function up()
    {
        $this->db->query("
    CREATE TABLE mst_currency(
        currency_id INT AUTO_INCREMENT PRIMARY KEY,
        currency_code VARCHAR(10),
        description VARCHAR(255),
        create_date DATETIME NOT NULL,
        update_date DATETIME ,
        create_user INT NOT NULL,
        update_user INT 
    )
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_currenct');
    }
}
?>