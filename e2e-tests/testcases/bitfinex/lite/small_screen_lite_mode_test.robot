*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production    lite_mode=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
starred_icon
    Tap Starred Icon
    Verify Label Displays    Bitcoin
    Verify Label Displays    Ethereum
    Verify Label Displays    Polkadot
    Tap Starred Icon
    Verify Label Displays    Tether USDt
    
search_tickers_usd
    Search Ticker    MATIC
    Verify Label Displays    MATIC (Ethereum)
    Search Ticker    BTT
    Verify Label Displays    BitTorrent
    Search Ticker    OCEAN
    Verify Label Displays    OCEAN protocol
    Search Ticker    MIM
    Verify Label Displays    Magic Internet Money
    Search Ticker    RRT
    Verify Label Displays    Recovery Right Tokens
    
search_tickers_eur
    Tap Element By Label    EUR
    Search Ticker    BTC
    Verify Label Displays    Bitcoin
    Tap Starred Icon
    Verify Label Displays    No tickers found
    Tap Starred Icon
    Verify Label Displays    Bitcoin
    
search_tickers_usdt
    Tap Element By Label    USDT
    Search Ticker    LUNA
    Verify Label Displays    LUNA
    Tap Starred Icon
    Verify Label Displays    No tickers found
    Tap Starred Icon
    Verify Label Displays    LUNA