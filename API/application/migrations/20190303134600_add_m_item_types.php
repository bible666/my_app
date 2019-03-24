<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_m_item_types extends CI_Migration {

    public function up()
    {
        $this->dbforge->add_field(array(
            'id' => array(
                'type' => 'INT',
                'unsigned' => TRUE,
                'auto_increment' => TRUE
			),
            'm_company_id'	=> array(
				'type' => 'INT',
                'unsigned' => TRUE
			),
            'item_type_name' => array(
                'type' => 'VARCHAR',
                'constraint' => '45',
			),
			'sorted'	=> array(
				'type' => 'INT',
                'unsigned' => TRUE
			),
            'remark' => array(
                'type' => 'VARCHAR',
                'constraint' => '200',
                'null' => TRUE,
            ),
            'del_flag'=> array(
                'type' => 'INT',
                'unsigned' => TRUE
            ),
            'created_date' => array(
                'type' => 'DATETIME'
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
        $this->dbforge->create_table('m_item_types');
    }

    public function down()
    {
        $this->dbforge->drop_table('m_item_types');
    }
}
?>