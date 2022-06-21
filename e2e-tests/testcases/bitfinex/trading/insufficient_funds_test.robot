*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/deposit_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_BASIC_VERIFIED_API_KEY}    ${TEST_DATA_BASIC_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application
*** Test Cases ***
market
    Tap On Navigation Tab By Name    Trading
    Access Trading Pair    BTCUSD
    Swipe To Panel    ORDER BOOK    0.1    DOWN
    Select Order Type    Market
    Create Market Order    1    buy
    Verify Failed To Place Order
    
limit
    Select Order Type    Limit
    Create Limit Order    65000    1    sell
    Verify Failed To Place Order

stop
    Select Order Type    Stop
    Create Stop Order    65000    1    transaction_type=buy
    Verify Failed To Place Order

stop_limit
    Select Order Type    Stop Limit
    Create Stop Limit Order    65000    35000    1    transaction_type=buy
    Verify Failed To Place Order

trailing_stop
    Select Order Type    Trailing Stop
    Create Trailing Stop Order    10    1    transaction_type=buy
    Verify Failed To Place Order
    
fill_or_kill
    Select Order Type    Fill or Kill
    Create Fill Or Kill Order    35000    1    transaction_type=buy
    Verify Failed To Place Order

immediate_or_cancel
    Select Order Type    Immediate or Cancel
    Create Immediate Or Cancel Order    35000    1    transaction_type=buy
    Verify Failed To Place Order
                
*** Keywords ***
Verify Failed To Place Order
    Verify Label Displays    FAILED TO PLACE ORDER
    Verify Label Displays    Insufficient Funds
    Verify Label Displays    Please make a deposit in wallet to complete the order.
    Tap Element By Label    Deposit
    Verify Deposit Screen Displays
    Tap On Back Button