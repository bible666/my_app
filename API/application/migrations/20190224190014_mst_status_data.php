<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_status_data extends CI_Migration {

    public function up()
    {
        $data = [
            [
				"status_id"       => 1,
                "status_name"	=> 'Active',
                "product_flag"      => 1,
                "jig_tool_flag" => 1,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
				"status_id"       => 2,
                "status_name"	=> 'Cancel',
                "product_flag"      => 1,
                "jig_tool_flag" => 1,

                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
				"status_id"       => 3,
                "status_name"	=> 'Under Repair',
                "product_flag"      => 0,
                "jig_tool_flag" => 1,

                "create_date"   => '20081114200012',
                "create_user"   => 1
            ]
        ];

        $this->db->insert_batch('mst_status', $data);
    }

    public function down()
    {
        $this->db->query("
    
        ");
    }
}
?>