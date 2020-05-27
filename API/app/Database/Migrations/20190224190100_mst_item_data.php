<?php
namespace App\Database\Migrations;

class Migration_mst_item_data extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            insert into mst_item
            (item_code,item_name,lot_flag,unit_code,production_lead_time,request_decimal,mrp_flag,active_flag,create_user)
			values
			('IT0001','Mouse PS2',false,'pcs',0,0,false,true,1),
			('IT0002','Mouse WIFI',false,'pcs',0,0,false,true,1),
			('IT0003','Mouse Bluetooth',false,'pcs',0,0,false,true,1),
			('IT0004','จอคอม 24นิ้ว',false,'pcs',0,0,false,true,1),
			('IT0005','จอคอม 36นิ้ว',false,'pcs',0,0,false,true,1),
			('IT0006','จอคอม 48นิ้ว',false,'pcs',0,0,false,true,1),
			('IT0007','แผ่นรอง mouse',false,'pcs',0,0,false,true,1),
			('IT0008','Keyboard',false,'pcs',0,0,false,true,1),
			('IT0009','PC รุ่นปี 2018',false,'pcs',0,0,false,true,1),
			('IT0010','PC รุ่นปี 2019',false,'pcs',0,0,false,true,1),
			('IT0011','PC รุ่นปี 2020',false,'pcs',0,0,false,true,1),
			('IT0012','Keyboard WIFI',false,'pcs',0,0,false,true,1),
			('IT0013','Keyboard Bluetooth',false,'pcs',0,0,false,true,1),
			('IT0014','ปักสามตา แบบ 3 รู',false,'pcs',0,0,false,true,1),
			('IT0015','ปักสามตา แบบ 6 รู',false,'pcs',0,0,false,true,1),
			('IT0016','กระเป๋าใส่ Notebook',false,'pcs',0,0,false,true,1),
			('IT0017','Notebook รุ่นปี 2018',false,'pcs',0,0,false,true,1),
			('IT0018','Notebook รุ่นปี 2019',false,'pcs',0,0,false,true,1),
			('IT0019','Notebook รุ่นปี 2020',false,'pcs',0,0,false,true,1),
			('OF0001','กระดาษ A4',false,'box',0,0,false,true,1),
			('OF0002','สมุดจดงาน',false,'book',0,0,false,true,1),
			('OF0003','เก้าอี้สำนักงาน',false,'book',0,0,false,true,1),
			('OF0004','โต๊ะทำงานขนาด 16 นิ้ว',false,'book',0,0,false,true,1);


            
            
        ");
    }
	//('box','กล่อง',true,now(),1),
	// ('cm','เซนติเมตร',true,now(),1),
	// ('can','กระป๋อง',true,now(),1),
	// ('kg','กิโลกรัม',true,now(),1),
	//('book','เล่ม',true,now(),1),
	// ('l','ลิตร',true,now(),1),
	// ('m','เมตร',true,now(),1),
	// ('mm','มิลลิเมตร',true,now(),1),
	// ('pcs','ชิ้น',true,now(),1),
	// ('m²','ตารางเมตร',true,now(),1);
    public function down()
    {
        $this->db->query("
            delete mst_item;
        ");
    }
}
?>