*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/reports_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/verification_keywords.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login And Set Up Pin Turkish App    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Variables ***
${background_time}    10

*** Test Cases ***
report
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Reports
    Select Left Menu Item On Report    Invoices
    Put App In Background    ${background_time}
    Tap On Back Button    2
    Tap On Account Menu Item    Reports
    Select Left Menu Item On Report    Trades
    Put App In Background    ${background_time}
    Tap Device Back Button    2
    
bitrefill
    Tap On Account Menu Item    Shopping
    Put App In Background    ${background_time}
    Tap On Back Button
    Tap On Account Menu Item    Shopping
    Put App In Background    ${background_time}
    Tap Device Back Button
    
verification
    Tap On Account Menu Item    Verification
    Verify Verification Screen Displays
    Put App In Background    ${background_time}
    Tap On Back Button
    Tap On Account Menu Item    Verification
    Verify Verification Screen Displays
    Put App In Background    ${background_time}
    Tap Device Back Button
    
affiliate
    Tap On Account Menu Item    Affiliate
    Put App In Background    ${background_time}
    Tap On Back Button
    Tap On Account Menu Item    Affiliate
    Put App In Background    ${background_time}
    Tap Device Back Button
    
leaderboard
    Tap On Account Menu Item    Leaderboard
    Put App In Background    ${background_time}
    Tap On Back Button
    Tap On Account Menu Item    Leaderboard
    Put App In Background    ${background_time}
    Tap Device Back Button