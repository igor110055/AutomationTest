*** Settings ***
Documentation    CALCULATION

Resource    ../../resources/init.robot
Resource    ../../keywords/bitfinex/bitfinex_v2_common.robot
Resource    ../../keywords/bitfinex/calculation_keywords.robot

Test Setup    Create Bitfinex Session
Test Teardown     Delete All Sessions

*** Variables ***

*** Test Cases ***
CALCULATION
    [Documentation]    CALCULATION
    [Tags]    draft
    Post Foreign Exchange Rate    BTC    USD
    Response Correct Code    ${SUCCESS_CODE}
    
    Post Market Average Price    symbol=tBTCUSD&amount=100&period=2
    Response Correct Code    ${SUCCESS_CODE}