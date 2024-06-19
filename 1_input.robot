*** Settings ***
Documentation    First robot test
Library          SeleniumLibrary
Library    .venv/Lib/site-packages/robot/libraries/XML.py


*** Variables ***
${URL}    https://letcode.in/edit
${BROWSER}        Chrome


*** Keywords ***
Prepare for test
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    3 seconds


*** Test Cases ***
Input Test
    Prepare for test
    Maximize Browser Window
    Input Text    id:fullName    John Doe

    Press Keys    id:join    ${SPACE}
    Press Keys    id:join    Some Text
    Press Keys    id:join    TAB
    
    Clear Element Text    id:clearMe
    Element Should Be Disabled    id:noEdit
    
    Scroll Element Into View    css:.footer
    ${readonly}=    Get Element Attribute    css:#dontwrite    readonly
    
    # run if readonly not equal true else readonly should not be true
    Run Keyword Unless    "${readonly}" == "true"    Fail    Element attribute 'readonly' should not be 'true'

    Sleep    3 seconds
    Close Browser

