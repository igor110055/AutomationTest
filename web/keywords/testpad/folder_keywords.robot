*** Settings ***
Resource    ../../resources/locators/testpad/folder_locators.robot
Resource    ../../../utility/common/locator_common.robot
*** Keywords ***
Click Test Run
    [Arguments]    ${test_run}
    ${test_run_element}    Generate Element From Dynamic Locator    ${lbl_test_run_by_text}    ${test_run}
    Scroll To Element    ${test_run_element}
    Click Visible Element    ${test_run_element}