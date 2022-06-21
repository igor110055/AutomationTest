*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/fast_pay_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/fast_pay_support_keywords.robot
Resource    ../../../../mobile/resources/testdata/staging/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Staging    lite_mode=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
support_information
    Tap On Navigation Tab By Name    Pay
    Tap Pay Support Infor On Lite Mode
    Tap Element By Label    What is Fast Pay?
    Verify Label Displays    What is Fast Pay?
    Tap Close Icon
    Tap Element By Label    What is my spending limit?
    Verify Label Displays    What is my spending limit?
    Tap Close Icon
    Tap Element By Label    How to set up faster payments?
    Verify Label Displays    How to skip 2FA when using the Fast Pay feature        
    Tap Close Icon
    Close Fast Pay Support Screen

recent_transactions
    Tap Recent Transaction Record    1
    Tap Element By Label    Amount
    Verify Label Displays    Copied to clipboard    wait_disappear=${True}
    Verify Label Displays    Time
    Tap Element By Label    Description
    Verify Label Displays    Copied to clipboard    wait_disappear=${True}
    Tap Element By Label    Order Id
    Verify Label Displays    Copied to clipboard    wait_disappear=${True}
    Tap Element By Label    Tx Id
    Verify Label Displays    Copied to clipboard    wait_disappear=${True}
    
pay_btc_receive
    Tap On Back Button
    Tap Receive Button
    Input Amount To Receive    1
    Tap Generate Invoice
    Get Invoice Code    ln-btc    LN_BTC_INVOICE_CODE
    
pay_btc_pay_close_button
    Tap On Back Button
    Tap Scan Button
    Tap Close Fast Pay Button On Lite Mode    

pay_btc_pay
    Tap Scan Button
    Tap Enter Address Link
    Submit Invoice    ${LN_BTC_INVOICE_CODE}
    Verify Label Displays    $1.00
    Tap Pay Button
    Input 2FA Code    ${TEST_DATA_FULL_VERIFIED_2FA_SECRET}
    Verify Element Contains Text    BTC
    Verify Label Displays    Payment Completed
    Tap Home Button On Payment Completed Screen
    Verify Fast Pay Screen Displays
    
tether_usd_receive
    Swipe To Next Payment Transport
    Tap Receive Button
    Input Amount To Receive    1
    Tap Generate Invoice
    Get Invoice Code    eth    ETH_INVOICE_CODE
    
tether_usd_scan_invoice
    Tap On Back Button
    Tap Scan Button
    Tap Enter Address Link
    Submit Invoice    ${ETH_INVOICE_CODE}    enter_method=paste_icon
    Tap Pay Button
    Input 2FA Code    ${TEST_DATA_FULL_VERIFIED_2FA_SECRET}
    Verify Label Displays    Payment Completed
    Verify Label Displays    1 USDt
    Tap Home Button On Payment Completed Screen
    Verify Fast Pay Screen Displays