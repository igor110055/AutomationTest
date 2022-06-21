*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/common_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_BASIC_VERIFIED_API_KEY}    ${TEST_DATA_BASIC_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application
*** Test Cases ***
limit
    Access Trading Pair    BTCUSD
    Swipe To Panel    ORDER BOOK    0.1    DOWN
    Select Order Type    Limit
    Create Limit Order    1.1.1    1
    Verify Buy And Sell Buttons Are Disabled
    Create Limit Order    1    1.1.1
    Verify Buy And Sell Buttons Are Disabled

market
    Select Order Type    Market
    Create Market Order    1.1.1
    Verify Buy And Sell Buttons Are Disabled
    
stop
    Select Order Type    Stop
    Create Stop Order    1.1.1    1
    Verify Buy And Sell Buttons Are Disabled
    Create Stop Order    1    1.1.1
    Verify Buy And Sell Buttons Are Disabled
    
stop_limit
    Select Order Type    Stop Limit
    Create Stop Limit Order    1.1.1    1    1
    Verify Buy And Sell Buttons Are Disabled
    Create Stop Limit Order    1    1.1.1    1
    Verify Buy And Sell Buttons Are Disabled
    Create Stop Limit Order    1    1    1.1.1
    Verify Buy And Sell Buttons Are Disabled

trailing_stop    
    Select Order Type    Trailing Stop
    Create Trailing Stop Order    1.1.1    1
    Verify Buy And Sell Buttons Are Disabled
    Create Trailing Stop Order    1    1.1.1
    Verify Buy And Sell Buttons Are Disabled

fill_or_kill
    Select Order Type    Fill or Kill
    Create Fill Or Kill Order    1.1.1    1
    Verify Buy And Sell Buttons Are Disabled
    Create Fill Or Kill Order    1    1.1.1
    Verify Buy And Sell Buttons Are Disabled
 
immediate_or_cancel   
    Select Order Type    Immediate or Cancel
    Create Immediate Or Cancel Order    1.1.1    1
    Verify Buy And Sell Buttons Are Disabled
    Create Immediate Or Cancel Order    1    1.1.1
    Verify Buy And Sell Buttons Are Disabled