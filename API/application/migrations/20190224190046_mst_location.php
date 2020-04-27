<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_location extends CI_Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_location(
                factory_code varchar(10) REFERENCES mst_factory (factory_code),
                location_code varchar(10),
                location_name varchar(100),
                mrp_flag int,
                expire_flag int,

                remark       varchar(200),
                active_flag  int NOT NULL,

                create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT ,
                PRIMARY KEY( 
                    factory_code ASC,
                    location_code ASC
                )
            );
        ");

    }

    public function down()
    {
        $this->dbforge->drop_table('mst_location');
    }
}
?>