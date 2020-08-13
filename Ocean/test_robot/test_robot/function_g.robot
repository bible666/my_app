*** Settings ***
Documentation   Define Function

*** Variables ***

*** Keywords ***
#Click Element  //h3[@class="kkk"]
ตั้งต้นระบบ
    Connect To Database   
#Execute Sql Script  ./resources/init_news.sql
เปิด web google
    Open Browser  https://google.com  gc
    Maximize Browser Window

ค้นหาด้วยเงื่อนไข
    [Arguments]     ${search}
    Input Text	q	${search}
    Submit Form

ไปที่ url
    [Arguments]     ${url}
    go to   ${url}

ใส่ค่าใน
    [Arguments]     ${id}   ${value}
    Input Text  ${id}   ${value}

ยืนยัน form
    Submit Form

ทำการ login ด้วย
    [Arguments]     ${login}    ${pwd}
    Input Text  usr     ${login}
    Input Text  pwd     ${pwd}
    Submit Form

ทำการเพิ่มข้อมูล newskm
    [Arguments]     ${types}     ${fk_knows_group}  ${title}    ${body}     ${show_date}    ${start_date}   ${end_date}     ${piority}  ${message}
    go to   https://192.168.1.1/test/newskm/
    Click Button    btn_add
    Input Text  name_types      ${types}
    Input Text  fk_knows_group  ${fk_knows_group}
    Input Text  title           ${title}
    Input Text  body            ${body}
    Input Text  show_date       ${show_date}
    Input Text  start_date      ${start_date}
    Input Text  end_date        ${end_date}
    Input Text  piority         ${piority}
    Submit Form
    Wait Until Page Contains    ${message}
    go to   https://localhost/test/newskm/
    Input Text  search_title    ${edit_title}
    Submit Form
    Click Button    edit
    ${old_title}    Get Text    title
    Should Be Equal     ${title}    ${old_title}

ทำการแก้ไขข้อมูล newskm
    [Arguments]     ${edit_title}  ${types}     ${fk_knows_group}  ${title}    ${body}     ${show_date}    ${start_date}   ${end_date}     ${piority}  ${message}
    go to   https://localhost/test/newskm/
    Input Text  search_title    ${edit_title}
    Submit Form
    Click Button    edit
    Input Text  name_types      ${types}
    Input Text  fk_knows_group  ${fk_knows_group}
    Input Text  title           ${title}
    Input Text  body            ${body}
    Input Text  show_date       ${show_date}
    Input Text  start_date      ${start_date}
    Input Text  end_date        ${end_date}
    Input Text  piority         ${piority}
    Submit Form
    Wait Until Page Contains    ${message}
