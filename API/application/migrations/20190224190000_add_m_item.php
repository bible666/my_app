<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_m_item extends CI_Migration {

    public function up()
    {
        $this->db->query("
        CREATE View doc_type AS
SELECT 0 AS code , 'BF' AS doc_description
UNION
SELECT 1 AS code , 'Misc In' AS doc_description
UNION
SELECT 2 AS code , 'Reverse Misc In' AS doc_description
UNION
SELECT 10 AS code , 'Stock Import' AS doc_description
UNION
SELECT 11 AS code , 'Receive' AS doc_description
UNION
SELECT 12 AS code , 'Tran In' AS doc_description
UNION
SELECT 13 AS code , 'Inspect In' AS doc_description
UNION
SELECT 15 AS code , 'Reverse Recive' AS doc_description
UNION
SELECT 16 AS code , 'Reverse Tran In' AS doc_description
UNION
SELECT 17 AS code , 'Reverse Inspect In' AS doc_description
UNION
SELECT 18 AS code , 'Tran IN (SubContructor)' AS doc_description
UNION
SELECT 19 AS code , 'Reverse Tran IN (SubContructor)' AS doc_description
UNION
SELECT 20 AS code , 'Tran Out' AS doc_description
UNION
SELECT 21 AS code , 'Inspect Out' AS doc_description
UNION
SELECT 22 AS code , 'Issue' AS doc_description
UNION
SELECT 23 AS code , 'Scrap' AS doc_description
UNION
SELECT 24 AS code , 'Reverse Tran Out' AS doc_description
UNION
SELECT 25 AS code , 'Receive OUT' AS doc_description
UNION
SELECT 26 AS code , 'Reverse Issue' AS doc_description
UNION
SELECT 27 AS code , 'Reverse Scrap' AS doc_description
UNION
SELECT 28 AS code , 'Misc Out' AS doc_description
UNION
SELECT 29 AS code , 'Reverse Misc Out' AS doc_description
UNION
SELECT 30 AS code , 'Tran Out (SubContructor)' AS doc_description
UNION
SELECT 31 AS code , 'Reverse Inspect OUT' AS doc_description
UNION
SELECT 32 AS code , 'Reverse Receive OUT' AS doc_description
UNION
SELECT 33 AS code , 'Reverse Tran OUT (SubContructor)' AS doc_description
UNION
SELECT 34 AS code , 'Credit Note' AS doc_description
UNION
SELECT 35 AS code , 'Reverse Credit Note' AS doc_description
        ");
        // $this->dbforge->add_field(array(
        //     'id' => array(
        //             'type' => 'INT',
        //             'unsigned' => TRUE,
        //             'auto_increment' => TRUE
        //     ),
        //     'm_company_id'=> array(
        //         'type' => 'INT',
        //         'unsigned' => TRUE
        //     ),
        //     'item_code' => array(
        //         'type' => 'VARCHAR',
        //         'constraint' => '20',
        //     ),
        //     'item_name' => array(
        //         'type' => 'VARCHAR',
        //         'constraint' => '200',
        //         'null' => TRUE,
        //     ),
        //     'm_unit_id'=> array(
        //         'type' => 'INT',
        //         'unsigned' => TRUE
        //     ),
        //     'm_item_type_id'=> array(
        //         'type' => 'INT',
        //         'unsigned' => TRUE
        //     ),
        //     'lot_flag'=> array(
        //         'type' => 'INT',
        //         'unsigned' => TRUE
        //     ),
        //     'mrp_flag'=> array(
        //         'type' => 'INT',
        //         'unsigned' => TRUE
        //     ),
        //     'remark' => array(
        //         'type' => 'TEXT',
        //         'null' => TRUE,
        //     ),
        //     'created_date' => array(
        //         'type' => 'DATETIME',
        //         'null' => TRUE,
        //     ),
        //     'created'=> array(
        //         'type' => 'INT',
        //         'unsigned' => TRUE
        //     ),
        //     'updated_date' => array(
        //         'type' => 'DATETIME',
        //         'null' => TRUE,
        //     ),
        //     'updated'=> array(
        //         'type' => 'INT',
        //         'unsigned' => TRUE,
        //         'null' => TRUE,
        //     ),
        // ));
        // $this->dbforge->add_key('id', TRUE);
        // $this->dbforge->create_table('m_item');
    }

    public function down()
    {
        $this->dbforge->drop_table('m_item');
    }
}
?>