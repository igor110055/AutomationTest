*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/bitrefill_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/cryptocurrency_deposit_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/tether_deposit_keywords.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login And Set Up Pin Turkish App    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
insufficient_balance_ln_btc
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Shopping
    Search For Products Or Phone Number    Viettel
    Tap Element Contains Label    Viettel Mobile
    Add Product Into Cart    500000    0353761367
    Tap Element By Label    Checkout    swipe=DOWN
    Tap Element Contains Label    Bitcoin Lightning
    Tap Button By Label    Pay    swipe=DOWN
    Tap Element By Label    Deposit
    Verify Cryptocurrency Deposit Screen Displays
    
insufficient_balance_usdt
    Tap On Back Button    3
    Tap Cart Icon
    Tap Element By Label    Checkout
    Tap Element Contains Label    USDT
    Tap Button By Label    Pay    swipe=DOWN
    Tap Element By Label    Deposit
    Verify Tether Deposit Screen Displays
    
remove_products_from_cart
    Tap On Back Button    3
    Remove Product From Cart    Viettel Mobile
    Verify Label Displays    Browse Products