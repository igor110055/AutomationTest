*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/common_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/derivatives_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/derivatives_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/calculator_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_PAPER_TRADING_API_KEY}    ${TEST_DATA_PAPER_TRADING_API_SECRET}    Production
Suite Teardown    Close Test Application
*** Test Cases ***
derivatives_order_form_tabs
    Tap On Navigation Tab By Name    Derivatives
    Access Trading Pair On Derivatives    TESTBTCF0:TESTUSDTF0
    Scroll To Panel On Derivative Pair    ORDER BOOK    0.17    DOWN
    Select Order Type On Derivatives    Limit
    Verify Order Form Tabs Derivatives

derivatives_order_form_highest_bid
    Tap Highest Bid On Derivatives
    Verify Highest Bid Populated On Derivatives
    
derivatives_order_form_lowest_ask
    Tap Lowest Ask On Derivatives
    Verify Lowest Ask Populated On Derivatives

derivatives_order_form_top_bid
    Tap Top Bid On Derivatives
    Verify Highest Bid Populated On Derivatives
    
derivatives_order_form_top_ask
    Tap Top Ask On Derivatives
    Verify Lowest Ask Populated On Derivatives

derivatives_order_form_max_buy
    Tap Max Buy On Derivatives
    Verify Max Buy Populated On Derivatives
    
derivatives_order_form_max_sell
    Tap Max Sell On Derivatives
    Verify Max Sell Populated On Derivatives

*** Keywords ***
Verify Order Form Tabs Derivatives
    Select Order Form Tab Derivatives    Account Summary
    Select Order Form Tab Derivatives    Account Summary
    Select Order Form Tab Derivatives    Calculator
    Verify Calculator Screen Displays
    Tap On Back Button