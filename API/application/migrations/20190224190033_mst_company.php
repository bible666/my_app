<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_company extends CI_Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_company(
                company_id INT AUTO_INCREMENT PRIMARY KEY,
                company_name_e varchar(100) ,
                company_name_t varchar(100) ,
                addr_1 varchar(100),
                addr_2 varchar(100),
                addr_3 varchar(100),
                tel_no varchar(50),
                fax_no varchar(50),
                mail_addr varchar(50),

                create_date DATETIME NOT NULL,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT 
            )
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_company');
    }
}
?>