<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_m_suppliers extends CI_Migration {

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
            'supplier_cd'=> array(
                'type' => 'VARCHAR',
                'constraint' => '20'
            ),
            'supplier_name' => array(
                'type' => 'VARCHAR',
                'constraint' => '200',
			),
			'supplier_add1' => array(
                'type' => 'VARCHAR',
                'constraint' => '100',
			),
			'supplier_add2' => array(
                'type' => 'VARCHAR',
				'constraint' => '100',
				'null' => TRUE,
			),
			'supplier_add3' => array(
                'type' => 'VARCHAR',
				'constraint' => '100',
				'null' => TRUE,
			),
			'supplier_zip' => array(
                'type' => 'VARCHAR',
				'constraint' => '20',
				'null' => TRUE,
			),
			'supplier_tel' => array(
                'type' => 'VARCHAR',
				'constraint' => '45',
				'null' => TRUE,
			),
			'supplier_fax' => array(
                'type' => 'VARCHAR',
				'constraint' => '45',
				'null' => TRUE,
			),
			'supplier_email' => array(
                'type' => 'VARCHAR',
				'constraint' => '45',
				'null' => TRUE,
			),
			'contract_name' => array(
                'type' => 'VARCHAR',
				'constraint' => '100',
				'null' => TRUE,
			),
			'delivery_time'=> array(
                'type' => 'INT',
				'unsigned' => TRUE,
				'null' => TRUE,
			),
			'm_transport_id'=> array(
                'type' => 'INT',
				'unsigned' => TRUE,
				'null' => TRUE,
			),
			'tax_no' => array(
                'type' => 'VARCHAR',
				'constraint' => '20',
				'null' => TRUE,
			),
			'payment_tearm' => array(
                'type' => 'VARCHAR',
				'constraint' => '200',
				'null' => TRUE,
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
        $this->dbforge->create_table('m_suppliers');
    }

    public function down()
    {
        $this->dbforge->drop_table('m_suppliers');
    }
}
?>