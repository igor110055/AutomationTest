*** Settings ***
Resource    ../../resources/init.robot
Resource    ../../keywords/bitfinex_v1/bitfinex_common.robot
Resource    ../../keywords/bitfinex_v1/public_api_keywords.robot

Test Setup    Create Bitfinex V1 Session
Test Teardown     Delete All Sessions

*** Variables ***

*** Test Cases ***
public_api
    [Documentation]    Public APIs
    [Tags]    Regression    High    Smoke
    Get Ticker    btcusd
    Response Correct Code    ${SUCCESS_CODE}
    Get Symbols
    Response Correct Code    ${SUCCESS_CODE}
    Get Stats    btcusd
    Response Correct Code    ${SUCCESS_CODE}
    Get Funding Book    usd
    Response Correct Code    ${SUCCESS_CODE}
    Get Order Book    btcusd
    Response Correct Code    ${SUCCESS_CODE}
    Get Trades    btcusd
    Response Correct Code    ${SUCCESS_CODE}
    Get Lends    usd
    Response Correct Code    ${SUCCESS_CODE}
    Get Symbol Detail
    Response Correct Code    ${SUCCESS_CODE}