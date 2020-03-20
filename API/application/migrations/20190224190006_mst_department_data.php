<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_department_data extends CI_Migration {

    public function up()
    {
        $data = [
            [
                "department_code" => 'YA10',
                "description"   => 'ADMINISTRATION TYE-P',
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],
            [
                "department_code" => 'YA20',
                "description"   => 'NYS TYE-P',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],
			[
                "department_code" => 'YA30',
                "description"   => 'PRODUCTION CONTROL TYE-P',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],
			[
                "department_code" => 'YA40',
                "description"   => 'PRODUCTION ENGINEER TYE-P',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "department_code" => 'YA50',
                "description"   => 'QUALITY ASSURANCE TYE-P',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],
			[
                "department_code" => 'YA60',
                "description"   => 'DEVELOPMENT  TYE-P',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],
			[
                "department_code" => 'YA70',
                "description"   => 'SAFETY (SECT.)',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "department_code" => 'YA80',
                "description"   => 'ACCOUNTING & COSTING',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "department_code" => 'YM10',
                "description"   => 'PRODUCTION 1 TYE-P',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "department_code" => 'YT10',
                "description"   => 'PRODUCTION 2 TYE-W',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "department_code" => 'YU10',
                "description"   => 'WAREHOUSE TYE-W',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "department_code" => 'YXZ0',
                "description"   => 'MANAGEMENT TYE-W',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			],[
                "department_code" => 'YYZ0',
                "description"   => 'MANAGEMENT TYE-P',
                "create_date"   => '20081114200012',
                "create_user"   => 1
			]

        ];

        $this->db->insert_batch('mst_department', $data);
    }

    public function down()
    {
        $this->db->query("
    
        ");
    }
}
?>