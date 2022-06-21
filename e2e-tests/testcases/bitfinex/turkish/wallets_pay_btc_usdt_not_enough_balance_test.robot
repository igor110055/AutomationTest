*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/fast_pay_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login And Set Up Pin Turkish App    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Variables ***
${lnurl_invoice}    LNURL1DP68GURN8GHJ7AMPD3KX2AR0VEEKZAR0WD5XJTNRDAKJ7TNHV4KXCTTTDEHHWM30D3H82UNVWQHHX6R0V3J8JCNJDAH85EFCXUWNP3GD

*** Test Cases ***
pay_btc_lnurl
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Pay
    Tap Scan Button
    Tap Enter Address Link
    Submit Invoice    ${lnurl_invoice}
    Verify Label Displays    Pay
    Tap On Back Button
    
pay_btc
    Tap Receive Button
    Input Amount To Receive    50
    Tap Generate Invoice
    Get Invoice Code    ln-btc    LN_BTC_INVOICE_CODE
    Tap On Back Button
    Tap Scan Button
    Tap Enter Address Link
    Submit Invoice    ${LN_BTC_INVOICE_CODE}    submit=${False}
    Verify Element Contains Text    minimum balance is needed to complete this payment. Your current balance is 
    Verify Element Contains Text    . Please make a deposit in wallet to proceed
    
pay_usdt
    Verify Pay With Usdt Without Balance    Tether(USD) on Tron
    Verify Pay With Usdt Without Balance    Tether(USD) on Solana
    Verify Pay With Usdt Without Balance    Tether(USD) on Liquid
    
*** Keywords ***
Verify Pay With Usdt Without Balance
    [Arguments]    ${usdt_network}
    Tap On Back Button
    Swipe To Next Payment Transport
    Tap Receive Button
    Input Amount To Receive    50
    Tap Generate Invoice
    Get Invoice Code    usdt    USDT_INVOICE_CODE
    Tap On Back Button
    Tap Scan Button
    Tap Enter Address Link
    Submit Invoice    ${USDT_INVOICE_CODE}    enter_method=paste
    Verify Element Contains Text    minimum balance is needed to complete this payment. Your current balance is 
    Verify Element Contains Text    . Please make a deposit in wallet to proceed