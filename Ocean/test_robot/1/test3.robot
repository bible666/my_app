*** Settings ***
Library         Selenium2Library
Documentation    Tests to verify that account withdrawals succeed and
...              fail correctly depending from users account balance
...              and account type dependent rules.
...              See http://internal.example.com/docs/abs.pdf
Metadata         Version    0.1
#Test Setup      Open Test
#Test Teardown   Close All Browsers
Suite Setup     Log to console  Hello World
Suite Teardown  Log to console  Goodbye!!!

*** Variables ***
${URL}  https://www.google.co.th
${BROWSER}  chrome
${MESSAGE}  I'm working


*** Keywords ***


*** Test Cases ***
test login ok
  Open Browser  https://www.google.com/  ${BROWSER}
  Input Text	q	helloooo

