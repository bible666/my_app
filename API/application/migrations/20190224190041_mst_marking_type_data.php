<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_mst_marking_type_data extends CI_Migration {

    public function up()
    {
        $this->db->query("

            INSERT mst_marking_type (mark_type_id, type_name, description, create_date, update_date, create_user, update_user) VALUES (1, 'Emboss', 'Marking device using for printing the bulged mark.', '20081124015248', '25520201221722', 5, 7),
(2, 'ROLL', 'Marking device using for printting', '25520201221722', '25520201221722', 7, 7),
(3, 'Ink jet', 'Marking device using for injectio', '25520201221722', '20090223132525', 7, 46),
(4, 'IDEN MARK', 'Marking device using identification message tape', '20091013212958', '20091013212958', 7, 7)

        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_marking_type');
    }
}
?>