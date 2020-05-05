<?php
namespace App\Database\Migrations;

class Migration_mst_user_data extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            
            INSERT mst_user 
            (user_id, title, first_name, last_name, staff_cat, join_date, login_id, user_password, user_group_id, remark, active_flag, create_date, update_date, create_user, update_user) 
            VALUES 
            (1, 1, 'Admi', 'Admi',4,'2011-01-01','admi', 'admi',1, '', 0,'2013-06-20 10:49:09','2013-06-20 10:49:09',1, 1),
            (2, 3, 'Prathummayo', 'Kanjana',0,'2014-05-15','PL01', 'pl01',17, 'Domestic Purchasing', 0,'2014-05-15 15:00:25', '2014-12-19 11:22:12',1, 1),
            (3, 2, 'Boonyarat', '',0,'2014-05-15','King', '0831566566',1, '', 1,'2014-05-15 15:23:01', '2014-12-19 13:11:42',1, 1),
            (4, 1, 'Maruyama', '', 0,'2014-05-15','maruyama', 'met01',1, '', 1,'2014-05-15 15:47:45' , '2014-12-19 13:11:42',1, 1),
            (5, 1, 'Nattawi', '',0,'2014-07-17','Nattawi', 'Nattawi',1, '', 1,'2014-07-17 10:27:31', '2014-12-19 13:11:42' , 1, 1),
            (6, 1, 'ttt', 't',0, '2014-08-18','tre', 'rtty',1, '', 1,'2014-08-18 11:07:14', '2014-12-19 13:11:42', 1, 1),
            (7, 1, 'e', '', 0,'2014-08-18','5', '6',1, '', 1,'2014-08-18 11:07:14', '2014-12-19 13:11:42', 1, 1),
            (8, 1, 'Seki', 'Taro',0,'2014-10-10','seki', 'seki',2, 'seki Test 234', 1,'2014-10-10 18:51:47', '2014-12-19 13:11:42', 1, 1),
            (9, 3, 'ngvhj', '', 0,'2014-12-19', 'ghf', 'nvb',15, '', 1,'2014-12-19 13:08:20', '2014-12-19 13:11:42', 1, 1),
            (10, 5, 'sdf', '',0,'2014-12-19',  'ert', 'sf',25, '', 1,'2014-12-19 13:09:52', '2014-12-19 13:11:42', 1, 1),
            (11, 3, 'Silatong', 'Srisuda',0,'2014-12-19','pl02', 'pl02',17, 'Over Sea Purchasing', 0,'2014-12-19 13:15:26', '2014-12-19 13:15:26', 1, 1),
            (12, 3, 'Mongkhonmafai', 'Wanida', 0,'2014-12-19','pl03', 'pl03',17, '', 0,'2014-12-19 13:15:26', '2014-12-19 13:15:26', 1, 1),
            (13, 1, 'Chalermsiri', 'Chalerm', 0,'2015-01-07','psa01', 'psa01', 26, '', 0,'2015-01-07 09:22:10','2015-01-07 09:22:10', 1, 1),
            (14, 1, 'Pheesadech', 'Tungsakool',0,'2015-01-07','psa02', 'psa02',26, '', 0,'2015-01-07 09:24:08', '2015-01-07 09:24:08', 1, 1),
            (15, 1, 'Yushi', 'Sato', 0,'2015-01-08','prm01', 'prm01', 14, '', 1,'2015-01-08 09:14:05', '2015-07-22 21:26:00', 1, 1),
            (16, 1, 'Pairat', 'Deepachu',  0,'2015-01-09','lg01', 'lg01',19, '', 0,'2015-01-09 15:21:58', '2015-01-09 15:21:58', 1, 1)

        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_user_group');
    }
}
?>