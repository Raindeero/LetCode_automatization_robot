*** Settings ***
Documentation    First robot test
Library          SeleniumLibrary
Library    .venv/Lib/site-packages/robot/libraries/XML.py


*** Variables ***
${URL}    https://letcode.in/dropdowns
${BROWSER}        Chrome


*** Test Cases ***
Buttons
    Prepare for test
    Maximize Browser Window

    Click Button    id:fruits
    Click Element    #fruits > option:nth-child(2)
    Element Should Contain    locator    Apple

*** Keywords ***
Prepare for test
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    1 seconds