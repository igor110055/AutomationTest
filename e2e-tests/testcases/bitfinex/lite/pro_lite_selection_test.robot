*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/pro_lite_selection_keywords.robot

Suite Teardown    Close Test Application

*** Test Cases ***
pro_version
    Open Apps    Bitfinex    no_reset=${False}
    Verify Label Displays    Tailored to you
    Verify Label Displays    Choose the Pro or Lite version depending on your personal needs. You can switch at any time in settings.
    Verify Label Displays    Advanced asset trading for professional and institutional users.
    Verify Label Displays    Streamlined features to buy, sell and manage your cryptocurrencies.
    Tap Element By Label    Pro
    Verify Label Displays    The ultimate experience
    Verify Label Displays    Buy, sell and trade cryptocurrencies all at your fingertips and on the go. Track positions, orders and history at a glance.
    
    Verify Pro Welcome Screens Display
    Tap Close Icon

pro_version_guest_user_trade
    Tap On Navigation Tab By Name    Trading
    Verify Login Panel
    Verify Label Displays    TICKERS

pro_version_guest_user_derivatives
    Tap On Navigation Tab By Name    Derivatives
    Verify Login Panel
    Verify Label Displays    TICKERS
    
pro_version_guest_user_funding
    Tap On Navigation Tab By Name    Funding
    Verify Login Panel
    Verify Label Displays    TICKERS
    
pro_version_guest_user_wallets
    Tap On Navigation Tab By Name    Wallets
    Verify Login Panel
    Verify Label Not Display    BALANCES
    
pro_version_guest_user_account
    Tap On Navigation Tab By Name    Account
    Verify Login Panel
    Verify Label Displays    Build Version
    Verify Label Not Display    Log Out
        
lite_version
    Close Test Application
    Open Apps    Bitfinex    no_reset=${False}
    Verify Pro Lite Selection Screen Displays
    Select Pro Or Lite Version    Lite
    Verify Lite Welcome Screens Display
    Tap Close Icon
    Tap On Navigation Tab By Name    Stake
    Tap On Login Button
    Tap Element By Label    API Key
    Tap While Using The App Button
    
lite_version_guest_user_trade
    Tap Close Icon
    Verify Login Panel
    Verify Label Displays    TICKERS
    
lite_version_guest_user_stake
    Tap On Navigation Tab By Name    Stake
    Verify Login Panel
    Verify Label Displays    I want to stake
    
lite_version_guest_user_pay
    Tap On Navigation Tab By Name    Pay
    Verify Login Panel
    Verify Label Not Display    Transactions
    
lite_version_guest_user_wallets
    Tap On Navigation Tab By Name    Wallets
    Verify Login Panel
    Verify Label Not Display    BALANCES
    
lite_version_guest_user_account
    Tap On Navigation Tab By Name    Account
    Verify Login Panel
    Verify Label Displays    Build Version
    Verify Label Not Display    Log Out