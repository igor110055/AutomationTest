*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/fast_pay_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/fast_pay_support_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login And Set Up Pin Turkish App    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
wallets_search
    Tap On Navigation Tab By Name    Wallets
    Input Search Textbox    BTC
    Tap Wallets Panel    BALANCES
    Tap Wallets Panel    POSITIONS
    Tap Wallets Panel    ORDERS
    Tap Wallets Panel    ORDER HISTORY
    Input Search Textbox    Ethereum
    Tap Wallets Panel    ORDER HISTORY
    Tap Wallets Panel    ORDERS
    Tap Wallets Panel    POSITIONS
    Tap Wallets Panel    BALANCES
    Clear Search Textbox

configure_balance_show_other_ccy_equivalent
    Tap Balances Normal View Button
    Verify Currency Equivalent    USD    $
    Verify Currency Equivalent    CNH    ¥
    Verify Currency Equivalent    EUR    €
    Verify Currency Equivalent    GBP    £
    Verify Currency Equivalent    JPY    ¥
    Verify Currency Equivalent    USD    $
    
configure_balances
    Tap Configure Balance
    Tap Show Market Value Checkbox
    Tap Hide Small Balances Checkbox
    Tap How To Wallet Transfer Button
    Verify Currency On Balances Table    1INCH
    Tap Configure Balance    swipe=UP
    Tap Show Market Value Checkbox
    Tap Hide Small Balances Checkbox
    Tap How To Wallet Transfer Button
    Verify Currency Does Not Display On Table    1INCH
    
*** Keywords ***
Verify Currency Equivalent
    [Arguments]    ${currency}    ${symbol}
    Tap Configure Balance
    Select Item Currency Equivalent On Configure Balances    ${currency}
    Tap Balance Of Currency    BTC    exchange    total
    Verify Slide In Menu Fields    ${currency}
    Tap On Coordinates    10    200