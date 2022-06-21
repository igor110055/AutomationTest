*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/fast_pay_keywords.robot
Resource    ../../../../mobile/resources/testdata/staging/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Staging
Suite Teardown    Close Test Application

*** Test Cases ***
pay_btc_receive
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Pay
    Tap Receive Button
    Input Amount To Receive    1,1
    Tap Generate Invoice
    Get Invoice Code    ln-btc    LN_BTC_INVOICE_CODE
    
pay_btc_pay_skip_2fa_for_small_payment_off
    Tap On Back Button
    Tap Scan Button
    Tap Enter Address Link
    Submit Invoice    ${LN_BTC_INVOICE_CODE}
    Verify Label Displays    $1.10
    Tap Pay Button
    Input 2FA Code    ${TEST_DATA_FULL_VERIFIED_2FA_SECRET}
    Verify Element Contains Text    BTC
    Verify Label Displays    Payment Completed
    Tap Home Button On Payment Completed Screen
    Verify Fast Pay Screen Displays