*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/cryptocurrency_deposit_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login And Set Up Pin Turkish App    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production    lite_mode=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
configure_balance_show_other_ccy_equivalent
    Tap On Navigation Tab By Name    Wallets
    Verify Currency Equivalent    USD    $
    Verify Currency Equivalent    CNH    ¥
    Verify Currency Equivalent    EUR    €
    Verify Currency Equivalent    GBP    £
    Verify Currency Equivalent    JPY    ¥
    
configure_balance_how_to_wallet_transfer_checkbox_not_show
    Tap Configure Balance
    Verify How To Wallet Transfer Checkbox Disappear
    Select Item Currency Equivalent On Configure Balances    USD

slide_in_menu
    Tap Balance Currency In Lite Mode    BTC    TOTAL
    Verify Slide In Menu    BTC
    Tap Element By Label    Deposit${SPACE}BTC
    Verify Cryptocurrency Deposit Screen Displays
    Tap On Back Button
    Tap Balance Currency In Lite Mode    BTC    USD EQUIVALENT
    Verify Slide In Menu    BTC
    Tap Element By Label    Deposit${SPACE}BTC
    Verify Cryptocurrency Deposit Screen Displays
    Tap On Back Button
    
*** Keywords ***
Verify Currency Equivalent
    [Arguments]    ${currency}    ${symbol}
    Tap Configure Balance
    Select Item Currency Equivalent On Configure Balances    ${currency}
    Verify Displaying Currency On Equivalent    BTC    ${symbol}    ${currency}
    Tap Balance Currency In Lite Mode    BTC    TOTAL
    Verify Slide In Menu Fields    ${currency}
    Tap On Coordinates    10    900
    