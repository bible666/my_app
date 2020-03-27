<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_supplier extends CI_Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_supplier(
                supplier_id INT AUTO_INCREMENT PRIMARY KEY,
                supplier_code VARCHAR(50) NOT NULL,
                supplier_name_e VARCHAR(200),
                supplier_name_t VARCHAR(200),
                addr_1 VARCHAR(100),
                addr_2 VARCHAR(100),
                addr_3 VARCHAR(100),
                telno VARCHAR(50),
                faxno VARCHAR(50),
                mail_addr VARCHAR(100),
                contact_name VARCHAR(100),
                term_id int,
                
                create_date DATETIME NOT NULL,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT 
            )
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_supplier');
    }
}
?>