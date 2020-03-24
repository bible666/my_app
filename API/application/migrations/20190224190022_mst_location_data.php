<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_location_data extends CI_Migration {

    public function up()
    {
        $data = [
            [
                "location_id"       => 1,
                "location_code"     => 'CON',
                "description"	=> 'Conductor Warehouse',
                "relate_cat"    => 0,
                "relate_id"     => 1,
                "stock_summary" => 1,
                "report_for_acc"    => 1,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "location_id"       => 2,
                "location_code"     => 'FEX',
                "description"	=> 'Flexble Wire Warehouse',
                "relate_cat"    => 0,
                "relate_id"     => 1,
                "stock_summary" => 1,
                "report_for_acc"    => 1,


                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "location_id"       => 3,
                "location_code"     => 'COR',
                "description"	=> 'Cor Strand Warehouse',
                "relate_cat"    => 0,
                "relate_id"     => 1,
                "stock_summary" => 1,
                "report_for_acc"    => 1,


                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "location_id"       => 4,
                "location_code"     => 'SWE',
                "description"	=> 'Swe Warehouse',
                "relate_cat"    => 0,
                "relate_id"     => 2,
                "stock_summary" => 1,
                "report_for_acc"    => 1,


                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "location_id"       => 5,
                "location_code"     => 'EXT',
                "description"	=> 'Extruding Warehouse',
                "relate_cat"    => 0,
                "relate_id"     => 1,
                "stock_summary" => 1,
                "report_for_acc"    => 1,


                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "location_id"       => 6,
                "location_code"     => 'RAW',
                "description"	=> 'Rawmaterial Watkae Warehouse',
                "relate_cat"    => 0,
                "relate_id"     => 2,
                "stock_summary" => 0,
                "report_for_acc"    => 0,


                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "location_id"       => 7,
                "location_code"     => 'QCS',
                "description"	=> 'QC Phrapradaeng Warehouse',
                "relate_cat"    => 0,
                "relate_id"     => 1,
                "stock_summary" => 1,
                "report_for_acc"    => 1,


                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "location_id"       => 8,
                "location_code"     => 'DEV',
                "description"	=> 'Design Warehouse',
                "relate_cat"    => 0,
                "relate_id"     => 1,
                "stock_summary" => 1,
                "report_for_acc"    => 1,


                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "location_id"       => 9,
                "location_code"     => 'CVS',
                "description"	=> 'Cvs Warehouse',
                "relate_cat"    => 0,
                "relate_id"     => 1,
                "stock_summary" => 1,
                "report_for_acc"    => 1,


                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "location_id"       => 10,
                "location_code"     => 'RAP',
                "description"	=> 'Rawmaterial Phrapradaeng Warehouse',
                "relate_cat"    => 0,
                "relate_id"     => 1,
                "stock_summary" => 0,
                "report_for_acc"    => 0,


                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "location_id"       => 11,
                "location_code"     => 'WAE',
                "description"	=> 'Finished Goods Warehouse',
                "relate_cat"    => 0,
                "relate_id"     => 1,
                "stock_summary" => 1,
                "report_for_acc"    => 1,


                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "location_id"       => 12,
                "location_code"     => 'MTN',
                "description"	=> 'Maintenance Warehouse',
                "relate_cat"    => 0,
                "relate_id"     => 1,
                "stock_summary" => 1,
                "report_for_acc"    => 1,


                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "location_id"       => 13,
                "location_code"     => 'GEN',
                "description"	=> 'Gen Warehouse',
                "relate_cat"    => 0,
                "relate_id"     => 1,
                "stock_summary" => 1,
                "report_for_acc"    => 1,


                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "location_id"       => 14,
                "location_code"     => 'PUR',
                "description"	=> 'Purchase Warehouse',
                "relate_cat"    => 0,
                "relate_id"     => 1,
                "stock_summary" => 1,
                "report_for_acc"    => 1,


                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "location_id"       => 15,
                "location_code"     => 'QCW',
                "description"	=> 'QC Watkae Warehouse',
                "relate_cat"    => 0,
                "relate_id"     => 2,
                "stock_summary" => 1,
                "report_for_acc"    => 1,


                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "location_id"       => 16,
                "location_code"     => 'PLN',
                "description"	=> 'Planning Warehouse',
                "relate_cat"    => 0,
                "relate_id"     => 1,
                "stock_summary" => 1,
                "report_for_acc"    => 1,


                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "location_id"       => 17,
                "location_code"     => 'TRC',
                "description"	=> 'Teerachai Warehouse',
                "relate_cat"    => 0,
                "relate_id"     => 1,
                "stock_summary" => 1,
                "report_for_acc"    => 1,


                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "location_id"       => 18,
                "location_code"     => 'SAL',
                "description"	=> 'Sale Warehouse',
                "relate_cat"    => 0,
                "relate_id"     => 1,
                "stock_summary" => 1,
                "report_for_acc"    => 1,


                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "location_id"       => 19,
                "location_code"     => 'R&D',
                "description"	=> 'R&D Warehouse',
                "relate_cat"    => 0,
                "relate_id"     => 1,
                "stock_summary" => 1,
                "report_for_acc"    => 1,


                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "location_id"       => 20,
                "location_code"     => 'TES',
                "description"	=> 'Test Warehouse',
                "relate_cat"    => 0,
                "relate_id"     => 1,
                "stock_summary" => 1,
                "report_for_acc"    => 1,


                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "location_id"       => 22,
                "location_code"     => 'SCC',
                "description"	=> 'SUKSAWAT CONVERTING CENTER CO. LTD.',
                "relate_cat"    => 1,
                "relate_id"     => 1217,
                "stock_summary" => 1,
                "report_for_acc"    => 1,


                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "location_id"       => 23,
                "location_code"     => 'QCT',
                "description"	=> 'QC Teerachai Warehouse',
                "relate_cat"    => 0,
                "relate_id"     => 1,
                "stock_summary" => 1,
                "report_for_acc"    => 1,


                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "location_id"       => 24,
                "location_code"     => 'SYS',
                "description"	=> 'System Warehouse',
                "relate_cat"    => 0,
                "relate_id"     => 1,
                "stock_summary" => 1,
                "report_for_acc"    => 1,


                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "location_id"       => 25,
                "location_code"     => 'PSC',
                "description"	=> 'PRECISION SLITTING CENTER CO., LTD.',
                "relate_cat"    => 1,
                "relate_id"     => 1234,
                "stock_summary" => 1,
                "report_for_acc"    => 1,


                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "location_id"       => 26,
                "location_code"     => 'PEN',
                "description"	=> 'Pen Warehouse',
                "relate_cat"    => 0,
                "relate_id"     => 1,
                "stock_summary" => 1,
                "report_for_acc"    => 1,


                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "location_id"       => 27,
                "location_code"     => 'CLA',
                "description"	=> 'CLAIM LOCATION',
                "relate_cat"    => 0,
                "relate_id"     => 1,
                "stock_summary" => 1,
                "report_for_acc"    => 1,


                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "location_id"       => 28,
                "location_code"     => 'BPS',
                "description"	=> 'BANGKOK PACIFIC STEEL',
                "relate_cat"    => 1,
                "relate_id"     => 1164,
                "stock_summary" => 1,
                "report_for_acc"    => 1,


                "create_date"   => '20081114200012',
                "create_user"   => 1
            ]
        ];

        $this->db->insert_batch('mst_location', $data);
    }

    public function down()
    {
        $this->db->query("
    
        ");
    }
}
?>