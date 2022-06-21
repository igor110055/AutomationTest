*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/deposit_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/payment_card_deposit_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/simplex_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
support_infor
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Deposit
    Tap I Icon On Deposit
    Access And Verify By Label    Wallet Deposits    Wallet Deposits
    Access And Verify By Label    Why is my deposit unconfirmed?    — Why has my deposit not been credited immediately?
    Access And Verify By Label    Where is my deposit?    Where is my cryptocurrency deposit or withdrawal
    Access And Verify By Label    Why was I charged a deposit fee?    What are the Deposit Fees at Bitfinex
    Access And Verify By Label    Help with deposits    Information for Deposits
    Verify Label Displays    For more information about Card payments, please refer to our knowledge base article here
    Tap Element By Label    For more information about Card payments, please refer to our knowledge base article here
    Verify Label Displays    How to buy crypto on Bitfinex instantly
    Tap Device Back Button
    Tap Close Icon On Deposits Support

payment_card_fiat_currency
    Select Payment Type On Deposit    Payment Card
    Verify Deposit Payment Card Fiat Currency
    
simplex_currency_dropdown
    Select Payment Method On Payment Card Deposit    Simplex
    Tap Deposit Currency Fiat Dropdown
    Verify List Labels Display    USD    EUR    GBP    JPY    TRY
    Tap Element By Label    USD
    Tap On Back Button

simplex
    Verify Payment Method    USDt (ETH)    MAX    TRY
    # Verify Payment Method    USDt (ETH)    MAX    RUB
    Verify Payment Method    USDt (ETH)    MIN    USD
    Verify Payment Method    Ethereum    MAX    GBP
    Verify Payment Method    USDt (ETH)    MIN    EUR
    Verify Payment Method    USDt (Tron)    MAX    JPY
    Verify Payment Method    Tether XAUt    MIN    USD
    Verify Payment Method    Algorand    MAX    GBP
    Verify Payment Method    Basic Attention Token    MIN    EUR
    
*** Keywords ***
Verify Payment Method
    [Arguments]    ${currency}    ${amount}    ${fiat_currency}
    Select Payment Method On Payment Card Deposit    Simplex
    Select Deposit Currency    ${currency}
    Run Keyword If    "${amount}"=="MIN"    Tap Min Amount Button
    ...    ELSE    Tap Max Amount Button
    Select Deposit Currency Fiat    ${fiat_currency}
    Tap TOS Agree Checkbox
    Tap Submit Button
    Tap Okay On Please Confirm Popup
    Verify Simplex Order Summary
    Tap On Back Button    2