*** Settings ***
Resource    ../../../utility/common/string_common.robot
Resource    ../../../mobile/keywords/bitfinex/common_keywords.robot

# Test Setup    Create Bitfinex V1 Session
# Test Teardown    Close Test Application
*** Variables ***
${test}    [22,259][1058,543]

*** Test Cases ***
draft_test
    ${return_values}    Get Element Boundary Values    ${drd_payment_transport}