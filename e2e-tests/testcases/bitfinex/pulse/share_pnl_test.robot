*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/bitfinex_pulse_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/position_detail_keywords.robot
Resource    ../../../../mobile/resources/testdata/staging/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Staging
Suite Teardown    Close Test Application

*** Test Cases ***
pnl_as_percentage
    Tap On Navigation Tab By Name    Wallets
    Tap Positions Panel Record By Value On Wallets    IOTA
    Tap Pnl Percentage Share
    Tap Element By Label    P/L AS % OF COLLATERAL
    Tap Element By Label    Share
    Verify Pulse Content    Referral Code - PUB_ktE_3NzuW
    Tap Element By Label    Post
    Verify Label Displays    Pulse created successfully.
    Tap Pulse Option By Title    ${EMPTY}    Delete
    Tap Element By Label    Confirm
    Verify Label Displays    Pulse deleted successfully.
    
pnl_as_amount
    Tap On Back Button
    Tap On Navigation Tab By Name    Wallets
    Tap Positions Panel Record By Value On Wallets    IOTA
    Tap Pnl Percentage Share
    Tap Element By Label    P/L IN AMOUNT OF USD
    Tap Element By Label    Share
    Verify Pulse Content    Referral Code - PUB_ktE_3NzuW
    Tap Element By Label    Post
    Verify Label Displays    Pulse created successfully.
    Tap Pulse Option By Title    ${EMPTY}    Delete
    Tap Element By Label    Confirm
    Verify Label Displays    Pulse deleted successfully.