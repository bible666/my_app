<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_m_staffs extends CI_Migration {

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
			'staff_no'=> array(
                'type' => 'VARCHAR',
				'constraint' => '45',
				'null' => TRUE,
			),
			'title'=> array(
                'type' => 'INT',
				'unsigned' => TRUE,
				'null' => TRUE,
			),
			'sur_name'=> array(
                'type' => 'VARCHAR',
				'constraint' => '45'
			),
			'given_name'=> array(
                'type' => 'VARCHAR',
				'constraint' => '45'
			),
			'staff_cat'=> array(
                'type' => 'INT',
				'unsigned' => TRUE,
				'null' => TRUE,
			),
			'join_date'=> array(
                'type' => 'date',
				'null' => TRUE,
			),
			'staff_login'=> array(
                'type' => 'VARCHAR',
				'constraint' => '45'
			),
			'staff_pwd'=> array(
                'type' => 'VARCHAR',
				'constraint' => '200'
			),
			'm_user_group_id'=> array(
                'type' => 'INT',
				'unsigned' => TRUE,
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
        $this->dbforge->create_table('m_staffs');
    }

    public function down()
    {
        $this->dbforge->drop_table('m_staffs');
    }
}
?>