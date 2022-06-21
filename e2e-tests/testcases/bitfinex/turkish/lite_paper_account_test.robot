*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login And Set Up Pin Turkish App    ${TEST_DATA_PAPER_TRADING_API_KEY}    ${TEST_DATA_PAPER_TRADING_API_SECRET}    Production    lite_mode=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
stake_pay_tabs_are_hidden
    Verify Hidden Tab    Stake

account_shopping_disabled
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Shopping
    Verify Label Displays    Contact Support
    
account_affiliate_disabled
    Tap On Account Menu Item    Affiliate
    Verify Label Displays    Contact Support
    
account_redeem_coupon_disabled
    Tap On Account Menu Item    Redeem Coupon
    Verify Label Displays    Contact Support