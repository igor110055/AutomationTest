*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/deposit_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/withdraw_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login And Set Up Pin Turkish App    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
wallets_recent_deposit
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Deposit
    Tap Element By Label     6/14/2022    delay=1s
    Tap Element By Label    Amount
    Tap Element By Label    Txid    delay=5s
    Tap Value By Field Name    Address    delay=5s
    Verify Label Displays    Token Account
    Tap Device Back Button
    Tap On Back Button    2
    
wallets_recent_withdraw
    Tap On Balances Button    Withdraw
    Tap Element By Label    6/3/2022    delay=1s
    Tap Element By Label    Amount
    Tap Element By Label    Txid    delay=5s
    Tap Value By Field Name    Address    delay=5s
    Verify Label Displays    Account
    Tap Device Back Button
    Tap On Back Button    2