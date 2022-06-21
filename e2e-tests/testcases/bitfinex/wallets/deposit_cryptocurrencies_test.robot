*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/deposit_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
concordium
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Deposit
    Select Payment Type On Deposit    Cryptocurrencies
    Select Cryptocurrency Dropdown Item    Concordium (CCD)
    Tap Element By Label    Next
    Tap Element By Label    Shielded transactions are not currently supported. Learn more
    Verify Label Displays    Concordium Token (CCD)
    Tap Device Back Button
    Tap On Back Button

inline_wallets_balance
    Select Cryptocurrency Dropdown Item    Bitcoin (Lightning Network) (LN-BTC)
    Verify Inline Wallets Balances
    Tap Element By Label    Margin
    Verify Label Displays    LNX not enabled for Margin wallet
    Tap Element By Label    Funding
    Verify Label Displays    LNX not enabled for Funding wallet
    Select Cryptocurrency Dropdown Item    Bitcoin (BTC)
    Verify Inline Wallets Balances
    
ln_btc_deposit
    Select Cryptocurrency Dropdown Item    Bitcoin (Lightning Network) (LN-BTC)
    Tap Element By Label    Exchange
    Tap Element By Label    Next
    Generate Invoice For LN-BTC    0.001
    Tap Element Contains Label    lnbc    swipe=DOWN
    Tap Element By Label    Share Address
    Verify Label Displays    No recommended people to share with
    Tap Device Back Button
    Tap Element By Label    Save as Image
    Verify Label Displays    Image saved successfully  
    Tap On Back Button
        
cryptocurrencies_list
    Verify Currency Not Shown On Cryptocurrencies Dropdown    TETHERUSDTDVF (USDTDVF)
    Tap Close Icon On Choose Deposit Cryptocurrency
    
btc_deposit_share
    Select Cryptocurrency Dropdown Item    Bitcoin (BTC)
    Tap Element By Label    Exchange
    Tap Element By Label    Next
    Tap Element By Label    Share Address
    Verify Label Displays    No recommended people to share with
    Tap Device Back Button
    Tap Element By Label    Save as Image
    Verify Label Displays    Image saved successfully

*** Keywords ***
Verify Inline Wallets Balances
    Verify Label Displays    Exchange
    Verify Label Displays    Margin
    Verify Label Displays    Funding