<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_m_companies extends CI_Migration {

    public function up()
    {
        $this->dbforge->add_field(array(
            'id' => array(
                'type' => 'INT',
                'unsigned' => TRUE,
                'auto_increment' => TRUE
            ),
            'company_code'=> array(
                'type' => 'VARCHAR',
                'constraint' => '10'
            ),
            'company_name' => array(
                'type' => 'VARCHAR',
                'constraint' => '100',
            ),
            'company_add1' => array(
                'type' => 'VARCHAR',
                'constraint' => '200',
                'null' => TRUE,
            ),
            'company_add2' => array(
                'type' => 'VARCHAR',
                'constraint' => '200',
                'null' => TRUE,
            ),
            'company_add3' => array(
                'type' => 'VARCHAR',
                'constraint' => '200',
                'null' => TRUE,
            ),
            'company_zip' => array(
                'type' => 'VARCHAR',
                'constraint' => '45',
                'null' => TRUE,
            ),
            'company_tel' => array(
                'type' => 'VARCHAR',
                'constraint' => '45',
                'null' => TRUE,
            ),
            'company_fax' => array(
                'type' => 'VARCHAR',
                'constraint' => '45',
                'null' => TRUE,
            ),
            'company_email' => array(
                'type' => 'VARCHAR',
                'constraint' => '45',
                'null' => TRUE,
            ),
            'company_remark' => array(
                'type' => 'VARCHAR',
                'constraint' => '200',
                'null' => TRUE,
            ),
            'tax_no' => array(
                'type' => 'VARCHAR',
                'constraint' => '45',
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
        $this->dbforge->create_table('m_companies');
    }

    public function down()
    {
        $this->dbforge->drop_table('m_companies');
    }
}
?>