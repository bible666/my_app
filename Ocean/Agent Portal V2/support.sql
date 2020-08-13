-- ใช้ในการ เพิ่ม user ที่ไม่มีในระบบโดยการใช้ email ในการ Add
-- การ update หรือ add ให้ทำผ่าน เอกสาร ที่ส่งให้
SELECT * FROM ms_admin_manage_branch;

-- เก็บ ประเภทของ ข่าวสารและความรู้
-- type เป็นตัวบอกว่า ข้อมูลนั้น ๆ เป็นของ ข่าวสาร หรือ ความรู้ โดย n= ข่าวสาร และ k = ความรู้
-- ไม่สมควรแก้ไขเอง
SELECT * FROM ms_knows_group;

-- เก็บรายละเอียดของ ข่าวสาร และ ความรู้
-- type เป็นตัวบอกว่า ข้อมูลนั้น ๆ เป็นของ ข่าวสาร หรือ ความรู้ โดย n= ข่าวสาร และ k = ความรู้
-- fk_knows_group เป็น ตัวบอกว่า ข้อมูลนั้น ๆ เป็นประเภทไหน link กับ ms_knows_group
-- title คือ หัวเรื่องของ ข่าวสาร หรือ ความรู้
-- body คือ รายละเอียดของข่าวสาร หรือ ความรู้
-- show date คือ วันที่ ที่จะแสดงใน ข่าวสาร , เป็นวันที่สร้าง ข่าว
-- start_date , end_date คือช่วงวันที่จะแสดงข่าวสาร ถ้าไม่มี end date คือ ให้เริ่มตั้งแต่ start date และไม่มีวันสิ้นสุด
-- priority คือ ความสำคัญ ถ้าเป็น H สำหรับ ความรู้ จะเป็นการปักหมุดที่หน้าเว็ป ถ้าเป็น H สำหรับ ข่าวสาร จะบังคับ ให้อ่าน
-- active_flag ต้องเป็น y ถึงจะเห็น
-- ถ้า ข่าวสาร หรือ ความรู้ไม่แสดง ให้ตรวจสอบ 
-- 1. เทียบวันที่ปัจจุบัน ต้องอยู่ระหว่าง start_date กับ end_date
-- 2. active_flag  ต้องเป็น y
-- 3. group ของ ข่าวสาร และ ความรู้ ใน db ตรงกับ group ของ ข่าวสารและ ความรู้ที่ ที่แจ้งว่าไม่ขึ้นหรือเปล่า
SELECT * FROM tx_knows_data;

-- หาตาม title ของ ข่าวสาร หรือความรู้
SELECT * FROM tx_knows_data WHERE tile like '%xxxx%';

-- ข้อควรระวัง start_date ต้องน้อยกว่า end_date เสมอ
UPDATE tx_knows_data
SET start_date = '2019-01-01'
WHERE knows_data_id = 16;

UPDATE tx_knows_data
SET end_date = '2019-01-01'
WHERE knows_data_id = 16;


-- Delete ข่าวสารและ ความรู้
UPDATE tx_knows_data
SET active_flag = 'N'
WHERE knows_data_id = 16;

-- เปิดข่าวสารและความรู้
UPDATE tx_knows_data
SET active_flag = 'Y'
WHERE knows_data_id = 16;
