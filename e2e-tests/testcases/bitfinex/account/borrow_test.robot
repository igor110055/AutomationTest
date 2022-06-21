*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/borrow_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/available_balances_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/cryptocurrency_deposit_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/login_keywords.robot
Resource    ../../../../mobile/resources/testdata/staging/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/verification_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/position_detail_keywords.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Staging
Suite Teardown    Close Test Application

*** Test Cases ***
borrow_wallet_icon
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Borrow
    Tap Continue To Borrow Button
    Tap On Wallet Icon
    Verify Available Balances

borrow_fields_validation
    Tap On Back Button
    Input Borrow Amount    174
    Verify Label Displays    Minimum Amount 175.00 USD
    Input Borrow Amount    999999999
    Verify Label Displays    Not enough funding available
    Input Borrow Amount    99999
    Verify Label Displays    Maximum Amount 10.000 BTC
    
borrow_add_funds
    Tap Add Funds Link
    Verify Cryptocurrency Deposit Screen Displays
    Tap On Back Button
    
borrow_you_have_link
    Input Borrow Amount    100
    Verify You Have Link    BTC

borrow_use_available_fund
    Verify You Have Link    BTC
    Tap I Icon To Use Available Fund
    Verify Collateral Amount Textbox Value    10.000

borrow_borrow_amount_populated    
    Select Borrow Currency    USD
    Verify Borrow Amount Textbox Value    175

borrow_period_days_field
    Verify Period Days Value    30
    Input Period Days    1
    Verify Period Days Field Limitation Error
    Input Period Days    121
    Verify Period Days Field Limitation Error
    Input Period Days    2

borrow_how_it_works    
    Tap How It Works
    Close How It Works Popup

borrow_variable_rate    
    Tap Borrow Button
    Verify Label Displays    I have read and agree to the terms.
    Tap Confirm Borrowing On Borrow Confirmation Popup
    Tap Okay On Borrow Completed Popup
    
borrow_fix_rate    
    Scroll To Borrow Dropdown
    Select Borrow Currency    USD
    Tap Fix Rate Checkbox    
    Tap Borrow Button
    Tap Confirm Borrowing On Borrow Confirmation Popup    ${True}
    Tap Okay On Borrow Completed Popup
    Tap On Back Button
    Tap On Navigation Tab By Name    Wallets
    Swipe To Wallets Panel    ORDERS    0.2    DOWN
    Tap Positions Panel Record By Value On Wallets    BTC
    Close With Market Order