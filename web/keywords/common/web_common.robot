*** Settings ***
Library    DateTime
Library    Collections
Library    String
Library    SeleniumLibrary    timeout=10s    implicit_wait=5s

*** Variables ***
@{chrome_arguments}    --disable-infobars    --headless    --disable-gpu     --no-sandbox    --disable-dev-shm-usage

*** Keywords ***
Open Browser With Option
    [Arguments]    ${url}    ${browser}=Chrome
    Navigate To Url    ${browser}    ${url}
    Maximize Browser Window

Navigate To Url
    [Arguments]    ${browser}    ${url}
    Open Browser    ${url}    ${browser}

Go To Url
    [Arguments]    ${url}
    Go To    ${url}

Clean Environment
    Close All Browsers
    
Input Text To Element
    [Arguments]    ${element}    ${text}
    Input Text    ${element}    ${text}
    
Click Visible Element
    [Arguments]    ${element}
    Click Element    ${element}    

Scroll To Element
    [Arguments]    ${element}
    Scroll Element Into View    ${element}
    
Navigate Back
    Go Back