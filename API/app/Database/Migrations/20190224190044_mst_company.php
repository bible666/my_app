<?php
namespace App\Database\Migrations;

class Migration_mst_company extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_company(
                company_code varchar(10) PRIMARY KEY,
                company_name varchar(100),
                addr_1       varchar(200),
                addr_2       varchar(200),
                addr_3       varchar(200),
                zip          varchar(20),
                telno        varchar(50),
                faxno        varchar(50),
                email        varchar(100),
                cal_no       int,
                remark varchar(200),
                active_flag int NOT NULL,

                create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT 
            );
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_company');
    }
}
?>