<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_company_data extends CI_Migration {

    public function up()
    {
        $this->db->query("


            INSERT mst_company (company_id, company_name_e, company_name_t, addr_1, addr_2, addr_3, tel_no, fax_no, mail_addr, create_date, update_date, create_user, update_user) VALUES (1, 'THAI YAZAKI ELECTRIC WIRE CO,.LTD.', 'บริษัท สายไฟฟ้า-ไทยยาซากิ จำกัด..', '283 moo 1 Suksawad Road', 'Pak-Klong Bangpakot Sub-District Phra-Samut Chedi', 'Samutprakarn Province 10290', '024630058', '024635711', 'tyeppur@yazaki.co.th', '20081203013235', '20101028115912', 3, 3)
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_company');
    }
}
?>