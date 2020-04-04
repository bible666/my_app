<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_user extends CI_Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_user(
                user_id INT AUTO_INCREMENT PRIMARY KEY,
                title int not null,
                first_name varchar(100),
                last_name varchar(100),
                staff_cat int NOT NULL,
                join_date date ,
                employee_id VARCHAR(50) ,
                login_id	VARCHAR(100) NOT NULL,
                user_password VARCHAR(200) NOT NULL,
                user_group_id int not null,
                remark varchar(200) ,
                active_flag bool,

                last_login_time DATETIME,
                last_ng_time DATETIME,
                ng_count INT DEFAULT 0,
                account_loack bool,

                create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT 
            );
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_user_group');
    }
}
?>