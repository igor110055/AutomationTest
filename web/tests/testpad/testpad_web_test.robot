*** Settings ***
Resource    ../../resources/init.robot
Resource    ../../keywords/testpad/testpad_common_keywords.robot
Resource    ../../keywords/testpad/script_keywords.robot
Resource    ../../keywords/testpad/folder_keywords.robot

*** Variables ***
${version}    1.36
${version_folder_url}    https://bitfinex.ontestpad.com/project/2/folder/f47/

*** Test Cases ***
testpad_web
    Open Browser With Option    https://ontestpad.com/login
    Login Testpad    vuong.van@bitfinex.com    3V@bkdn0707
    Go To Url    ${version_folder_url}
    Create Test Pad Test Run For Web    Securities (WIP)    vuong.van@bitfinex.com
    Create Test Pad Test Run For Web    Margin balance, liq price and summary    vuong.van@bitfinex.com
    
*** Keywords ***
Create Test Pad Test Run For Web
    [Arguments]    ${test_run}    ${tester}    ${build}=${version}
    Click Test Run    ${test_run}
    Click Create New Test Run Button
    Click I Really Do Want A New Test Button
    Submit Test Run Details    ${tester}    ${build}    ${tester}
    Navigate Back