*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/withdraw_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/withdraw_support_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/cryptocurrency_withdraw_keywords.robot

Resource    ../../../../mobile/resources/testdata/staging/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Staging
Suite Teardown    Close Test Application

*** Test Cases ***
cryptocurrency_withdrawal_help_modal
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Withdraw
    Tap I Button Withdraw
    Tap Help Link Withdraw Support    Where is my withdrawal?
    Verify Label Displays    Where is my cryptocurrency deposit or withdrawal
    Tap Close Icon
    Tap Help Link Withdraw Support    Help with withdrawals
    Verify Label Displays    Information for Withdrawals
    Tap Close Icon
    Tap Close Button Withdraw Support
    
cryptocurrency_withdrawal_payment_type_dropdown
    Verify Payment Type Dropdown Is Enabled
    
fields_validation
    Select Cryptocurrencies Dropdown    Bitcoin (BTC)
    Verify Label Not Display    Available Balance
    Verify Label Displays    Margin
    Verify Label Displays    Funding
    Tap Element By Label    Exchange
    Tap Next Button On Witdraw
    
    
cryptocurrency_withdrawal_request_withdrawal
    Input Cryptocurrency Withdraw Amount    min
    # Tap Take Fee From Amount Checkbox On Cryptocurrency Withdraw
    Tap Add A Note Checkbox On Cryptocurrency Withdraw
    Tap I Have Read Checkbox On Cryptocurrency Withdraw
    Tap Request Withdraw Button On Cryptocurrency Withdraw
    Input 2FA Code    ${TEST_DATA_FULL_VERIFIED_2FA_SECRET}
    Submit Tamper Proof Confirmation    123456
    
cryptocurrency_withdrawal_empty_address
    Select Cryptocurrencies Dropdown    IOTA (IOTA)
    Tap Element By Label    Margin
    Tap Next Button On Witdraw
    Tap Address Book Button
    Verify Address Book Empty Displays
    Tap Close Button On Choose Address