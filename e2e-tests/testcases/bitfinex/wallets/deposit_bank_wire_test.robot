*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/deposit_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/tether_deposit_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
deposit_min_amount
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Deposit
    Select Payment Type On Deposit    Bank wire
    Verify Min Amount By Currency    US Dollar (USD)    9999    Amount must be greater than 10000.
    Verify Min Amount By Currency    Pound Sterling (GBP)    9999    Amount must be greater than 10000.
    Verify Min Amount By Currency    Euro (EUR)    9999    Amount must be greater than 10000.
    Verify Min Amount By Currency    Japanese Yen (JPY)    999999    Amount must be greater than 1000000.
    Verify Min Amount By Currency    CNH (CNH)    74999    Amount must be greater than 75000.
    
deposit_usd
    Submit Bank Wire Request    US Dollar (USD)    10000
    Verify Label Displays    Deposit Created
    Verify Label Displays    You have successfully created a wire deposit for 10,000.00 USD. We’ve emailed you instructions on what to do next.
    Tap Element By Label    Done
    
cancel_bank_wire_deposit
    Tap On Balances Button    Deposit
    Tap Element By Label    Created
    Tap Element By Label    Cancel
    Verify Label Displays    Pending cancellation
    
basic_verified
    Close Test Application
    Open Apps    Bitfinex
    Login And Set Up Pin    ${TEST_DATA_BASIC_SIGNUP_AFTER_01JAN2022_KEY}    ${TEST_DATA_BASIC_SIGNUP_AFTER_01JAN2022_SECRET}    Production
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Deposit
    Select Payment Type On Deposit    Bank wire
    Verify Label Displays    I agree that I have read and understand the bank wire deposit terms & conditions and I agree not to make this information public.
    
*** Keywords ***
Verify Min Amount By Currency
    [Arguments]    ${currency}    ${amount}    ${label}
    Select Curency Dropdown Item    ${currency}
    Input Bank Wire Deposit Amount    ${amount}
    Verify Label Displays    ${label}
    
