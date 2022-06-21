*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/common_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/borrow_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/available_balances_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/cryptocurrency_deposit_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/login_keywords.robot
Resource    ../../../../mobile/resources/testdata/staging/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/verification_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/position_detail_keywords.robot

Resource    ../../../../api/resources/init.robot
Resource    ../../../../api/keywords/bitfinex_v1/positions_keywords.robot

Suite Setup    Open Apps    Bitfinex
Suite Teardown    Close Test Application

*** Test Cases ***
# borrow_unverified_account
    # Login And Set Up Pin    ${TEST_DATA_UNVERIFIED_API_KEY}    ${TEST_DATA_UNVERIFIED_API_SECRET}    Staging
    # Tap On Navigation Tab By Name    Account
    # Tap On Account Menu Item    Borrow
    # Tap Continue To Borrow Button
    # Verify Verified Warning Popup Displays
    # Tap Upgrade Button On Verified Warning Popup
    # Verify Verification Screen Displays
    # Tap On Back Button
    # Logout Bitfinex

borrow_basic_plus_account    
    Login And Set Up Pin    ${TEST_DATA_BASIC_PLUS_API_KEY}    ${TEST_DATA_BASIC_PLUS_API_SECRET}    Staging
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Borrow
    Verify Currency On Borrow
    Tap Continue To Borrow Button
    Verify Borrow Screen Displays
    Tap On Back Button
    Logout Bitfinex

borrow_basic_intermediate_account    
    Login And Set Up Pin    ${TEST_DATA_INTERMIDIATE_API_KEY}    ${TEST_DATA_INTERMIDIATE_API_SECRET}    Staging
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Borrow
    Verify Currency On Borrow
    Tap Continue To Borrow Button
    Verify Borrow Screen Displays
    Tap On Back Button
    Logout Bitfinex