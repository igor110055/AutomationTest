*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/redeem_coupon_keywords.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login And Set Up Pin Turkish App    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Variables ***
${used_coupon_code}    1X_g2OA_kOkUqz-X_w8Ol

*** Test Cases ***
login_api_key_used_coupon_code
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Redeem Coupon
    Verify Label Displays    Please note the coupon codes are case sensitive.
    Redeem Coupon Code    ${used_coupon_code}
    Verify Label Displays    Sorry, this coupon code is invalid or has already been redeemed. Please try another code or contact the coupon generation partner.

help_panel
    Tap Help Infor Button
    Verify External Browser URL    support.bitfinex.com/hc/en-us/articles
    Verify External Browser URL    -How-to-change-Sweatcoin-to-Bitcoin-on-Bitfinex
    Verify Label Displays    How to change Sweatcoin to Bitcoin on Bitfinex