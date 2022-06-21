*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/withdraw_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/withdraw_support_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/tether_withdraw_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/cryptocurrency_withdraw_keywords.robot

Resource    ../../../../mobile/resources/testdata/staging/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Staging    lite_mode=${True}
Suite Teardown    Close Test Application

*** Variables ***
${invalid_address}    17LtyaYYU7GNg74zPNRia1G4jeyjSoV3Tpa
${valid_address}    17LtyaYYU7GNg74zPNRia1G4jeyjSoV3Tp

*** Test Cases ***
support_infor
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
    
lite_dropdowns
    Verify Payment Type Dropdown Is Enabled
    Verify From Wallet Dropdown Is Disappear
    
request_withdrawal
    Select Cryptocurrencies Dropdown    Bitcoin (BTC)
    Tap Next Button On Witdraw
    Input Cryptocurrency Withdraw Amount    min
    # Tap Take Fee From Amount Checkbox On Cryptocurrency Withdraw
    Tap Add A Note Checkbox On Cryptocurrency Withdraw
    Tap I Have Read Checkbox On Cryptocurrency Withdraw
    Tap Request Withdraw Button On Cryptocurrency Withdraw
    Input 2FA Code    ${TEST_DATA_FULL_VERIFIED_2FA_SECRET}
    Submit Tamper Proof Confirmation    123456
    
cryptocurrency_withdrawal_empty_address
    Select Cryptocurrencies Dropdown    Ethereum (ETH)
    Tap Next Button On Witdraw
    Tap Address Book Button
    Verify Address Book Empty Displays
    Tap Close Button On Choose Address
    
withdraw_tether
    Tap On Back Button
    # Tap On Balances Button    Withdraw
    Select Payment Type Dropdown    Tether
    Verify From Wallet Dropdown Is Disappear
    Select Choose Tether Dropdown    US Dollar
    Tap Next Button On Witdraw
    Select Choose Transport Dropdown    Tether(USD) on Omni
    
withdraw_tether_hot_wallet
    Verify Label Displays    Available in Hot wallet
    Verify Label Displays    5003.0

withdraw_tether_help_modal
    Tap I Icon Tether Withdraw
    Tap Help Modal Item    What is Tether
    Verify Label Displays    TETHER WITHDRAW
    Verify Label Displays    What is Tether
    Tap Close Icon
    Tap Close Button Tether Withdraw
    
withdraw_tether_invalid_address    
    Input Address    ${invalid_address}
    Verify Invalid Address Error Message Displays
    
withdraw_tether_witdraw_amount
    Input Address    ${valid_address}
    Input Withdraw Amount    min
    Input Withdraw Amount    
    Tap Take Fee From Amount Checkbox
    Tap Add A Note Checkbox
    Tap I Have Read Checkbox
    Tap Request Withdraw Button
    Input 2FA Code    ${TEST_DATA_FULL_VERIFIED_2FA_SECRET}
    Submit Tamper Proof Confirmation    123456
    Sleep    3s