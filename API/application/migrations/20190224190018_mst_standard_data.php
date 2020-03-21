<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_standard_data extends CI_Migration {

    public function up()
    {
        $data = [
            [
				"standard_id"       => 1,
                "standard_name"	=> 'BS',
                "use_flag"      => true,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
				"standard_id"       => 2,
                "standard_name"	=> 'TIS',
                "use_flag"      => true,

                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
				"standard_id"       => 3,
                "standard_name"	=> 'IEC',
                "use_flag"      => true,

                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
				"standard_id"       => 4,
                "standard_name"	=> 'OTHER',
                "use_flag"      => true,

                "create_date"   => '20081114200012',
                "create_user"   => 1
            ]
        ];

        $this->db->insert_batch('mst_standard', $data);
    }

    public function down()
    {
        $this->db->query("
    
        ");
    }
}
?>