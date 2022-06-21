*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/derivatives_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/derivatives_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login And Set Up Pin Turkish App    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application
*** Variables ***
${expected_chart_loading_time}    10s

*** Test Cases ***
screens_transition_and_language_test
    Verify Chart Loading And Screens Transition

    # Tap On Navigation Tab By Name    Account
    # Change Language    en    Русский
    # Tap On Back Button
    # Verify Chart Loading And Screens Transition

    # Tap On Navigation Tab By Name    Account
    # Change Language    ru    中文 (简化)
    # Tap On Back Button
    # Verify Chart Loading And Screens Transition

    # Tap On Navigation Tab By Name    Account
    # Change Language    cn    中文 (繁體)
    # Tap On Back Button
    # Verify Chart Loading And Screens Transition

    # Tap On Navigation Tab By Name    Account
    # Change Language    tw    Español
    # Tap On Back Button
    # Verify Chart Loading And Screens Transition

    # Tap On Navigation Tab By Name    Account
    # Change Language    es    Türkçe
    # Tap On Back Button
    # Verify Chart Loading And Screens Transition

    # Tap On Navigation Tab By Name    Account
    # Change Language    tr    Português
    # Tap On Back Button
    # Verify Chart Loading And Screens Transition
    
    # Tap On Navigation Tab By Name    Account
    # Change Language    pr    English
    # Tap On Back Button
    
*** Keywords ***
Verify Chart Loading And Screens Transition
    Tap On Navigation Tab By Name    Trading
    Verify Trading Chart Loading Pair    BTCUSD    BTCUSD    Bitcoin
    Verify Hidden Tab    Derivatives
    Verify Hidden Tab    Funding
    Tap On Navigation Tab By Name    Wallets
    Verify Wallets Panels    

Verify Trading Chart Loading Pair
    [Arguments]    ${ticker}    ${pair}    ${ticker_name}
    Search Ticker    ${ticker}
    Access Trading Pair    ${pair}
    Tap I Icon On Ticker
    Verify Ticker Information Screen Displays    ${ticker_name}
    Tap Close Icon
    Verify Chart Loading Success    ${expected_chart_loading_time}
    Tap Panel On Trading Pair    CHART
    Tap Panel On Trading Pair    ORDER
    Tap Panel On Trading Pair    ORDER BOOK
    Tap Panel On Trading Pair    POSITIONS
    Tap Panel On Trading Pair    ORDERS
    Tap Panel On Trading Pair    TRADES
    Tap Panel On Trading Pair    ORDER HISTORY
    
    Tap Panel On Trading Pair    ORDER HISTORY
    Tap Panel On Trading Pair    TRADES
    Tap Panel On Trading Pair    ORDERS
    Tap Panel On Trading Pair    POSITIONS
    Tap Panel On Trading Pair    ORDER BOOK
    Tap Panel On Trading Pair    ORDER
    Tap Panel On Trading Pair    CHART
    Verify Chart Loading Success    ${expected_chart_loading_time}
    Tap On Back Button
    Clear Ticker Search
    
Verify Wallets Panels
    Tap Wallets Panel    BALANCES
    Tap Wallets Panel    POSITIONS
    Tap Wallets Panel    ORDERS
    Tap Wallets Panel    ORDER HISTORY
    
    Tap Wallets Panel    ORDER HISTORY
    Tap Wallets Panel    ORDERS
    Tap Wallets Panel    POSITIONS
    Tap Wallets Panel    BALANCES
    Sleep    1s
    