*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/derivatives_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/derivatives_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_BASIC_SIGNUP_AFTER_01JAN2022_KEY}    ${TEST_DATA_BASIC_SIGNUP_AFTER_01JAN2022_SECRET}    Production
Suite Teardown    Close Test Application
*** Test Cases ***
after_01jan2022_trading
    Search Ticker    BTCUSD
    Access Trading Pair    BTCUSD
    Swipe To Panel    ORDER BOOK    0.1    DOWN
    Select Order Form Tab    Margin
    Select Order Type    Limit
    Verify Label Displays    Verify your account to Basic Plus (or above) in order to proceed
    Select Order Type    Market
    Verify Label Displays    Verify your account to Basic Plus (or above) in order to proceed
    Select Order Type    Stop
    Verify Label Displays    Verify your account to Basic Plus (or above) in order to proceed
    Select Order Type    Stop Limit
    Verify Label Displays    Verify your account to Basic Plus (or above) in order to proceed
    Select Order Type    Trailing Stop
    Verify Label Displays    Verify your account to Basic Plus (or above) in order to proceed
    Select Order Type    Fill or Kill
    Verify Label Displays    Verify your account to Basic Plus (or above) in order to proceed
    Select Order Type    Immediate or Cancel
    Verify Label Displays    Verify your account to Basic Plus (or above) in order to proceed
    Select Order Type    Limit (Order Book)
    Verify Label Displays    Verify your account to Basic Plus (or above) in order to proceed
    Select Order Type    Scaled
    Verify Label Displays    Verify your account to Basic Plus (or above) in order to proceed    DOWN
    
after_01jan2022_derivatives
    Tap On Back Button
    Tap On Navigation Tab By Name    Derivatives
    Access Trading Pair On Derivatives    BTCF0:USTF0
    Scroll To Panel On Derivative Pair    ORDER BOOK    0.17    DOWN
    Select Order Type On Derivatives    Limit
    Verify Label Displays    Verify your account to Basic Plus (or above) in order to proceed
    Select Order Type On Derivatives    Market
    Verify Label Displays    Verify your account to Basic Plus (or above) in order to proceed
    Select Order Type On Derivatives    Stop
    Verify Label Displays    Verify your account to Basic Plus (or above) in order to proceed
    Select Order Type On Derivatives    Stop Limit
    Verify Label Displays    Verify your account to Basic Plus (or above) in order to proceed
    Select Order Type On Derivatives    Trailing Stop
    Verify Label Displays    Verify your account to Basic Plus (or above) in order to proceed
    Select Order Type On Derivatives    Fill or Kill
    Verify Label Displays    Verify your account to Basic Plus (or above) in order to proceed
    Select Order Type On Derivatives    Immediate or Cancel
    Verify Label Displays    Verify your account to Basic Plus (or above) in order to proceed
    Select Order Type On Derivatives    Limit (Order Book)
    Verify Label Displays    Verify your account to Basic Plus (or above) in order to proceed
    Select Order Type On Derivatives    Scaled
    Verify Label Displays    Verify your account to Basic Plus (or above) in order to proceed    swipe=DOWN
    
after_01jan2022_funding
    Tap On Back Button
    Tap On Navigation Tab By Name    Funding
    Access Trading Pair On Funding    USD
    Verify Label Displays    Verify your account to Basic Plus (or above) in order to proceed    swipe=DOWN
    
after_01jan2022_borrow
    Tap On Back Button
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Borrow
    Verify Label Displays    In order to proceed with borrowing, please verify your account to Basic Plus or above