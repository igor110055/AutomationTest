*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/fast_pay_keywords.robot
Resource    ../../../../mobile/resources/testdata/staging/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Staging
Suite Teardown    Close Test Application

*** Test Cases ***
toggle_2fa_skip_payment_on
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Settings
    Tap On Account Menu Item    Fast Pay
    Toggle Skip 2FA for Small Payments    ON

    Config Small Payments To Skip 2FA    1001
    Verify Label Displays    Maximum Amount 1000 USD
    Tap Element By Label    Cancel    wait_disappear=${True}

    Config Small Payments To Skip 2FA    10
    Tap Element By Label    Save    delay=2s
    Input 2FA Code    ${TEST_DATA_FULL_VERIFIED_2FA_SECRET}    wait=5s

toggle_2fa_skip_payment_off
    Toggle Skip 2FA for Small Payments    OFF
    Verify Label Displays    Turn on to skip 2FA when paying invoices less than the customized 24h spending limit
    Tap Element By Label    Save    delay=2s
    Input 2FA Code    ${TEST_DATA_FULL_VERIFIED_2FA_SECRET}    wait=2s