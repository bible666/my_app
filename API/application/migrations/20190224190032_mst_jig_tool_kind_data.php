<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_jig_tool_kind_data extends CI_Migration {

    public function up()
    {
        $this->db->query("
        INSERT mst_jig_tool_kind (jig_tool_kind_id, jig_tool_kind_name, description, create_date, update_date, create_user, update_user) VALUES (1, 'NIPPLE', 'NIPPLE', '20090406131255', '20090406131255', 50, 50),
        (2, 'DIE', 'DIE', '20090406131255', '20090406131255', 50, 50),
        (3, 'ALLOY DIE', 'ALLOY DRAWING DIE', '20090406131255', '20090408152010', 50, 50),
        (4, 'DIAMOND DIE', 'DIAMOND DRAWING DIE', '20090406131255', '20111108161723', 50, 19),
        (5, 'COMPACT DIE', 'COMPACT DIE', '20090406131255', '20090406131255', 50, 50)


        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_process');
    }
}
?>