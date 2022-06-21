*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/themes_keywords.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
settings_themes
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Settings
    Tap On Account Menu Item    Themes
    Select Theme    Red Up/Green Down
    Verify Current Color Reference    Red Up/Green Down
    Tap Element By Label    Default
    Verify Current Color Reference    Green Up/Red Down