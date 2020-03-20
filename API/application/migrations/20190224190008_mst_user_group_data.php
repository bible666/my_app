<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_user_group_data extends CI_Migration {

    public function up()
    {
        $data = [
            [
				"user_group_id" => 1,
				"user_group_name"	=> 'All',
                "description"   => 'All',
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "user_group_id" => 2,
				"user_group_name"	=> 'DEV PROD STD',
                "description"   => 'PRODUCTION STANDARD DOCUMENT',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 3,
				"user_group_name"	=> 'PEN',
                "description"   => 'PRODUCTION ENGINEER',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 4,
				"user_group_name"	=> 'TEST',
                "description"   => 'TEST',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 5,
				"user_group_name"	=> 'PLANNING SECTION',
                "description"   => 'PLANNING SECTION',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 6,
				"user_group_name"	=> 'PUR ALL',
                "description"   => 'PURCHASE SM',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 7,
				"user_group_name"	=> 'RAW ALL',
                "description"   => 'RAW SM',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 8,
				"user_group_name"	=> 'PROD DEPARTMENT',
                "description"   => 'PROD DM',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 9,
				"user_group_name"	=> 'MTN ALL',
                "description"   => 'MTN DM,SM',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 10,
				"user_group_name"	=> 'QC',
                "description"   => 'QUALITY CONTROL',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 11,
				"user_group_name"	=> 'WAE',
                "description"   => 'WAREHOUSE',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 12,
				"user_group_name"	=> 'WAIT',
                "description"   => 'WAIT',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 13,
				"user_group_name"	=> 'MTN INS',
                "description"   => 'MAINTENANCE INSTRUMENT',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 14,
				"user_group_name"	=> 'QC MAT',
                "description"   => 'QC MATERIAL',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 15,
				"user_group_name"	=> 'PLANNING PLANNER',
                "description"   => 'PLANNING PLANNER',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 16,
				"user_group_name"	=> 'PLANNING CHIEF',
                "description"   => 'PLANNING CHIEF',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 18,
				"user_group_name"	=> 'PLANNING LOAD ORDER',
                "description"   => 'PLANNING LOAD ORDER',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 19,
				"user_group_name"	=> 'QC HIVOLT',
                "description"   => 'QC HIVOLT',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 20,
				"user_group_name"	=> 'QC SERVICE LENGTH',
                "description"   => 'QC SERVICE LENGTH',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 21,
				"user_group_name"	=> 'DEV PROD APPROVE',
                "description"   => 'PRODUCTION STANDARD APPROVE',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 22,
				"user_group_name"	=> 'DEV MATERIAL',
                "description"   => 'MATERIAL MASTER',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 23,
				"user_group_name"	=> 'DEV ALL',
                "description"   => 'DEV DM',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 24,
				"user_group_name"	=> 'QC ALL',
                "description"   => 'QC DM,SM',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 25,
				"user_group_name"	=> 'RAW MATERIAL',
                "description"   => 'RAW MATERIAL',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 26,
				"user_group_name"	=> 'QC CHIEF',
                "description"   => 'QC-CHIEF',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 27,
				"user_group_name"	=> 'PEN ALL',
                "description"   => 'PEN DM,SM',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 28,
				"user_group_name"	=> 'PEN OS APPROVE',
                "description"   => 'PEN OS APPROVE',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 29,
				"user_group_name"	=> 'PEN OS INPUT',
                "description"   => 'PEN OS INPUT',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 30,
				"user_group_name"	=> 'PUR MAT',
                "description"   => 'PUR MAT',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 31,
				"user_group_name"	=> 'PLANNING FG',
                "description"   => 'PLANNING FG',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 32,
				"user_group_name"	=> 'MTN TOOL',
                "description"   => 'MTN TOOL',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 33,
				"user_group_name"	=> 'PROD MAT',
                "description"   => 'PROD MATERRIAL',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 34,
				"user_group_name"	=> 'COS',
                "description"   => 'COSTING SECTION',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "user_group_id" => 35,
				"user_group_name"	=> 'All2',
                "description"   => 'All Rule',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			]

        ];

        $this->db->insert_batch('mst_user_group', $data);
    }

    public function down()
    {
        $this->db->query("
    
        ");
    }
}
?>