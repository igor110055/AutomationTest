*** Settings ***
Documentation    POSITIONS

Resource    ../../resources/init.robot
Resource    ../../keywords/bitfinex_v1/bitfinex_common.robot
Resource    ../../keywords/bitfinex_v1/positions_keywords.robot

Test Setup    Create Bitfinex V1 Session
Test Teardown     Delete All Sessions

*** Test Cases ***
positions_test
    [Documentation]    ORDERS
    [Tags]    Regression    High    Smoke
    Post Active Positions
    Response Correct Code    ${SUCCESS_CODE}