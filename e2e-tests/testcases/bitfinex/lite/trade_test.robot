*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_BASIC_VERIFIED_API_KEY}    ${TEST_DATA_BASIC_VERIFIED_API_SECRET}    Production    lite_mode=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
search
    Search Ticker    BitcoinTest
    Tap Element By Label    EUR
    Verify Textbox Text    BitcoinTest
    Tap Element By Label    USDT
    Verify Textbox Text    BitcoinTest
    Tap Element By Label    USD
    Verify Textbox Text    BitcoinTest
    
favorite
    Tap Starred Icon
    Search Ticker    DOT
    Tap Element By Label    EUR
    Verify Label Displays    No tickers found    delay=1s
    Tap Element By Label    USDT
    Verify Label Displays    No tickers found    delay=1s
    Tap Element By Label    USD
    Verify Label Displays    No tickers found    delay=1s
    Tap Starred Icon