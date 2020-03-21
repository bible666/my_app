<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_user_level_data extends CI_Migration {

    public function up()
    {
        $data = [
            [
				"level_id" => 1,
				"level_name"	=> 'System Admin',
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
				"level_id" => 2,
				"level_name"	=> 'User Admin',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
				"level_id" => 3,
				"level_name"	=> 'Normal User',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			]

        ];

        $this->db->insert_batch('mst_user_level', $data);
    }

    public function down()
    {
        $this->db->query("
    
        ");
    }
}
?>