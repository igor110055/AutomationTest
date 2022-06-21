*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/stake_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/cryptocurrency_deposit_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production    lite_mode=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
stake_support_infor
    Tap On Navigation Tab By Name    Stake
    Tap Stake Support Faq Button
    Verify Label Displays    How it works?
    Tap Stake Support Close Icon
    
    Tap On Navigation Tab By Name    Account
    Change Language    en    Русский
    Tap On Back Button
    Tap On Navigation Tab By Name    Stake
    Tap Stake Support Faq Button
    Verify Label Displays    Как это работает?
    Tap Stake Support Close Icon
    
    Tap On Navigation Tab By Name    Account
    Change Language    ru    English