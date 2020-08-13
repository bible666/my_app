*** Settings ***
Documentation   Define Function

*** Variables ***

*** Keywords ***
Login เข้าใช้งานระบบ
    [Arguments]	${userlogin}	${password}	${ID}
    Input Text	inputLogin	${userlogin}
    Input Text	inputPassword	${password}
    Click Button	Sign in

เปิด menu knowledge
    
