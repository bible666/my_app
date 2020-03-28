<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_payment_term_data extends CI_Migration {

    public function up()
    {
        $this->db->query("
            INSERT mst_payment_term (term_id, term_name, term_day, create_date, update_date, create_user, update_user) VALUES (1, 'T/T remittance within 60 days after B/L date', 60, '20090803071700', '20090811085343', 45, 45),
                (2, 'T/T 30 Days after B/L date', 30, '20090803071700', '20090803071700', 45, 45),
                (3, 'T/T remittance within 30 days after B/L date', 30, '20090811085343', '20090811085343', 45, 45),
                (4, 'D/P at sight', 1, '20090914103550', '20090914103550', 45, 45),
                (5, 'Documents against payment at sight', 1, '20090914105738', '20090914105738', 45, 45),
                (6, '30 Days net invoice date', 30, '20090924102712', '20090924102712', 45, 45)

        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_company');
    }
}
?>