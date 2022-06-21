*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/fast_pay_keywords.robot
Resource    ../../../../mobile/resources/testdata/staging/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Staging
Suite Teardown    Close Test Application

*** Test Cases ***
tether_usd_more_than_10usd_skip_2fa_for_small_payment_off
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Pay
    Swipe To Next Payment Transport
    Tap Receive Button
    Input Amount To Receive    1,1
    Tap Generate Invoice
    Get Invoice Code    eth    ETH_INVOICE_CODE
    Tap On Back Button
    Tap Scan Button
    Tap Enter Address Link
    Submit Invoice    ${ETH_INVOICE_CODE}    enter_method=paste_icon
    Tap Pay Button
    Input 2FA Code    ${TEST_DATA_FULL_VERIFIED_2FA_SECRET}
    Verify Label Displays    Payment Completed
    Verify Label Displays    1.10 USDt
    Tap Home Button On Payment Completed Screen
    Verify Fast Pay Screen Displays