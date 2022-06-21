*** Settings ***

Resource    ../../../mobile/resources/init.robot
Resource    ../../../mobile/keywords/bitfinex/common_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/derivatives_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/derivatives_pair_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/funding_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/funding_pair_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/account_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/reports_keywords.robot
Resource    ../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Variables ***
${expected_chart_loading_time}    10s

*** Test Cases ***
screens_transition_and_chart_loading_test
    Verify Chart Loading And Screens Transition    en

*** Keywords ***
Verify Chart Loading And Screens Transition
    [Arguments]    ${locale}
    Tap On Navigation Tab By Name    Trading
    Verify Trading Chart Loading Pair    BTCUSD    BTCUSD    ${locale}
#    Verify Trading Chart Loading Pair    ETHUSD    ETHUSD    ${locale}
#    Verify Trading Chart Loading Pair    USTUSD    USTUSD    ${locale}
#    Verify Trading Chart Loading Pair    BTCUST    BTCUST    ${locale}
#    Verify Trading Chart Loading Pair    BTCEUR    BTCEUR    ${locale}
#    Verify Trading Chart Loading Pair    ETHBTC    ETHBTC
#    Verify Trading Chart Loading Pair    XRPUSD    XRPUSD
#    Verify Trading Chart Loading Pair    BTCGBP    BTCGBP
#    Verify Trading Chart Loading Pair    BTCJPY    BTCJPY
#    Verify Trading Chart Loading Pair    ETHUST    ETHUST
    Tap On Navigation Tab By Name    Derivatives
    Verify Derivatives Chart Loading Pair    BTC-PERP    BTCF0:USTF0    ${locale}
#    Verify Derivatives Chart Loading Pair    LTC-PERP    LTCF0:USTF0    ${locale}
#    Verify Derivatives Chart Loading Pair    XAUT-PERP    XAUTF0:USTF0    ${locale}
#    Verify Derivatives Chart Loading Pair    EUROPE50-PERP    EUROPE50IXF0:USTF0    ${locale}
#    Verify Derivatives Chart Loading Pair    JPY-PERP    JPYF0:USTF0    ${locale}
    Tap On Navigation Tab By Name    Funding
    Verify Funding Chart Loading Pair    USD    USD    ${locale}
#    Verify Funding Chart Loading Pair    BTC    BTC    ${locale}
#    Verify Funding Chart Loading Pair    ETC    ETC    ${locale}
#    Verify Funding Chart Loading Pair    UST    UST    ${locale}
#    Verify Funding Chart Loading Pair    LEO    LEO    ${locale}

Verify Trading Chart Loading Pair
    [Arguments]    ${ticker}    ${pair}    ${locale}    ${check_order_history}=${False}
    Search Ticker    ${ticker}
    Access Trading Pair    ${pair}
    Verify Chart Loading Success    ${expected_chart_loading_time}
    # Change Chart Interval    1 hour
    # Verify Chart Loading Success    ${expected_chart_loading_time}
    # Change Chart Interval    5 minutes
    # Verify Chart Loading Success    ${expected_chart_loading_time}
    Tap Panel On Trading Pair    CHART
    Tap Panel On Trading Pair    ORDER
    Verify Order Book Panel Is Loaded    ${locale}
    Tap Full Book On Order Book Panel    ${locale}
    Verify Full Book Screen Displays
    Tap On Back Button
    Tap Panel On Trading Pair    ORDER BOOK
    Tap Panel On Trading Pair    POSITIONS
    Tap Panel On Trading Pair    ORDERS
    Verify Trades Panel Is Loaded    ${locale}
    Tap Trades Panel Tab    Yours
    Verify Trades Panel Is Loaded    ${locale}
    Tap Trades Panel Tab    Market
    Verify Trades Panel Is Loaded    ${locale}
    Tap Panel On Trading Pair    TRADES
    Run Keyword If    ${check_order_history}==${True}    Verify Order History On Trading    ${locale}
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

Verify Order History On Trading
    [Arguments]    ${locale}
    Verify Order History Panel Is Loaded    ${locale}
    Tap Full Order History On Order History Panel    ${locale}
    Verify Reports Screen Displays
    Tap On Back Button
    
Verify Derivatives Chart Loading Pair
    [Arguments]    ${ticker}    ${pair}    ${locale}
    Search Ticker On Derivatives    ${ticker}
    Access Trading Pair On Derivatives    ${pair}
    Verify Chart Loading Success On Derivatives    ${expected_chart_loading_time}
    # Change Chart Interval    1 hour
    # Verify Chart Loading Success On Derivatives    ${expected_chart_loading_time}
    # Change Chart Interval    5 minutes
    # Verify Chart Loading Success On Derivatives    ${expected_chart_loading_time}
    Tap Panel On Derivatives Pair    CHART
    Tap Panel On Derivatives Pair    ORDER
    Verify Order Book Panel On Derivatives Is Loaded    ${locale}
    Tap Full Book Order Book Panel on Derivatives    ${locale}
    Verify Full Book Screen Displays On Derivatives
    Tap On Back Button
    Tap Panel On Derivatives Pair    ORDER BOOK
    Tap Panel On Derivatives Pair    POSITIONS
    Tap Panel On Derivatives Pair    ORDERS
    Verify Trades Panel On Derivatives Is Loaded    ${locale}
    Tap Trades Panel Tab On Derivatives Pair    Yours
    Verify Trades Panel On Derivatives Is Loaded    ${locale}
    Tap Trades Panel Tab On Derivatives Pair    Market
    Verify Trades Panel On Derivatives Is Loaded    ${locale}
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
    [Arguments]    ${ticker}    ${pair}    ${locale}
    Search Ticker On Funding    ${ticker}
    Access Trading Pair On Funding    ${pair}
    Verify Chart Loading Success On Funding    ${expected_chart_loading_time}
    # Change Chart Interval    1 hour
    # Verify Chart Loading Success On Funding    ${expected_chart_loading_time}
    # Change Chart Interval    5 minutes
    # Verify Chart Loading Success On Funding    ${expected_chart_loading_time}
    Tap Panel On Funding Pair    CHART
    Tap Panel On Funding Pair    FUNDING
    Verify Funding Book Panel Is Loaded    ${locale}
    Tap Full Book Funding Book Panel on Funding    ${locale}
    Verify Full Book Screen Displays On Funding
    Tap On Back Button
    Tap Panel On Funding Pair    FUNDING BOOK
    Tap Panel On Funding Pair    FUNDING EARNINGS        
    Tap Panel On Funding Pair    TAKEN (UNUSED)        
    Tap Panel On Funding Pair    TAKEN (USING)        
    Tap Panel On Funding Pair    PROVIDED
    Tap Panel On Funding Pair    BIDS & OFFERS
    Tap Panel On Funding Pair    AUTORENEW FORM
    Verify Matched Panel Is Loaded    ${locale}
    Tap Matched Panel Tab On Funding    Yours
    Verify Matched Panel Is Loaded    ${locale}
    Tap Matched Panel Tab On Funding    Market
    Verify Matched Panel Is Loaded    ${locale}
    Tap Panel On Funding Pair    MATCHED
    
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