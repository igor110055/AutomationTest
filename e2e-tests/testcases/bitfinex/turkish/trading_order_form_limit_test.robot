*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/common_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/collateral_haircuts_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/calculator_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login And Set Up Pin Turkish App    ${TEST_DATA_PAPER_TRADING_API_KEY}    ${TEST_DATA_PAPER_TRADING_API_SECRET}    Production
Suite Teardown    Close Test Application
*** Test Cases ***
trading_order_form_tabs
    Access Trading Pair    TESTBTC:TESTUSD
    Swipe To Panel    ORDER BOOK    0.1    DOWN
    Select Order Form Tab    Account Summary
    Click Visible Element    ${lnk_collateral_info}
    Verify Collateral Haircuts Screen Displays
    Tap On Back Button
    Select Order Form Tab    Account Summary
    Select Order Form Tab    Calculator
    Verify Calculator Screen Displays
    Tap On Back Button
    Select Order Form Tab    Exchange
    Select Order Type    Limit
    Verify Label Not Display    Margin
    
trading_order_form_highest_bid_exchange
    Tap Highest Bid Button
    Verify Highest Bid Populated

trading_order_form_lowest_ask_exchange
    Tap Lowest Ask Button
    Verify Lowest Ask Populated
    
trading_order_form_top_bid_exchange
    Tap Top Bid Button
    Verify Highest Bid Populated
    
trading_order_form_top_ask_exchange
    Tap Top Ask Button
    Verify Lowest Ask Populated
    
trading_order_form_max_buy_exchange
    Tap Max Buy Button
    Verify Max Buy Populated

trading_order_form_max_sell_exchange
    Clear Order Amount
    Tap Max Sell Button
    Verify Max Sell Populated
    
trading_order_form_verify_order_types
    Select Order Type    Stop
    Select Order Type    Stop Limit
    Select Order Type    Trailing Stop
    Select Order Type    Fill or Kill
    Select Order Type    Immediate or Cancel
    Select Order Type    Limit (Order Book)
    Select Order Type    Scaled