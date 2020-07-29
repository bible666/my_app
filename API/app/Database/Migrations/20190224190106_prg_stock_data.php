<?php
namespace App\Database\Migrations;

class Migration_prg_stock_data extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
        insert into prg_stock
        (factory_code,location_code,item_code,lot_no,first_receive_date,quantity,unit_price,create_user)
        values
        ('T0001_F1','IT','IT0001','ไม่ระบุ','2020/01/01',20,200,1),
        ('T0001_F1','IT','IT0002','ไม่ระบุ','2020/01/02',50,500,1),
        ('T0001_F1','IT','IT0003','ไม่ระบุ','2020/01/03',10,1500,1),
        ('T0001_F1','IT','IT0004','ไม่ระบุ','2020/01/04',2,2500,1),
        ('T0001_F1','IT','IT0005','ไม่ระบุ','2020/01/05',20,4500,1),
        ('T0001_F1','IT','IT0006','ไม่ระบุ','2020/01/06',18,7500,1),
        ('T0001_F1','IT','IT0007','ไม่ระบุ','2020/01/07',200,20,1),
        ('T0001_F1','PLANNING','OF0001','ไม่ระบุ','2020/01/11',2,100,1),
        ('T0001_F1','PRODUCTION','OF0001','ไม่ระบุ','2020/01/11',4,100,1),
        ('T0001_F1','PURCHASE','OF0001','ไม่ระบุ','2020/01/11',5,100,1),
        ('T0001_F1','QA','OF0001','ไม่ระบุ','2020/01/11',5,100,1),
        ('T0001_F1','RD F1','OF0001','ไม่ระบุ','2020/01/11',5,100,1),
        ('T0001_F1','SALES','OF0001','ไม่ระบุ','2020/01/11',5,100,1),
        ('T0001_F1','STORE','OF0001','ไม่ระบุ','2020/01/11',5,100,1),
        ('T0001_F1','STORE','MAT001','20200112001','2020/01/12',20000,1000,1),
        ('T0001_F1','STORE','MAT002','20200112002','2020/01/12',20000,1300,1),
        ('T0001_F1','STORE','MAT003','20200113001','2020/01/13',20000,290,1),
        ('T0001_F1','STORE','MAT004','20200114001','2020/01/14',20000,1200,1),
        ('T0001_F1','STORE','MAT005','20200114001','2020/01/14',20000,1200,1),
        ('T0001_F1','STORE','MAT006','20200114001','2020/01/14',20000,1200,1),
        ('T0001_F1','STORE','MAT007','20200114001','2020/01/14',20000,1200,1),
        ('T0001_F1','STORE','MAT008','20200114001','2020/01/14',20000,1200,1),
        ('T0001_F1','STORE','MAT009','20200114001','2020/01/14',20000,1200,1),
        ('T0001_F1','STORE','MAT010','20200114001','2020/01/14',20000,1200,1),
        ('T0001_F1','STORE','MAT011','20200114001','2020/01/14',20000,1200,1);
        ");

    }

    public function down()
    {
        $this->db->query("
            delete prg_stock;
        ");
    }
}
?>