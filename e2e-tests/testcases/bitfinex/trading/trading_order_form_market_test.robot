*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/collateral_haircuts_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/calculator_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_PAPER_TRADING_API_KEY}    ${TEST_DATA_PAPER_TRADING_API_SECRET}    Production
Suite Teardown    Close Test Application
*** Test Cases ***
trading_order_form_market_tabs
    [Tags]     smoke    prod_paper
    Access Trading Pair    TESTBTC:TESTUSD
    Swipe To Panel    ORDER BOOK    0.1    DOWN
    Select Order Type    Market
    Verify Order Form Tabs

trading_order_form_market_exchange    
    Create Market Order    0.0025    buy
    Create Market Order    0.0025    sell

trading_order_form_market_margin
    Select Order Form Tab    Margin
    Create Market Order    0.0025    buy
    Create Market Order    0.0025    sell
        
*** Keywords ***
Verify Order Form Tabs
    Select Order Form Tab    Account Summary
    Click Visible Element    ${lnk_collateral_info}
    Verify Collateral Haircuts Screen Displays
    Tap On Back Button
    Select Order Form Tab    Account Summary
    Select Order Form Tab    Margin
    Select Order Form Tab    Calculator
    Verify Calculator Screen Displays
    Tap On Back Button
    Select Order Form Tab    Exchange