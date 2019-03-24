<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_t_tokens extends CI_Migration {

    public function up()
    {
        $this->dbforge->add_field(array(
            'id' => array(
                'type' => 'INT',
                'unsigned' => TRUE,
                'auto_increment' => TRUE
			),
            'm_staff_id'	=> array(
				'type' => 'INT',
                'unsigned' => TRUE
			),
            'token'=> array(
                'type' => 'VARCHAR',
                'constraint' => '200'
            ),
            'del_flag'=> array(
                'type' => 'INT',
                'unsigned' => TRUE
            ),
            'created_date' => array(
                'type' => 'DATETIME'
            ),
        ));
        $this->dbforge->add_key('id', TRUE);
        $this->dbforge->create_table('t_tokens');
    }

    public function down()
    {
        $this->dbforge->drop_table('t_tokens');
    }
}
?>