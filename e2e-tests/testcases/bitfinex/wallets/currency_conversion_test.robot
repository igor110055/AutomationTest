*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/currency_conversion_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
dropdown_values
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Conversion
    Verify Conversion Dropdown Values    LN-BTC    BTC
    Select From Dropdown Item    Bitcoin
    Verify Conversion Dropdown Values    BTC    LN-BTC
    Tap To Wallet Dropdown
    Verify Label Not Display    Margin
    Verify Label Not Display    Funding
    Verify Label Displays    Exchange
    Tap Element By Label    Exchange
    
    Verify From Dropdown Items    LBTC
    Verify From Dropdown Items    pBTC-EOS
    Verify From Dropdown Items    PBTC-ETH
    
max_button
    Select From Wallet Dropdown Item    Exchange
    Tap Max Amount Button
    Verify Max Amount Populated
    
slide_in_menu
    Tap On Back Button
    Tap Balance Of Currency    BTC    exchange    available
    Tap Slide In Menu    Conversion
    Verify Conversion Dropdown Values    BTC    LN-BTC
    
lbtc_bitcoin_liquid
    Tap On Back Button
    Tap Balance Of Currency    BTC    exchange    available
    Tap Slide In Menu    Conversion
    Select To Dropdown Item    LBTC
    Input Conversion Amount    0.0001
    Tap Element By Label    Convert
    Tap On Back Button
    Tap Balance Of Currency    LBTC    exchange    available
    Verify Label Displays    0.00010000
    Verify Element Contains Text    4.
    
    Tap Slide In Menu    Conversion
    # Wait for momentary check
    Sleep    15s
    Tap Max Amount Button
    Tap Element By Label    Convert
    Tap On Back Button
    Verify Label Not Display    LBTC
    
*** Keywords ***
Verify From Dropdown Items
    [Arguments]    ${currency}
    Select To Dropdown Item    ${currency}
    Tap To Wallet Dropdown
    Verify Label Not Display    Margin
    Verify Label Not Display    Funding
    Verify Label Displays    Exchange
    Tap Element By Label    Exchange