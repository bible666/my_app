<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_gap_ratio_data extends CI_Migration {

    public function up()
    {
        $this->db->query("
        INSERT mst_gap_ratio (gap_ratio_id, gap_ratio_code, create_date, update_date, create_user, update_user) VALUES (1, N'GAP 45%', N'20081117', N'20081117', 0, 0),
         (2, N'GAP 10%', N'20081117', N'20081117', 0, 0)

        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_process');
    }
}
?>