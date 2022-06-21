*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/deposit_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/tether_deposit_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login And Set Up Pin Turkish App    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
tether_inline_wallet_balances
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Deposit
    Select Payment Type On Deposit    Tether
    Select Choose Tether Dropdown Item    US Dollar ₮ (USDt)
    Select Choose Transport Dropdown Item    Tether(USD) on Omni
    Verify Label Displays    Exchange
    Verify Label Displays    Margin
    Verify Label Displays    Funding
    
tether_deposit_screen
    Tap Element By Label    Next
    Verify Tether Deposit Screen Displays
    
share_buttons
    Tap Element By Label    Share Address
    Verify Label Displays    No recommended people to share with
    Tap Device Back Button
    Tap Element By Label    Save as Image
    Verify Label Displays    Image saved successfully