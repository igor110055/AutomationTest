*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/borrow_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
insufficient_balance_and_tradable_balance
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Borrow
    Tap Continue To Borrow Button
    Select Borrow Currency    ADA
    Select Collateral Currency    USDT
    Verify Label Displays    You have insufficient balance in the selected collateral currency. You have insufficient tradable balance to borrow the chosen amount.