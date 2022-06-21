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
    Config Small Payments To Skip 2FA    10
    Tap Element By Label    Save    delay=2s
    Input 2FA Code    ${TEST_DATA_FULL_VERIFIED_2FA_SECRET}    wait=2s
    
pay_btc_pay_skip_2fa_for_small_payment_on
    Tap On Back Button    2
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Pay
    Tap Receive Button
    Input Amount To Receive    5
    Tap Generate Invoice
    Get Invoice Code    ln-btc    LN_BTC_INVOICE_CODE
    Tap On Back Button
    Tap Scan Button
    Tap Enter Address Link
    Submit Invoice    ${LN_BTC_INVOICE_CODE}
    Verify Label Displays    $5.00
    Tap Pay Button
    Verify Element Contains Text    BTC
    Verify Label Displays    Payment Completed
    Tap Home Button On Payment Completed Screen
    Verify Fast Pay Screen Displays
    
pay_usdt_skip_2fa_for_small_payment_on
    Swipe To Next Payment Transport
    Tap Receive Button
    Input Amount To Receive    4
    Tap Generate Invoice
    Get Invoice Code    eth    ETH_INVOICE_CODE
    Tap On Back Button
    Tap Scan Button
    Tap Enter Address Link
    Submit Invoice    ${ETH_INVOICE_CODE}    enter_method=paste_icon
    Tap Pay Button
    Verify Label Displays    Payment Completed
    Verify Label Displays    5.0 USDt
    Tap Home Button On Payment Completed Screen
    Verify Fast Pay Screen Displays
    
pay_btc_pay_skip_2fa_for_small_payment_on_exceed_limit
    Swipe To Next Payment Transport
    Tap Receive Button
    Input Amount To Receive    1.1
    Tap Generate Invoice
    Get Invoice Code    ln-btc    LN_BTC_INVOICE_CODE
    Tap On Back Button
    Tap Scan Button
    Tap Enter Address Link
    Submit Invoice    ${LN_BTC_INVOICE_CODE}
    Verify Label Displays    $1.1
    Tap Pay Button
    Input 2FA Code    ${TEST_DATA_FULL_VERIFIED_2FA_SECRET}    wait=2s
    Verify Element Contains Text    BTC
    Verify Label Displays    Payment Completed
    Tap Home Button On Payment Completed Screen
    Verify Fast Pay Screen Displays
    
toggle_2fa_skip_payment_off
    Tap On Back Button
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Settings
    Tap On Account Menu Item    Fast Pay
    Toggle Skip 2FA for Small Payments    OFF
    Tap Element By Label    Save    delay=2s
    Input 2FA Code    ${TEST_DATA_FULL_VERIFIED_2FA_SECRET}    wait=2s