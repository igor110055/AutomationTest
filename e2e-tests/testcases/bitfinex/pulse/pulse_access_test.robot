*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/bitfinex_pulse_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
access
    FOR    ${index}    IN RANGE    0    15
        Access Bitfinex Pulse
        Tap Bitfinex Pulse Back Button
    END

remember_last_feed_selection
    Access Bitfinex Pulse
    Tap Element By Label    Your Feed
    Tap Bitfinex Pulse Back Button
    Access Bitfinex Pulse
    Verify Label Not Display    Whale-Alert
    Tap Element By Label    All
    Tap Bitfinex Pulse Back Button
    Access Bitfinex Pulse
    Verify Label Displays    Whale-Alert
    
new_account
    Close Test Application
    Open Apps    Bitfinex
    Login And Set Up Pin    ${TEST_DATA_BASIC_SIGNUP_AFTER_01JAN2022_KEY}    ${TEST_DATA_BASIC_SIGNUP_AFTER_01JAN2022_SECRET}    Production
    Access Bitfinex Pulse
    Verify Label Displays    Welcome to Bitfinex Pulse
    Verify Label Displays    Bitfinex Pulse allows you to stay up-to-date with what is happening within the crypto-space.
    Verify Label Displays    Click ‘Get Started’ to set up Bitfinex Pulse.
    Verify Label Displays    Get started
    Verify Label Displays    Skip setup