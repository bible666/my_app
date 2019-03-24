<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_m_item extends CI_Migration {

    public function up()
    {
        $this->dbforge->add_field(array(
            'id' => array(
                    'type' => 'INT',
                    'unsigned' => TRUE,
                    'auto_increment' => TRUE
            ),
            'm_company_id'=> array(
                'type' => 'INT',
                'unsigned' => TRUE
            ),
            'item_code' => array(
                'type' => 'VARCHAR',
                'constraint' => '20',
            ),
            'item_name' => array(
                'type' => 'VARCHAR',
                'constraint' => '200',
                'null' => TRUE,
            ),
            'm_unit_id'=> array(
                'type' => 'INT',
                'unsigned' => TRUE
            ),
            'm_item_type_id'=> array(
                'type' => 'INT',
                'unsigned' => TRUE
            ),
            'lot_flag'=> array(
                'type' => 'INT',
                'unsigned' => TRUE
            ),
            'mrp_flag'=> array(
                'type' => 'INT',
                'unsigned' => TRUE
            ),
            'remark' => array(
                'type' => 'TEXT',
                'null' => TRUE,
            ),
            'created_date' => array(
                'type' => 'DATETIME',
                'null' => TRUE,
            ),
            'created'=> array(
                'type' => 'INT',
                'unsigned' => TRUE
            ),
            'updated_date' => array(
                'type' => 'DATETIME',
                'null' => TRUE,
            ),
            'updated'=> array(
                'type' => 'INT',
                'unsigned' => TRUE,
                'null' => TRUE,
            ),
        ));
        $this->dbforge->add_key('id', TRUE);
        $this->dbforge->create_table('m_item');
    }

    public function down()
    {
        $this->dbforge->drop_table('m_item');
    }
}
?>