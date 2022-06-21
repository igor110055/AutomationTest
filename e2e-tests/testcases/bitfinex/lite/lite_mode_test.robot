*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_BASIC_VERIFIED_API_KEY}    ${TEST_DATA_BASIC_VERIFIED_API_SECRET}    Production    lite_mode=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
lite_mode_hide_account_borrow
    Tap On Navigation Tab By Name    Account
    Verify Account Menu Item Disappears    Borrow

lite_mode_hide_account_leaderboard
    Verify Account Menu Item Disappears    Leaderboard

lite_mode_hide_account_staking_rewards
    Verify Account Menu Item Disappears    Staking Rewards
            
lite_mode_hide_derivatives
    Verify Hidden Tab    Derivatives
    
lite_mode_hide_funding
    Verify Hidden Tab    Funding

lite_mode_trading_main
    Tap On Navigation Tab By Name    Trading
    Tap Element By Label    EUR
    Verify Tickers Table    BTCEUR    IOTEUR
    Tap Element By Label    USDT
    Verify Tickers Table    ETHUST    BTCUST
    Tap Element By Label    USD
    Verify Tickers Table    ETHUSD    BTCUSD
    
lite_mode_trading_hide_positions
    Search Ticker    BTCUSD
    Access Trading Pair    BTCUSD
    Tap Panel On Trading Pair    CHART
    Tap Panel On Trading Pair    ORDER
    Tap Panel On Trading Pair    ORDERS
    Tap Panel On Trading Pair    ORDER HISTORY
    Verify Label Not Display    POSITIONS
    Tap Panel On Trading Pair    ORDER HISTORY
    Tap Panel On Trading Pair    ORDERS
    Tap Panel On Trading Pair    ORDER
    Tap Panel On Trading Pair    CHART
    
lite_mode_wallets
    Tap On Back Button
    Tap On Navigation Tab By Name    Wallets
    Tap Wallets Panel    BALANCES
    Tap Wallets Panel    ORDERS
    Tap Wallets Panel    ORDER HISTORY
    Tap Wallets Panel    ORDER HISTORY
    Tap Wallets Panel    ORDERS
    Tap Wallets Panel    BALANCES
    
wallets_deposit
    Tap On Balances Button    Deposit
    Tap On Back Button
    
open_app_from_background
    Put App In Background
    Sleep    10s