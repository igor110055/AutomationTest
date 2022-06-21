*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login And Set Up Pin Turkish App    ${TEST_DATA_PAPER_TRADING_API_KEY}    ${TEST_DATA_PAPER_TRADING_API_SECRET}    Production
Suite Teardown    Run Keywords    Cancel All Orders
...    AND    Close Test Application
*** Test Cases ***
trading_order_form_limit_exchange_normal
    Access Trading Pair    TESTBTC:TESTUSD
    Swipe To Panel    ORDER BOOK    0.1    DOWN
    Select Order Type    Limit
    Select Order Form Tab    Exchange
    Create Limit Order    20000    0.0025    buy
    Create Limit Order    30000    0.0025    sell

 trading_order_form_limit_exchange_oco
     Create Limit Order    20000    0.0025    buy    oco=${True}    oco_stop_price=30000
     Create Limit Order    30000    0.0025    sell    oco=${True}    oco_stop_price=20000
        
 trading_order_form_limit_exchange_hidden
     Create Limit Order    20000    0.0025    buy    hidden=${True}
     Create Limit Order    30000    0.0025    sell    hidden=${True}
    
 trading_order_form_limit_exchange_post_only
     Create Limit Order    20000    0.0025    buy    post_only=${True}
     Create Limit Order    30000    0.0025    sell    post_only=${True}

 trading_order_form_limit_exchange_tif
     Create Limit Order    20000    0.0025    buy    tif=${True}
     Create Limit Order    30000    0.0025    sell    tif=${True}
    
 trading_order_form_limit_margin_normal
     Select Order Form Tab    Margin
     Create Limit Order    20000    0.0025    buy
     Create Limit Order    30000    0.0025    sell

 trading_order_form_limit_margin_oco
     Create Limit Order    20000    0.0025    buy    oco=${True}    oco_stop_price=30000
     Create Limit Order    30000    0.0025    sell    oco=${True}    oco_stop_price=20000
        
 trading_order_form_limit_margin_hidden
     Create Limit Order    20000    0.0025    buy    hidden=${True}
     Create Limit Order    30000    0.0025    sell    hidden=${True}
    
 trading_order_form_limit_margin_post_only
     Create Limit Order    20000    0.0025    buy    post_only=${True}
     Create Limit Order    30000    0.0025    sell    post_only=${True}

 trading_order_form_limit_margin_tif
     Create Limit Order    20000    0.0025    buy    tif=${True}
     Create Limit Order    30000    0.0025    sell    tif=${True}