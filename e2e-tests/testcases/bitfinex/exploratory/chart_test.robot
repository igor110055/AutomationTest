*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/derivatives_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/derivatives_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Variables ***
${expected_chart_loading_time}    10s

*** Test Cases ***
trading_pair
    Search Ticker    BTCUSD
    Access Trading Pair    BTCUSD
    Verify Chart Loading Success    ${expected_chart_loading_time}
    Put App In Background    60s
    Enter Pin Code To Login
    Verify Chart Loading Success    ${expected_chart_loading_time}
    Tap Share Snapshot Button
    Verify Label Displays    No recommended people to share with
    Tap Device Back Button
    
derivatives_pair
    Tap On Back Button
    Tap On Navigation Tab By Name    Derivatives
    Search Ticker On Derivatives    BTC-PERP
    Access Trading Pair On Derivatives    BTCF0:USTF0
    Verify Chart Loading Success On Derivatives    ${expected_chart_loading_time}
    Put App In Background    60s
    Enter Pin Code To Login
    Verify Chart Loading Success On Derivatives    ${expected_chart_loading_time}
    Tap Share Snapshot Button
    Verify Label Displays    No recommended people to share with
    Tap Device Back Button
    
funding_pair
    Tap On Back Button
    Tap On Navigation Tab By Name    Funding
    Search Ticker On Funding    USD
    Access Trading Pair On Funding    USD
    Verify Chart Loading Success On Funding    ${expected_chart_loading_time}
    Put App In Background    60s
    Enter Pin Code To Login
    Verify Chart Loading Success On Funding    ${expected_chart_loading_time}
    Tap Share Snapshot Button
    Verify Label Displays    No recommended people to share with
    Tap Device Back Button