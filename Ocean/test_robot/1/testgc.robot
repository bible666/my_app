*** Settings ***
Library         Selenium2Library
Library         DatabaseLibrary
Resource        function_g.robot
Suite Setup     ตั้งต้นระบบ
Suite Teardown  Disconnect From Database

*** Variables ***

*** Keywords ***

*** Test Cases ***
เพิ่ม knowledge ใหม่
  [tags]  ok
  #Delete All Rows From Table  ms_knows_group
  Check If Exists in Database   select * from ms_knows_group
  #เปิด web google
  #ค้นหาด้วยเงื่อนไข   หิวข้าว
#ทดสอบการเข้าทำการ login
  #[tags]  ไม่รู้ว่าจะทำอะไร
  #ไปที่ url   http://testing-ground.scraping.pro/login
  #ทำการ login ด้วย     jung     d1234
  #ทำการเพิ่มข้อมูล newskm    ทั่วไป       ทดสอบระบบ    รายละเอิีวด     2019/11/12    2019/12/01   2019/12/31     h  save ok
  #ใส่ค่าใน  usr   user
  #ใส่ค่าใน  pwd   password
  #ยืนยัน form

