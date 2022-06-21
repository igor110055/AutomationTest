*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/derivatives_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/derivatives_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Variables ***
${expected_chart_loading_time}    10s

*** Test Cases ***
white
    Select Theme In Account    White
    Verify Chart Loading And Screens Transition
    
black
    Select Theme In Account    Black
    Verify Chart Loading And Screens Transition
    
colour_blind
    Select Theme In Account    Colour blind
    Verify Chart Loading And Screens Transition
    Select Theme In Account    Default
    
*** Keywords ***
Select Theme In Account
    [Arguments]    ${theme}
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Settings
    Tap On Account Menu Item    Themes
    Tap On Account Menu Item    ${theme}
    Tap On Back Button    2
    
Verify Chart Loading And Screens Transition
    Tap On Navigation Tab By Name    Trading
    Verify Trading Chart Loading Pair    BTCUSD    BTCUSD    Bitcoin
    Tap On Navigation Tab By Name    Derivatives
    Verify Derivatives Chart Loading Pair    BTC-PERP    BTCF0:USTF0
    Tap On Navigation Tab By Name    Funding
    Verify Funding Chart Loading Pair    USD    USD
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
    
Verify Derivatives Chart Loading Pair
    [Arguments]    ${ticker}    ${pair}
    Search Ticker On Derivatives    ${ticker}
    Access Trading Pair On Derivatives    ${pair}
    Verify Chart Loading Success On Derivatives    ${expected_chart_loading_time}
    Tap Panel On Derivatives Pair    CHART
    Tap Panel On Derivatives Pair    ORDER
    Tap Panel On Derivatives Pair    ORDER BOOK
    Tap Panel On Derivatives Pair    POSITIONS
    Tap Panel On Derivatives Pair    ORDERS
    Tap Panel On Derivatives Pair    TRADES
    Tap Panel On Derivatives Pair    ORDER HISTORY
    Tap Panel On Derivatives Pair    ORDER HISTORY
    Tap Panel On Derivatives Pair    TRADES
    Tap Panel On Derivatives Pair    ORDERS
    Tap Panel On Derivatives Pair    POSITIONS
    Tap Panel On Derivatives Pair    ORDER BOOK
    Tap Panel On Derivatives Pair    ORDER
    Tap Panel On Derivatives Pair    CHART
    Verify Chart Loading Success On Derivatives    ${expected_chart_loading_time}
    Tap On Back Button
    Clear Ticker Search On Derivatives
    
Verify Funding Chart Loading Pair
    [Arguments]    ${ticker}    ${pair}
    Search Ticker On Funding    ${ticker}
    Access Trading Pair On Funding    ${pair}
    Verify Chart Loading Success On Funding    ${expected_chart_loading_time}
    Tap Panel On Funding Pair    CHART    DOWN
    Tap Panel On Funding Pair    FUNDING    DOWN
    Tap Panel On Funding Pair    FUNDING BOOK    DOWN
    Tap Panel On Funding Pair    FUNDING EARNINGS    DOWN
    Tap Panel On Funding Pair    TAKEN (UNUSED)    DOWN
    Tap Panel On Funding Pair    TAKEN (USING)    DOWN
    Tap Panel On Funding Pair    PROVIDED    DOWN
    Tap Panel On Funding Pair    BIDS & OFFERS    DOWN
    Tap Panel On Funding Pair    AUTORENEW FORM    DOWN
    Tap Panel On Funding Pair    MATCHED	DOWN
    
    Tap Panel On Funding Pair    MATCHED
    Tap Panel On Funding Pair    AUTORENEW FORM
    Tap Panel On Funding Pair    BIDS & OFFERS
    Tap Panel On Funding Pair    PROVIDED
    Tap Panel On Funding Pair    TAKEN (USING)
    Tap Panel On Funding Pair    TAKEN (UNUSED)
    Tap Panel On Funding Pair    FUNDING EARNINGS
    Tap Panel On Funding Pair    FUNDING BOOK
    Tap Panel On Funding Pair    FUNDING
    Tap Panel On Funding Pair    CHART
    Verify Chart Loading Success On Funding    ${expected_chart_loading_time}
    Tap On Back Button
    Clear Ticker Search On Funding
    
Verify Wallets Panels
    Tap Wallets Panel    BALANCES
    Tap Wallets Panel    POSITIONS
    Tap Wallets Panel    ORDERS
    Tap Wallets Panel    ORDER HISTORY
    Tap Wallets Panel    ORDER HISTORY
    Tap Wallets Panel    ORDERS
    Tap Wallets Panel    POSITIONS
    Tap Wallets Panel    BALANCES    