*** Settings ***
Documentation    https://bitfinex.slack.com/archives/C01H5DF96G6/p1639676066057200
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/common_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/staging/bitfinex_data.robot

Suite Setup    Open Apps    Bitfinex
Suite Teardown    Close Test Application

*** Test Cases ***
old_account_limit_exchange
    Login And Set Up Pin    ${TEST_DATA_BASIC_VERIFIED_API_KEY}    ${TEST_DATA_BASIC_VERIFIED_API_SECRET}    Staging    enable_detach=${True}
    Search Ticker    BTCUSD
    Access Trading Pair    BTCUSD
    Swipe To Panel    ORDER BOOK    0.1    DOWN
    Create Limit Order    35000    0.0025    buy
    Create Limit Order    90000    0.0025    sell
    Cancel All Orders

old_account_limit_margin
    Swipe To Panel    ORDER    0.7    UP
    Select Order Form Tab    Margin
    Create Limit Order    35000    0.0025    buy
    Create Limit Order    90000    0.0025    sell
    Cancel All Orders
    Close Test Application

old_sub_account_limit_exchange
    Open Apps    Bitfinex
    Login And Set Up Pin    ${TEST_DATA_BASIC_VERIFIED_0605_SUB_API_KEY}    ${TEST_DATA_BASIC_VERIFIED_0605_SUB_API_SECRET}    Staging    enable_detach=${True}
    Search Ticker    BTCUSD
    Access Trading Pair    BTCUSD
    Swipe To Panel    ORDER BOOK    0.1    DOWN
    Create Limit Order    35000    0.0025    buy
    Create Limit Order    90000    0.0025    sell
    Cancel All Orders

old_sub_account_limit_margin
    Swipe To Panel    ORDER    0.7    UP
    Select Order Form Tab    Margin
    Create Limit Order    35000    0.0025    buy
    Create Limit Order    90000    0.0025    sell
    Cancel All Orders
    Close Test Application
    
new_account_limit_exchange
    Open Apps    Bitfinex
    Login And Set Up Pin    ${TEST_DATA_BASIC_VERIFIED_17122021_API_KEY}    ${TEST_DATA_BASIC_VERIFIED_17122021_API_SECRET}    Staging    enable_detach=${True}
    Search Ticker    BTCUSD
    Access Trading Pair    BTCUSD
    Swipe To Panel    ORDER BOOK    0.1    DOWN
    Create Limit Order    35000    0.0025    buy
    Create Limit Order    90000    0.0025    sell
    Cancel All Orders
    
new_account_limit_margin
    Swipe To Panel    ORDER    0.7    UP
    Select Order Form Tab    Margin
    Create Limit Order    35000    0.0025    buy
    Create Limit Order    90000    0.0025    sell
    Verify No Orders Found On Orders Panel
    Close Test Application
    
sub_new_account_limit_exchange
    Open Apps    Bitfinex
    Login And Set Up Pin    ${TEST_DATA_BASIC_VERIFIED_17122021_SUB_API_KEY}    ${TEST_DATA_BASIC_VERIFIED_17122021_SUB_API_SECRET}    Staging    enable_detach=${True}
    Search Ticker    BTCUSD
    Access Trading Pair    BTCUSD
    Swipe To Panel    ORDER BOOK    0.1    DOWN
    Create Limit Order    35000    0.0025    buy
    Create Limit Order    90000    0.0025    sell
    Cancel All Orders
    
sub_new_account_limit_margin
    Swipe To Panel    ORDER    0.7    UP
    Select Order Form Tab    Margin
    Create Limit Order    35000    0.0025    buy
    Create Limit Order    90000    0.0025    sell
    Verify No Orders Found On Orders Panel