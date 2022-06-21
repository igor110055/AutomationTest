*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/live_chat_keywords.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
live_chat
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Contact Support
    Tap On Account Menu Item    Live Chat
    Send Message    Hello There
    Verify Message In Live Chat Panel    What can I do for you?
    Send Message    Bitfinex
    Tap Button By Label    What is Bitfinex?
    Tap Element By Label    https://www.bitfinex.com/features
    Verify Label Displays    World class trading platform
    Tap Device Back Button
    Verify Label Displays    https://www.bitfinex.com/features