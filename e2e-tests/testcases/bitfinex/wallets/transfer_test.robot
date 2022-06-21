*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_transfer_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
transfer
    Tap On Navigation Tab By Name    Wallets
    Tap Balance Of Currency    BTC    exchange    available
    Tap Slide In Menu    Transfer BTC
    Verify Label Displays    Source
    Verify Label Displays    Destination
    Transfer Currency    Exchange    Margin
    
    # wait for momentary check
    Sleep    15s
    Tap Balance Of Currency    BTC    margin    available
    Tap Slide In Menu    Transfer BTC
    Transfer Currency    Margin    Exchange