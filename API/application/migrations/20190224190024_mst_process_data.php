<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_process_data extends CI_Migration {

    public function up()
    {
        $data = [
            [
                "process_code"      => 'WINDING',
                "process_name_en"   => 'WINDING',
                "process_name_th"   => 'WINDING',
                "process_name_cost" => NULL,
                "status_id"         => 1,
                "section_code"      => NULL,
                "wipidcs"           => NULL,
                "screen_id"         => 20,
                "plan_group"        => NULL,
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'EXTO',
                "process_name_en"   => 'Outer Sheath',
                "process_name_th"   => 'หุ้มเปลือกนอก',
                "process_name_cost" => 'Outer Sheath',
                "status_id"         => 1,
                "section_code"      => 'YM14',
                "wipidcs"           => 'H',
                "screen_id"         => 10,
                "plan_group"        => 'EXT',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'BAEC',
                "process_name_en"   => 'Bare Cu.',
                "process_name_th"   => 'ใส่ทองแดงเปลือย',
                "process_name_cost" => 'Bare Cu.',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => '',
                "screen_id"         => 9,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'CPPD',
                "process_name_en"   => 'Copper Draw',
                "process_name_th"   => 'รีดทองแดง',
                "process_name_cost" => 'Copper Draw',
                "status_id"         => 1,
                "section_code"      => 'YM11',
                "wipidcs"           => '',
                "screen_id"         => 1,
                "plan_group"        => 'CON',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'CPPC',
                "process_name_en"   => 'Copper Compact',
                "process_name_th"   => 'อัดแน่นทองแดง',
                "process_name_cost" => 'Copper Compact',
                "status_id"         => 1,
                "section_code"      => 'YM11',
                "wipidcs"           => '',
                "screen_id"         => 2,
                "plan_group"        => 'CON',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'CVSC',
                "process_name_en"   => 'Conductor shield (X-Link)',
                "process_name_th"   => 'หุ้มชั้นป้องกันตัวนำผ่านการ Cross link',
                "process_name_cost" => 'Conductor shield (X-Link)',
                "status_id"         => 1,
                "section_code"      => 'YM12',
                "wipidcs"           => '',
                "screen_id"         => 4,
                "plan_group"        => 'CV',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'CVSS',
                "process_name_en"   => 'Insulation shield (X-Link)',
                "process_name_th"   => 'หุ้มขั้นป้องกันฉนวนผ่านการ Cross link',
                "process_name_cost" => 'Insulation shield (X-Link',
                "status_id"         => 1,
                "section_code"      => 'YM12',
                "wipidcs"           => '',
                "screen_id"         => 4,
                "plan_group"        => '',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'CVSI',
                "process_name_en"   => 'Insulation (X-Link)',
                "process_name_th"   => 'หุ้มฉนวนที่ผ่านการ Cross link',
                "process_name_cost" => 'Insulation (X-Link)',
                "status_id"         => 1,
                "section_code"      => 'YM12',
                "wipidcs"           => '',
                "screen_id"         => 3,
                "plan_group"        => 'CV',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'CORS',
                "process_name_en"   => 'Core stranding',
                "process_name_th"   => 'ตีเกลียวแกนสายไฟ',
                "process_name_cost" => 'Core stranding',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => '',
                "screen_id"         => 7,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'ARMA',
                "process_name_en"   => 'Armor wire',
                "process_name_th"   => 'เกราะป้องกันสายไฟ',
                "process_name_cost" => 'Armor wire',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => 'A',
                "screen_id"         => 13,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'BNDP',
                "process_name_en"   => 'P.S. tape',
                "process_name_th"   => 'พัน P.S. เทป',
                "process_name_cost" => 'P.S. tape',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => 'P',
                "screen_id"         => 11,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'BNDS',
                "process_name_en"   => 'Spun bond tape',
                "process_name_th"   => 'พัน Spunbond เทป',
                "process_name_cost" => 'Spun bond tape',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => 'S',
                "screen_id"         => 11,
                "plan_group"        => '',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'BNDC',
                "process_name_en"   => 'Copper tape',
                "process_name_th"   => 'พันเทปทองแดง',
                "process_name_cost" => 'Copper tape',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => 'C',
                "screen_id"         => 11,
                "plan_group"        => '',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'EXNN',
                "process_name_en"   => 'Inner Sheath',
                "process_name_th"   => 'หุ้มเปลือกใน',
                "process_name_cost" => 'Inner Sheath',
                "status_id"         => 1,
                "section_code"      => 'YM14',
                "wipidcs"           => 'I',
                "screen_id"         => 10,
                "plan_group"        => 'EXT',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'CPPS',
                "process_name_en"   => 'Copper Strand',
                "process_name_th"   => 'ตีเกลียวทองแดง',
                "process_name_cost" => 'Copper Strand',
                "status_id"         => 1,
                "section_code"      => 'YM11',
                "wipidcs"           => '',
                "screen_id"         => 2,
                "plan_group"        => 'CON',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'ARMK',
                "process_name_en"   => 'Aluminium wire armor',
                "process_name_th"   => 'เกราะป้องกันสายไฟแบบเส้นอลูมิเนียม',
                "process_name_cost" => 'Aluminium wire armor',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => 'K',
                "screen_id"         => 13,
                "plan_group"        => '',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'ALUM',
                "process_name_en"   => 'Aluminium Melt',
                "process_name_th"   => 'หลอมอลูมิเนียม',
                "process_name_cost" => 'Aluminium Melt',
                "status_id"         => 1,
                "section_code"      => 'YM11',
                "wipidcs"           => '',
                "screen_id"         => 1,
                "plan_group"        => 'CON',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'ALUD',
                "process_name_en"   => 'Aluminium Draw',
                "process_name_th"   => 'รีดอลูมิเนียม',
                "process_name_cost" => 'Aluminium Draw',
                "status_id"         => 1,
                "section_code"      => 'YM11',
                "wipidcs"           => '',
                "screen_id"         => 1,
                "plan_group"        => 'CON',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'ALUC',
                "process_name_en"   => 'Aluminium Compact',
                "process_name_th"   => 'อัดแน่นอลูมิเนียม',
                "process_name_cost" => 'Aluminium Compact',
                "status_id"         => 1,
                "section_code"      => 'YM11',
                "wipidcs"           => '',
                "screen_id"         => 2,
                "plan_group"        => 'CON',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'EXII',
                "process_name_en"   => 'Insulation',
                "process_name_th"   => 'หุ้มฉนวน',
                "process_name_cost" => 'Insulation',
                "status_id"         => 1,
                "section_code"      => 'YM14',
                "wipidcs"           => '',
                "screen_id"         => 3,
                "plan_group"        => 'EXT',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'CORP',
                "process_name_en"   => 'Pair stranding',
                "process_name_th"   => 'ตีเกลียวแกนสายไฟแบบ Pair',
                "process_name_cost" => 'Pair stranding',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => '',
                "screen_id"         => 7,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'DAIN',
                "process_name_en"   => 'Drain wire',
                "process_name_th"   => 'การใส่ Drain wire',
                "process_name_cost" => 'Drain wire',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => 'D',
                "screen_id"         => 12,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'BNDF',
                "process_name_en"   => 'Al. foil tape',
                "process_name_th"   => 'พันเทปอลูมิเนียม',
                "process_name_cost" => 'Al. foil tape',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => 'F',
                "screen_id"         => 11,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'EXTT',
                "process_name_en"   => 'Outer Sheath (Anti Termite)',
                "process_name_th"   => 'หุ้มเปลือกนอก กันปลวก',
                "process_name_cost" => 'Outer Sheath',
                "status_id"         => 1,
                "section_code"      => 'YM14',
                "wipidcs"           => 'H',
                "screen_id"         => 10,
                "plan_group"        => 'EXT',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'EXTS',
                "process_name_en"   => 'Outer Sheath (Anti Rat & Flame retardant)',
                "process_name_th"   => 'หุ้มเปลือกนอก กันหนู และ หน่วงไฟ',
                "process_name_cost" => 'Outer Sheath',
                "status_id"         => 1,
                "section_code"      => 'YM14',
                "wipidcs"           => 'H',
                "screen_id"         => 10,
                "plan_group"        => 'EXT',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'BNWY',
                "process_name_en"   => 'Semi nylon tape(Wrap)',
                "process_name_th"   => 'ห่อเทปไนลอน',
                "process_name_cost" => 'Semi nylon tape(Wrap)',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => '',
                "screen_id"         => 12,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'BNDW',
                "process_name_en"   => 'semi-cond water Blocking tape',
                "process_name_th"   => 'เทปกันน้ำ',
                "process_name_cost" => 'semi-cond water Blocking',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => 'W',
                "screen_id"         => 11,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'BNDO',
                "process_name_en"   => 'Copper contact tape',
                "process_name_th"   => 'เทปป้องกันสายไฟทองแดง',
                "process_name_cost" => 'Copper contact tape',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => '0',
                "screen_id"         => 16,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'BNDN',
                "process_name_en"   => 'Non-water Blocking',
                "process_name_th"   => 'เทปไม่กันน้ำ',
                "process_name_cost" => 'Non-water Blocking tape',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => 'N',
                "screen_id"         => 11,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'BNOP',
                "process_name_en"   => 'P.S. tape (Remove on next process)',
                "process_name_th"   => 'พัน P.S. เทป และให้แกะออกเมื่อจะการผลิตในขั้นตอนต่างๆ',
                "process_name_cost" => 'P.S. tape (Remove on next process)',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => 'V',
                "screen_id"         => 11,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'BNDM',
                "process_name_en"   => 'Al. laminate (Longitudinal wrap)',
                "process_name_th"   => 'ห่อด้วยอลูมิเนียมแบบบาง',
                "process_name_cost" => 'Al. laminate (Longitudinal wrap)',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => 'M',
                "screen_id"         => 18,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'EXUU',
                "process_name_en"   => 'Under Sheath',
                "process_name_th"   => 'หุ้มเปลือกในด้วย PVC Over Flow',
                "process_name_cost" => 'Under Sheath',
                "status_id"         => 1,
                "section_code"      => 'YM14',
                "wipidcs"           => 'U',
                "screen_id"         => 10,
                "plan_group"        => 'EXT',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'CORG',
                "process_name_en"   => 'Concentric',
                "process_name_th"   => 'ตีเกลียวทองแดงทำ Shield',
                "process_name_cost" => 'Concentric',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => 'G',
                "screen_id"         => 9,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'CORT',
                "process_name_en"   => 'Triple stranding',
                "process_name_th"   => 'ตีเกลียวแกนสายไฟแบบ Triple',
                "process_name_cost" => 'Triple stranding',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => '',
                "screen_id"         => 7,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'BNWF',
                "process_name_en"   => 'Al. foil tape (Wrap)',
                "process_name_th"   => 'ห่อด้วยเทปอลูมิเนียม',
                "process_name_cost" => 'Al. foil tape (Wrap)',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => '',
                "screen_id"         => 11,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'EXTR',
                "process_name_en"   => 'Outer Sheath (Anti Rat)',
                "process_name_th"   => 'หุ้มเปลือกนอก กันหนู',
                "process_name_cost" => 'Outer Sheath',
                "status_id"         => 1,
                "section_code"      => 'YM14',
                "wipidcs"           => 'H',
                "screen_id"         => 10,
                "plan_group"        => 'EXT',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'EXNP',
                "process_name_en"   => 'Pre-Sheath',
                "process_name_th"   => 'หุ้มเปลือกใน',
                "process_name_cost" => 'Pre-Sheath',
                "status_id"         => 1,
                "section_code"      => 'YM14',
                "wipidcs"           => 'I',
                "screen_id"         => 10,
                "plan_group"        => 'EXT',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'ARMT',
                "process_name_en"   => 'Steel tape armor',
                "process_name_th"   => 'เกราะป้องกันสายไฟแบบเทปเหล็ก',
                "process_name_cost" => 'Steel tape armor',
                "status_id"         => 1,
                "section_code"      => 'YM14',
                "wipidcs"           => 'T',
                "screen_id"         => 14,
                "plan_group"        => 'EXT',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'EXTQ',
                "process_name_en"   => 'Nylon jacket',
                "process_name_th"   => 'หุ้มเปลือกด้วยไนลอน',
                "process_name_cost" => 'Nylon jacket',
                "status_id"         => 1,
                "section_code"      => 'YM14',
                "wipidcs"           => 'Q',
                "screen_id"         => 17,
                "plan_group"        => 'EXT',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'EXTG',
                "process_name_en"   => 'Serving sheath',
                "process_name_th"   => 'หุ้มเปลือกนอก',
                "process_name_cost" => 'Serving sheath',
                "status_id"         => 1,
                "section_code"      => 'YM14',
                "wipidcs"           => 'H',
                "screen_id"         => 10,
                "plan_group"        => 'EXT',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'ARMW',
                "process_name_en"   => 'Cu. Wire screen',
                "process_name_th"   => 'เกราะป้องกันสายไฟแบบเส้นทองแดง',
                "process_name_cost" => 'Cu. Wire screen',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => '',
                "screen_id"         => 15,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'DRWF',
                "process_name_en"   => 'Copper Draw (Flex)',
                "process_name_th"   => 'รีดทองแดง (โรง flex)',
                "process_name_cost" => 'Copper Draw (Flex)',
                "status_id"         => 1,
                "section_code"      => 'YM11',
                "wipidcs"           => '',
                "screen_id"         => 1,
                "plan_group"        => 'CON',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'BUNF',
                "process_name_en"   => 'Bunching (Flex)',
                "process_name_th"   => 'ตีเกลียวตัวนำอ่อน',
                "process_name_cost" => 'Bunching (Flex)',
                "status_id"         => 1,
                "section_code"      => 'YM15',
                "wipidcs"           => '',
                "screen_id"         => 2,
                "plan_group"        => 'FLEX',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'EXFI',
                "process_name_en"   => 'Insulation (Flex)',
                "process_name_th"   => 'หุ้มฉนวนที่เป็นตัวนำอ่อน',
                "process_name_cost" => 'Insulation (Flex)',
                "status_id"         => 1,
                "section_code"      => 'YM15',
                "wipidcs"           => '',
                "screen_id"         => 3,
                "plan_group"        => 'FLEX',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'BNDL',
                "process_name_en"   => 'Stainless tape',
                "process_name_th"   => 'พันเทปสแตนเลส',
                "process_name_cost" => 'Stainless tape',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => 'L',
                "screen_id"         => 14,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'ROPF',
                "process_name_en"   => 'Rope-lay (Flex)',
                "process_name_th"   => 'ตีเกลียว rope-lay',
                "process_name_cost" => 'Rope-lay (Flex)',
                "status_id"         => 1,
                "section_code"      => 'YM15',
                "wipidcs"           => '',
                "screen_id"         => 2,
                "plan_group"        => 'FLEX',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'CONF',
                "process_name_en"   => 'Concentric (Flex)',
                "process_name_th"   => 'ตีเกลียว concentric',
                "process_name_cost" => 'Concentric (Flex)',
                "status_id"         => 1,
                "section_code"      => 'YM15',
                "wipidcs"           => '',
                "screen_id"         => 2,
                "plan_group"        => 'FLEX',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'COFS',
                "process_name_en"   => 'Core stranding (Flex)',
                "process_name_th"   => 'ตีเกลียวแกนสายไฟ (โรง flex)',
                "process_name_cost" => 'Core stranding (Flex)',
                "status_id"         => 1,
                "section_code"      => 'YM15',
                "wipidcs"           => '',
                "screen_id"         => 7,
                "plan_group"        => 'FLEX',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'EXFS',
                "process_name_en"   => 'Sheath (Flex)',
                "process_name_th"   => 'หุ้มเปลือกนอกที่เป็นตัวนำอ่อน',
                "process_name_cost" => 'Sheath (Flex)',
                "status_id"         => 1,
                "section_code"      => 'YM15',
                "wipidcs"           => 'H',
                "screen_id"         => 10,
                "plan_group"        => 'FLEX',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'CORB',
                "process_name_en"   => 'Bundle stranding',
                "process_name_th"   => 'ตีเกลียวแกนสายไฟแบบ Bundle',
                "process_name_cost" => 'Bundle stranding',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => '',
                "screen_id"         => 7,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'BNAY',
                "process_name_en"   => 'Semi nylon tape (Bundle)',
                "process_name_th"   => 'สอดเทปไนลอน (Bundle)',
                "process_name_cost" => 'Semi nylon tape (Bundle)',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => '',
                "screen_id"         => 12,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'ARMB',
                "process_name_en"   => 'Brass tape armor',
                "process_name_th"   => 'เกราะป้องกันสายไฟแบบเทปทองเหลือง',
                "process_name_cost" => 'Brass tape armor',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => 'B',
                "screen_id"         => 11,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'EXTD',
                "process_name_en"   => 'Outer Sheath (Flame retardant)',
                "process_name_th"   => 'หุ้มเปลือกนอก หน่วงไฟ',
                "process_name_cost" => 'Outer Sheath (Flame retardant)',
                "status_id"         => 1,
                "section_code"      => 'YM14',
                "wipidcs"           => '',
                "screen_id"         => 10,
                "plan_group"        => 'EXT',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'BNWP',
                "process_name_en"   => 'P.S. tape (Wrap)',
                "process_name_th"   => 'ห่อด้วย P.S. เทป',
                "process_name_cost" => 'P.S. tape (Wrap)',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => '',
                "screen_id"         => 12,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'BNDY',
                "process_name_en"   => 'Semi nylon tape',
                "process_name_th"   => 'พันเทปไนลอน',
                "process_name_cost" => 'Semi nylon tape',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => 'X',
                "screen_id"         => 11,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'SWEI',
                "process_name_en"   => 'Insulation (SWE)',
                "process_name_th"   => 'หุ้มฉนวน (วัดแค)',
                "process_name_cost" => 'Insulation (SWE)',
                "status_id"         => 1,
                "section_code"      => 'YT11',
                "wipidcs"           => '',
                "screen_id"         => 3,
                "plan_group"        => 'SWE',
                "qc_tag_id"         => 4,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'SWEL',
                "process_name_en"   => 'Core-laying (SWE)',
                "process_name_th"   => 'วางสายขนานกันก่อนหุ้ม (วัดแค)',
                "process_name_cost" => 'Core-laying (SWE)',
                "status_id"         => 1,
                "section_code"      => 'YT11',
                "wipidcs"           => '',
                "screen_id"         => 8,
                "plan_group"        => 'SWE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'SWEF',
                "process_name_en"   => 'Outer Sheath (Flat shape) (SWE)',
                "process_name_th"   => 'หุ้มเปลือกนอกทรงแบน (วัดแค)',
                "process_name_cost" => 'Outer Sheath (Flat shape) (SWE)',
                "status_id"         => 1,
                "section_code"      => 'YT11',
                "wipidcs"           => 'H',
                "screen_id"         => 10,
                "plan_group"        => 'SQE',
                "qc_tag_id"         => 5,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'SWED',
                "process_name_en"   => 'Draw (SWE)',
                "process_name_th"   => 'รีดตัวนำ (วัดแค)',
                "process_name_cost" => 'Draw (SWE)',
                "status_id"         => 1,
                "section_code"      => 'YT11',
                "wipidcs"           => '',
                "screen_id"         => 1,
                "plan_group"        => 'SWE',
                "qc_tag_id"         => 1,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'SWDT',
                "process_name_en"   => 'Strand (SWE)',
                "process_name_th"   => 'ตีเกลียว (วัดแค)',
                "process_name_cost" => 'Strand (SWE)',
                "status_id"         => 1,
                "section_code"      => 'YT11',
                "wipidcs"           => '',
                "screen_id"         => 2,
                "plan_group"        => 'SWE',
                "qc_tag_id"         => 2,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'BNDG',
                "process_name_en"   => 'Glass mica tape',
                "process_name_th"   => 'พันเทปกันไฟ',
                "process_name_cost" => 'Glass mica tape',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => '',
                "screen_id"         => 6,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'EXTV',
                "process_name_en"   => 'Outer Sheath (Flame resistant)',
                "process_name_th"   => 'หุ้มเปลือกนอก กันไฟ',
                "process_name_cost" => 'Outer Sheath (Flame resistant)',
                "status_id"         => 1,
                "section_code"      => 'YM14',
                "wipidcs"           => 'H',
                "screen_id"         => 10,
                "plan_group"        => 'EXT',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'EXTA',
                "process_name_en"   => 'Outer Sheath (Flame retardant & LSOH)',
                "process_name_th"   => 'หุ้มเปลือกนอก หน่วงไฟ, ควันน้อยและไม่มีสารฮาโลเจน',
                "process_name_cost" => 'Outer Sheath (Flame retardant & LSOH)',
                "status_id"         => 1,
                "section_code"      => 'YM14',
                "wipidcs"           => '',
                "screen_id"         => 10,
                "plan_group"        => 'EXT',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'EXTB',
                "process_name_en"   => 'Outer Sheath (Flame resistant & LSOH)',
                "process_name_th"   => 'หุ้มเปลือกนอก กันไฟ ควันน้อยและไม่มีสารฮาโลเจน',
                "process_name_cost" => 'Outer Sheath (Flame resistant & LSOH)',
                "status_id"         => 1,
                "section_code"      => 'YM14',
                "wipidcs"           => 'H',
                "screen_id"         => 10,
                "plan_group"        => 'EXT',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'EXTX',
                "process_name_en"   => 'Outer Sheath (Anti Termite &  Rat)',
                "process_name_th"   => 'หุ้มเปลือกนอก กันปลวก และ หนู',
                "process_name_cost" => 'Outer Sheath (Anti Termite &  Rat)',
                "status_id"         => 1,
                "section_code"      => 'YM14',
                "wipidcs"           => 'H',
                "screen_id"         => 10,
                "plan_group"        => 'EXT',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'ALUS',
                "process_name_en"   => 'Aluminium Strand',
                "process_name_th"   => 'ตีเกลียวอลูมิเนียม',
                "process_name_cost" => 'Aluminium Strand',
                "status_id"         => 1,
                "section_code"      => 'YM11',
                "wipidcs"           => '',
                "screen_id"         => 2,
                "plan_group"        => 'CON',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'ARMJ',
                "process_name_en"   => 'Aluminium tape armor',
                "process_name_th"   => 'เกราะป้องกันสายไฟแบบเทปอลูมิเนียม',
                "process_name_cost" => 'Aluminium tape armor',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => 'J',
                "screen_id"         => 14,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'EXFF',
                "process_name_en"   => 'Insulation (Flat shape)',
                "process_name_th"   => 'หุ้มฉนวนที่เป็นตัวนำอ่อนทรงแบน (โรง flex)',
                "process_name_cost" => 'Insulation (Flat shape)',
                "status_id"         => 1,
                "section_code"      => 'YM15',
                "wipidcs"           => '',
                "screen_id"         => 3,
                "plan_group"        => 'FLEX',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'CORQ',
                "process_name_en"   => 'Quad stranding',
                "process_name_th"   => 'ตีเกลียวแกนสายไฟแบบ Quad',
                "process_name_cost" => 'Quad stranding',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => '',
                "screen_id"         => 7,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'SAM1',
                "process_name_en"   => '123',
                "process_name_th"   => '1123',
                "process_name_cost" => '',
                "status_id"         => 2,
                "section_code"      => 'YM13',
                "wipidcs"           => '',
                "screen_id"         => NULL,
                "plan_group"        => '',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'EXTC',
                "process_name_en"   => 'Outer Sheath (Flame & Anti Termite &  Rat)',
                "process_name_th"   => 'หุ้มเปลือกนอก หน่วงไฟ,กันปลวก และ หนู',
                "process_name_cost" => 'Outer Sheath (Flame & Anti Termite &  Rat)',
                "status_id"         => 1,
                "section_code"      => 'YM14',
                "wipidcs"           => '',
                "screen_id"         => 10,
                "plan_group"        => 'EXT',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'CVWY',
                "process_name_en"   => 'Semi nylon tape(Wrap-CV)',
                "process_name_th"   => 'ห่อเทปไนลอน (CV)',
                "process_name_cost" => 'Semi nylon tape(Wrap-CV)',
                "status_id"         => 1,
                "section_code"      => 'YM12',
                "wipidcs"           => '',
                "screen_id"         => 12,
                "plan_group"        => 'CV',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'BNDA',
                "process_name_en"   => 'NOC and NIC tape',
                "process_name_th"   => 'พันเทป NOC หรือ NIC',
                "process_name_cost" => 'NOC and NIC tape',
                "status_id"         => 1,
                "section_code"      => 'YM13',
                "wipidcs"           => '',
                "screen_id"         => 11,
                "plan_group"        => 'CORE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'EXTF',
                "process_name_en"   => 'Outer Sheath (Lead Free)',
                "process_name_th"   => 'หุ้มเปลือกนอก ปลอดตะกั่ว',
                "process_name_cost" => 'Outer Sheath (Lead Free)',
                "status_id"         => 1,
                "section_code"      => 'YM14',
                "wipidcs"           => '',
                "screen_id"         => 10,
                "plan_group"        => 'EXT',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'CVSH',
                "process_name_en"   => 'Outer sheath (X-Link)',
                "process_name_th"   => 'หุ้มเปลือกนอกที่ผ่านการ Cross link',
                "process_name_cost" => 'Outer sheath (X-Link)',
                "status_id"         => 1,
                "section_code"      => 'YM12',
                "wipidcs"           => '',
                "screen_id"         => 10,
                "plan_group"        => 'CV',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'EXTH',
                "process_name_en"   => 'Outer Sheath (Anti Rat and Termite & FSLH)',
                "process_name_th"   => 'หุ้มเปลือกนอก กันหนู กันไฟ กันไฟ ควันน้อยและไม่มี',
                "process_name_cost" => 'Outer Sheath (Anti Rat and Termite & FSLH)',
                "status_id"         => 1,
                "section_code"      => 'YM14',
                "wipidcs"           => '',
                "screen_id"         => 10,
                "plan_group"        => 'EXT',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'SWES',
                "process_name_en"   => 'Sheath (SWE)',
                "process_name_th"   => 'หุ้มเปลือก (วัดแค)',
                "process_name_cost" => 'Sheath (SWE)',
                "status_id"         => 1,
                "section_code"      => 'YT11',
                "wipidcs"           => '',
                "screen_id"         => 10,
                "plan_group"        => 'SWE',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => '1',
                "process_name_en"   => '11',
                "process_name_th"   => '1',
                "process_name_cost" => '',
                "status_id"         => 2,
                "section_code"      => 'YM12',
                "wipidcs"           => '',
                "screen_id"         => 19,
                "plan_group"        => '',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'EXMF',
                "process_name_en"   => 'Insulating of Prefrabricated Conductor (Flex)',
                "process_name_th"   => 'หุ้มฉนวนตัวนำสำเร็จรูป โรง Flex',
                "process_name_cost" => 'Insulating of Prefrabricated Conductor (Flex)',
                "status_id"         => 1,
                "section_code"      => 'YM15',
                "wipidcs"           => 'FLEX',
                "screen_id"         => 19,
                "plan_group"        => 'FLEX',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'EXMT',
                "process_name_en"   => 'Insulating of Prefrabricated Conductor',
                "process_name_th"   => 'หุ้มฉนวนตัวนำสำเร็จรูป',
                "process_name_cost" => 'Insulating of Prefrabricated Conductor',
                "status_id"         => 1,
                "section_code"      => 'YM14',
                "wipidcs"           => '',
                "screen_id"         => 19,
                "plan_group"        => 'EXT',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'EXFU',
                "process_name_en"   => 'Under Sheath (Flex)',
                "process_name_th"   => 'หุ้มเปลือกชั้นใน (Flex)',
                "process_name_cost" => 'Under Sheath (Flex)',
                "status_id"         => 1,
                "section_code"      => 'YM15',
                "wipidcs"           => '',
                "screen_id"         => 10,
                "plan_group"        => '',
                "qc_tag_id"         => NULL,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'COIL',
                "process_name_en"   => 'Coiling',
                "process_name_th"   => 'Coiling',
                "process_name_cost" => '',
                "status_id"         => 1,
                "section_code"      => 'YM14',
                "wipidcs"           => '',
                "screen_id"         => 20,
                "plan_group"        => 'EXT',
                "qc_tag_id"         => 6,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ],[
                "process_code"      => 'COFL',
                "process_name_en"   => 'Core Laying',
                "process_name_th"   => 'เรียงแกน',
                "process_name_cost" => '',
                "status_id"         => 1,
                "section_code"      => 'YM15',
                "wipidcs"           => '',
                "screen_id"         => 8,
                "plan_group"        => 'FLEX',
                "qc_tag_id"         => -1,
                
                "create_date"   => '20081114200012',
                "create_user"   => 1
            ]
        ];

        
        $this->db->insert_batch('mst_process', $data);
    }

    public function down()
    {
        $this->db->query("
    
        ");
    }
}
?>