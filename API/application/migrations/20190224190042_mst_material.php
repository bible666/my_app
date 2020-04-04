<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_material extends CI_Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_material(
                mat_code        varchar(50) PRIMARY KEY,
                cost_code       varchar(50),
                purchase_code   varchar(50),
                description     varchar(200),
                status_id       int,
                color_id        int,
                size            decimal(18,2),
                tape_width      decimal(18,2),
                tape_thick      decimal(18,3),
                tape_c          varchar(50),
                compount_s      varchar(50),
                drain_wire_no   varchar(50),
                drain_wire_size decimal(18,2),
                mat_kind        varchar(50),
                wip_code_conductor  varchar(50),
                wip_code_insulation varchar(50),
                wip_code_ins_screen varchar(50),
                wip_code_ind_shield varchar(50),
                wip_code_core_std   varchar(50),
                compound_name       varchar(50),
                display_cost        varchar(50),
                inspect             int,
                unit_code           varchar(10),
                default_supplier_id int,
                mat_group           varchar(50),
                expiration_term     int,
                weight              decimal(18,4),
                conductor_size      decimal(18,4),
                structure_no        int,
                structure_no2       int,
                unit_size           int,
                dia_min             decimal(18,4),
                dia_std             decimal(18,4),
                dia_max             decimal(18,4),
                structure_size2     decimal(18,4),
                p_mat_kind_id       int,

                create_date DATETIME NOT NULL,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT 
            )


                
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_material');
    }
}
?>