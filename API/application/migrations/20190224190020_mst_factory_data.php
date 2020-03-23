<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_factory_data extends CI_Migration {

    public function up()
    {
        $data = [
            [
				"factory_code"       => 'TYE-P',
                "description"	=> 'บริษัท สายไฟฟ้าไทยยาซากิ จำกัด (สาขาพระประแดง)',
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
				"factory_code"       => 'TYE-W',
                "description"	=> 'บริษัท สายไฟฟ้าไทยยาซากิ จำกัด (สาขาวัดแค)',

                "create_date"   => '20081114200012',
                "create_user"   => 1
            ]
        ];

        $this->db->insert_batch('mst_factory', $data);
    }

    public function down()
    {
        $this->db->query("
    
        ");
    }
}
?>