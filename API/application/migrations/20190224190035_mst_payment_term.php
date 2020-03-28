<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_payment_term extends CI_Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_payment_term(
                term_id INT AUTO_INCREMENT PRIMARY KEY,
                term_name varchar(200),
                term_day int,

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