<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_supplier extends CI_Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_supplier(
                supplier_code varchar(50) PRIMARY KEY,
                supplier_name varchar(200) NOT NULL,
                addr1 varchar(200) ,
                addr2 varchar(200),
                addr3 varchar(200),
                post_code varchar(10),
                tel_no varchar(50),
                fax_no varchar(50),
                e_mail varchar(100),
                contact varchar(100),
                delivery_time int,
                tax_id varchar(20),
                payment_tearm varchar(200),

                remark       varchar(200),
                active_flag  int NOT NULL,

                create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT 
                
            );

        ");

    }

    public function down()
    {
        $this->dbforge->drop_table('mst_supplier');
    }
}
?>