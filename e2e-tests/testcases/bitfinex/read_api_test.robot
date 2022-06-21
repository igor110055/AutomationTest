*** Settings ***
Resource    ../../../mobile/resources/init.robot
Resource    ../../../mobile/resources/testdata/staging/bitfinex_data.robot
Resource    ../../../mobile/keywords/bitfinex/account_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/permissions_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/price_alerts_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/funding_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/derivatives_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/derivatives_pair_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/bitfinex_pulse_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/order_detail_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/position_detail_keywords.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_VUONG0204_ONLY_WITHDRAWAL_API_KEY}    ${TEST_DATA_VUONG0204_ONLY_WITHDRAWAL_API_SECRET}    Staging
Suite Teardown    Close Test Application

*** Test Cases ***
permissions_screen_verification
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Account
    Tap On Account Menu Item    Permissions
    Verify Label Displays    Require 'Get account fee information' and 'Edit account information' to edit the permissions. Please go to web if you want to change the permissions
    Verify Label Displays    Two-factor authentication (Google Authenticator) must be enabled on your account
    
    Verify Checkbox By Name    Get account fee information
    Verify Label Displays    Turn on to receive account fee info
    Verify Checkbox By Name    Edit account information
    Verify Label Displays    Turn on to edit account info
    Verify Checkbox By Name    Get historical balances entries and trade information
    Verify Label Displays    Turn on to view and download info on the detailed trading activities of your account
    Verify Checkbox By Name    Get orders and statuses
    Verify Label Displays    Turn on to view the orders on your account
    Verify Checkbox By Name    Create and cancel orders
    Verify Label Displays    Turn on to create and cancel orders
    Verify Checkbox By Name    Get position and margin info
    
    Verify Label Displays    Turn on to view margin positions and info    swipe=DOWN
    Verify Checkbox By Name    Claim a position
    Verify Label Displays    Turn on to be able to claim your open positions    swipe=DOWN
    Verify Checkbox By Name    Get funding statuses and info
    Verify Label Displays    Turn on to get funding statuses and info    swipe=DOWN
    Verify Checkbox By Name    Offer, cancel and close funding
    Verify Label Displays    Turn on to edit offer, cancel and close funding    swipe=DOWN
    
    Verify Label Displays    Get wallet balances and addresses    swipe=DOWN
    Verify Checkbox By Name    Get wallet balances and addresses
    Verify Label Displays    Turn on to access balances and addresses    swipe=DOWN
    Verify Label Displays    Transfer between your wallets    swipe=DOWN
    Verify Checkbox By Name    Transfer between your wallets
    Verify Label Displays    Turn on to transfer between your wallets    swipe=DOWN
    Verify Label Displays    WITHDRAW    swipe=DOWN
    Verify Checkbox By Name    Create a new withdrawal    ${True}
    
account_address_book
    Tap On Back Button
    Tap On Account Menu Item    Address Book
    Verify Label Displays    Need API with the 'Get account fee information' to see address book entries and create a new entry.
    Verify Label Displays    Need API with the 'Edit account information' to create or delete address book entry.
        
settings_screen_appearance 
    Tap On Back Button    2
    Tap On Account Menu Item    Settings
    Tap On Account Menu Item    Appearance
    Verify Permission Message    Need API with the 'Edit account information' permission to update account info.
    
settings_screen_price_alerts
    Tap On Back Button
    Tap On Account Menu Item    Price Alerts
    Verify Permission Message    Need API with the 'Create and cancel orders' permission to add or remove a price alert.
    Verify All Price Alerts Fields Are Disabled

wallets_transfer
    Tap On Back Button    2
    Tap On Navigation Tab By Name    Wallets
    Tap Balance Of Currency    BTC    margin    total
    Tap Transfer On Exchange Wallet Popup
    Verify Permission Message    Need API with the 'Transfer between your wallets' permission to transfer your balance.
    
wallets_deposit
    Tap On Back Button
    Tap On Balances Button    Deposit
    Verify Permission Message    Need API with the 'Transfer between your wallets' permission for deposit.
    Verify Permission Message    Need API with the 'Get historical balances entries and trade information' permission to see Recent Deposits
    
wallets_withdraw
    Tap On Back Button
    Tap On Balances Button    Withdraw
    Verify Permission Message    Only Cryptocurrency and Tether Withdrawals are available via mobile at the moment.
    Verify Permission Message    Need following API permissions to be enabled to withdraw
    Verify Permission Message    Need API with the 'Get historical balances entries and trade information' permission to see Recent Withdrawals
    
wallets_conversion
    Tap On Back Button
    Tap On Balances Button    Conversion
    Verify Permission Message    Need API with the 'Transfer between your wallets' permission for currency conversion.
    Tap On Back Button
    Verify Permission Message    Need API with the 'Create and cancel orders' permission to cancel all orders.    down
    
funding_main_screen
    Tap On Navigation Tab By Name    Funding
    Verify Permission Message    Need API with the 'Offer, cancel and close funding' permission to cancel all offers.    down

funding_main_screen_bids_offers_details
    Tap On Bids And Offers Row    USD
    Verify Permission Message    Need API with the 'Offer, cancel and close funding' permission to modify or cancel an offer.

funding_pair_screen
    Tap On Back Button
    Access Trading Pair On Funding    USD    up
    Verify Permission Message    Need API with the 'Offer, cancel and close funding' permission to place an offer.    down
    Verify Permission Message    Need API with the 'Offer, cancel and close funding' permission to cancel all offers.    down
    Verify Permission Message    Need API with the 'Offer, cancel and close funding' permission to place an offer.    down
    
derivatives_pair
    Tap On Back Button
    Tap On Navigation Tab By Name    Derivatives
    Search Ticker On Derivatives    BTC-PERP
    Access Trading Pair    BTCF0:USTF0
    Verify Permission Message    Need API with the 'Create and cancel orders' permission to place an order.    down
    Verify Permission Message    Need API with the 'Create and cancel orders' permission to cancel all orders.    down
    
derivatives_pair_order_detail
    Tap Orders Panel Record By Value    0.001
    Verify Permission Message    Need API with the 'Create and cancel orders' permission to modify or cancel an order.
    Tap Order Detail Field    Amount
    
derivatives_pair_position_detail
    Tap On Back Button
    Tap Positions Panel Record By Value    0.0001
    Verify Permission Message    Need API with the 'Create and cancel orders' permission to modify or cancel an order.
    Tap Position Detail Field    Amount
    
trading_pair
    Tap On Back Button    2
    Tap On Navigation Tab By Name    Trading
    Search Ticker    BTCUSD
    Access Trading Pair    BTCUSD
    Verify Permission Message    Need API with the 'Create and cancel orders' permission to place an order.    down
    Verify Permission Message    Need API with the 'Create and cancel orders' permission to cancel all orders.    down
    
trading_pair_order_detail
    Tap Orders Panel Record By Value On Trading Pair    0.001
    Verify Permission Message    Need API with the 'Create and cancel orders' permission to modify or cancel an order.
    Tap Order Detail Field    Amount
    
pulse_profile
    Tap On Back Button    2
    Access Bitfinex Pulse
    Tap Element By Label    Your Profile
    Tap Edit Profile Button Of Your Pulse

pulse_create_new_pulse
    Tap Create New Pulse
    Verify Permission Message    Need API with the 'Edit account information' permission to create pulse.