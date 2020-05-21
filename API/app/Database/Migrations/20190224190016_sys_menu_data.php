<?php
namespace App\Database\Migrations;

class Migration_sys_menu_data extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            
		INSERT INTO sys_menu 
		(parent_menu_id, menu_type_flag, menu_name, screen_url,menu_position) 
		VALUES 
		(null,'M','ระบบขาย','/',1),
		(null,'M','ระบบคำนวน MRP','/',2),
		(null,'M','ระบบจัดซื้อ','/',3),
		(null,'M','ระบบการผลิต','/',4),
		(null,'M','ระบบคลังสินค้า','/',5),
		(null,'M','ระบบการจัดส่ง','/',6),
		(null,'M','ระบบวัตถุดิบ','/',7),
		(null,'M','การตั้งค่าระบบ','/',8),
		(1,'S','Forecast Entry','/',1),
		(1,'S','Forecast Search','/',2),
		(1,'S','เพิ่มคำสั่งซื้อ','/',3),
		(1,'S','คำสั่งซื้อ','/',4),
		(2,'S','MRP สำหรับ จัดซื้อ','/',1),
		(2,'S','MRP สำหรับ การผลิต','/',2),
		(3,'S','เปิดใบสั่งซื้อ','/',1),
		(3,'S','ใบสั่งซื้อ','/',2),
		(3,'S','รับวัตถุดิบ','/',3),
		(3,'S','เปิด P/R','/',4),
		(4,'S','เปิดใบสั่งผลิต','/',1),
		(4,'S','ใบสั่งผลิต','/',2),
		(4,'S','แผนการผลิต','/',3),
		(4,'S','บันทึกผลการผลิต','/',4),
		(4,'M','การตั้งค่าการผลิต','/',5),
		(24,'S','Process','/',1),
		(24,'S','Line','/',1),
		(24,'S','Line Calendar','/',1),
		(24,'S','Item Capacity','/',1),
		(5,'S','Location Transfer Entry','/',1),
		(5,'S','Order Transfer','/',2),
		(5,'S','Transfer Search','/',3),
		(5,'S','Stock Search','/',4),
		(5,'S','Stock Taking','/',5),
		(5,'S','Stock Taking Result Search','/',6),
		(6,'S','Delivery Order Entry','/',1),
		(6,'S','Delivery Search','/',2),
		(6,'S','Delivery Result Entry','/',3),
		(8,'M','Basic Master','/',1),
		(8,'M','Transaction Master','/',2),
		(8,'M','Admin Master','/',2),
		(37,'S','บริษัท','/',1),
		(37,'S','โรงงาน','/',2),
		(37,'S','พื้นที่จัดเก็บ','/',3),
		(37,'S','สกุลเงิน','/',4),
		(37,'S','หน่วยวัตถุดิบ','/',5),
		(37,'S','ปฏิทิน','/',6),
		(38,'S','วัตถุดิบ','/',1),
		(38,'S','โครงสร้างวัตถุดิบ','/',2),
		(38,'S','ลูกค้า','/',3),
		(38,'S','ราคาขาย','/',4),
		(38,'S','ราคาซื้อ','/',5),
		(39,'S','พนักงาน','/',1)

        ");
    }

    public function down()
    {
        $this->db->query("

		DELETE FROM sys_menu
		");
    }
}
?>