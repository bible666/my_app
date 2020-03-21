<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_unit_data extends CI_Migration {

    public function up()
    {
        $data = [
            [
				"unit_code"       => 'm.',
                "description"	=> 'เมตร',
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
				"unit_code"       => 'kg.',
                "description"	=> 'กิโลกรัม',

                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
				"unit_code"       => 'box',
                "description"	=> 'กล่อง',

                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
				"unit_code"       => 'roll',
                "description"	=> 'ม้วน',

                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
				"unit_code"       => 'liter',
                "description"	=> 'liter',

                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
				"unit_code"       => 'drum',
                "description"	=> 'drum',

                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
				"unit_code"       => 'mm.',
                "description"	=> 'mm.',

                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
				"unit_code"       => 'pcs',
                "description"	=> 'ชิ้น',

                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
				"unit_code"       => 'gal.',
                "description"	=> 'gal',

                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
				"unit_code"       => 'g/m',
                "description"	=> 'g/m',

                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
				"unit_code"       => 'mm2',
                "description"	=> 'mm2',

                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
				"unit_code"       => 'coli',
                "description"	=> 'Coli',

                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
				"unit_code"       => 'can',
                "description"	=> 'กล่อง',

                "create_date"   => '20081114200012',
                "create_user"   => 1
            ]
        ];

        $this->db->insert_batch('mst_unit', $data);
    }

    public function down()
    {
        $this->db->query("
    
        ");
    }
}
?>