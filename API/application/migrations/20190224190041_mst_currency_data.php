<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_currency_data extends CI_Migration {

    public function up()
    {
        $this->db->query("
            INSERT INTO mst_currency 
(currency_code, currency_name, active_flag, remark, create_user, create_date, update_user, update_date, default_currency) VALUES 
('JPY', 'Japanese Ye', 0, '', 1, '2015-01-27 10:29:03', 1, '2015-01-27 10:29:03' , 0 ),
('THB', 'Thai Baht',   0, '', 1, '2015-01-27 10:29:03', 1, '2015-03-10 10:58:38' , 1),
('USD', 'US Dollas',   0, '', 1, '2015-01-27 10:29:03', 1, '2015-01-27 10:29:03' , 0)

        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_currency');
    }
}
?>