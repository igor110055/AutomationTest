*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/deposit_keywords.robot

Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login And Set Up Pin Turkish App    ${TEST_DATA_BASIC_VERIFIED_API_KEY}    ${TEST_DATA_BASIC_VERIFIED_API_SECRET}    Production    lite_mode=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
insufficient_fund
    Tap On Navigation Tab By Name    Trading
    Access Trading Pair    BTCUSD
    Create Market Order In Lite Mode    65000    1    SELL
    Verify Failed To Place Order

*** Keywords ***
Verify Failed To Place Order
    Verify Label Displays    FAILED TO PLACE ORDER
    Verify Label Displays    Insufficient Funds
    Verify Label Displays    Please make a deposit in wallet to complete the order.
    Tap Element By Label    Deposit
    Verify Deposit Screen Displays
    Tap On Back Button