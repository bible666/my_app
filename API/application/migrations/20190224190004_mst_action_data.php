<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_action_data extends CI_Migration {

    public function up()
    {
        $data = [
            [
                "action_id"   => 1,
                "action_code" => '001',
                "description"   => 'มาตรฐานไม่ตรง',
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],
            [
                "action_id"   => 2,
                "action_code" => '002',
                "description"   => 'สายสั้น',
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ]
        ];

        $this->db->insert_batch('mst_action', $data);
    }

    public function down()
    {
        $this->db->query("
    
        ");
    }
}
?>