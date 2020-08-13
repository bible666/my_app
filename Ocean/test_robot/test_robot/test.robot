*** Settings ***
Library         Selenium2Library
Documentation    Tests to verify that account withdrawals succeed and
...              fail correctly depending from users account balance
...              and account type dependent rules.
...              See http://internal.example.com/docs/abs.pdf
Metadata          Version    0.1
Resource          function.robot
Test Setup        Open Test
#Test Teardown    Close All Browsers
Suite Setup       Log to console  Hello World
Suite Teardown    Log to console  Goodbye!!!

*** Variables ***
${URL}      http://ct-web.coresv.com/
${BROWSER}  chrome
${menu}     http://ct-web.coreserv.com/mytest


*** Keywords ***
Open Test
  Open Browser  ${URL}  ${BROWSER}



*** Test Cases ***
เพิ่ม knowledge ใหม่
  Login เข้าใช้งานระบบ    bom111111   bom111111


