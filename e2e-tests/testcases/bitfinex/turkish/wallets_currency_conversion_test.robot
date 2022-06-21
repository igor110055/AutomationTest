*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/currency_conversion_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login And Set Up Pin Turkish App    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
dropdown_values
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Conversion
    Verify Conversion Dropdown Values    LN-BTC    BTC
    Select From Dropdown Item    Bitcoin
    Verify Conversion Dropdown Values    BTC    LN-BTC
    
max_button
    Tap Max Amount Button
    Verify Max Amount Populated