*** Settings ***
Resource    ../../resources/locators/testpad/script_locators.robot
Resource    ../../../utility/common/locator_common.robot

Resource    ../common/web_common.robot
*** Keywords ***
Click Create New Test Run Button
    Click Visible Element    ${btn_create_new_test_run}
    
Select Test Can Run By Dropdown
    [Arguments]    ${tester}
    Click Visible Element    ${drd_test_can_run_by}
    ${tester_element}    Generate Element From Dynamic Locator    ${drd_test_can_run_by_item}    ${tester}
    Click Visible Element    ${tester_element}
    
Click Compose And Send Email Button
    Click Visible Element    ${btn_compose_and_send_email}
    
Click I Really Do Want A New Test Button
    Run Keyword And Continue On Failure    Click Visible Element    ${btn_i_really_do_want_a_new_test}
    
Submit Test Run Details
    [Arguments]    ${tester}    ${build}    ${email}
    Select Test Can Run By Dropdown    guest
    Input Text To Element    ${txt_tester_alias}    ${tester}
    Input Text To Element    ${txt_build}    ${build}
    Click Compose And Send Email Button
    Input Text To Element    ${txt_email_to}    ${email}
    Click Visible Element    ${btn_send_email}
    Click Visible Element    ${btn_save_test_run_details}
    Sleep    1s    