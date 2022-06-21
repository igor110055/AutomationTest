*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_BASIC_VERIFIED_API_KEY}    ${TEST_DATA_BASIC_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
refresh_indicators
    Search Ticker    BTCUSD
    Access Trading Pair    BTCUSD
    Add Indicator By Coordinates
    Tap Refresh Chart Button
    Verify Label Not Display    Aroon
    Verify Label Not Display    Accum/Dist
    
refresh_styles
    Select Chart Style
    Tap Refresh Chart Button
    Select Chart Style
    Tap Refresh Chart Button
    
refresh_intervals
    Select Chart Interval
    Tap Refresh Chart Button
    Select Chart Interval
    Tap Refresh Chart Button
    
*** Keywords ***
Add Indicator By Coordinates
    Select Indicator    Aroon
    Verify Label Displays    Aroon
    Select Indicator    Accumulation/Distribution
    Verify Label Displays    Accum/Dist