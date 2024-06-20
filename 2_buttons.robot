*** Settings ***
Documentation    First robot test
Library          SeleniumLibrary
Library    .venv/Lib/site-packages/robot/libraries/XML.py


*** Variables ***
${URL}    https://letcode.in/buttons
${BROWSER}        Chrome

${HOLD_BUTTON}    //button[contains(., 'Button')]
${hold_button}    css://#color

*** Keywords ***
Prepare for test
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    1 seconds


*** Test Cases ***
Buttons
    Prepare for test
    Maximize Browser Window

    Click Button    id:home
    Go Back

    ${y_coord}=    Get Vertical Position    id:position
    ${x_coord}=    Get Horizontal Position    id:position
    Log    Y coordinate: ${y_coord}
    Log    X coordinate: ${x_coord}


    ${color}=    Get Element Attribute    id:color    style.background-color
    Log    Button color:${color}

    Mouse Down        ${HOLD_BUTTON}
    Wait Until Page Contains    Button has been long pressed    timeout=5s
    Mouse Up    ${HOLD_BUTTON}