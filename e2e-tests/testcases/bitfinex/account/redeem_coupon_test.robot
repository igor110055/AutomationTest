*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/staging/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/redeem_coupon_keywords.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Staging
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

login_with_email_used_coupon_code
    Close Test Application
    Open Apps    Bitfinex
    Login With Email    ${TEST_DATA_FULL_VERIFIED_EMAIL}    ${TEST_DATA_FULL_VERIFIED_PASSWORD}    ${TEST_DATA_FULL_VERIFIED_2FA_SECRET}    Staging
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Redeem Coupon
    Redeem Coupon Code    ${used_coupon_code}
    Verify Label Displays    Sorry, this coupon code is invalid or has already been redeemed. Please try another code or contact the coupon generation partner.