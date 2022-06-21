*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/common_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application
*** Test Cases ***
exo_usd
    Search Ticker    EXOUSD
    Access Trading Pair    EXOUSD
    Tap Doc Icon On Ticker
    Verify Label Displays    Exordium Securities A
    Verify External Browser URL    bitfinex.com/legal/securities/issuers/EXO
    
bmn_usd
    Tap Device Back Button
    Tap On Back Button
    Search Ticker    BMNUSD
    Verify Label Displays    No tickers found