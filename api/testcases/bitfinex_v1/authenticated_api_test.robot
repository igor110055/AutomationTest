*** Settings ***
Documentation    REST AUTHENTICATED ENDPOINTS

Resource    ../../resources/init.robot
Resource    ../../keywords/bitfinex_v1/bitfinex_common.robot
Resource    ../../keywords/bitfinex_v1/authenticated_api_keywords.robot

Test Setup    Create Bitfinex V1 Session
Test Teardown     Delete All Sessions

*** Variables ***

*** Test Cases ***
authenticated_test
    [Documentation]    REST AUTHENTICATED ENDPOINTS
    [Tags]    smoke
    Post Account Infor
    Response Correct Code    ${SUCCESS_CODE}
    
    # Post Account Fee
    # Response Correct Code    ${SUCCESS_CODE}
    
    # Post Summary
    # Response Correct Code    ${SUCCESS_CODE}
    
    # Post Deposit    bitcoin    exchange
    # Response Correct Code    ${SUCCESS_CODE}
    
    # Post Key Permissions
    # Response Correct Code    ${SUCCESS_CODE}
    
    # Post Margin Information
    # Response Correct Code    ${SUCCESS_CODE}
    
    # Post Wallet Balances
    # Response Correct Code    ${SUCCESS_CODE}
    
    # Post Transfer Between Wallets    1    BTC    deposit    trading
    # Response Correct Code    ${SUCCESS_CODE}