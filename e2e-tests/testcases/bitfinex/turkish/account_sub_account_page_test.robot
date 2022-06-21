*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/sub_account_details_keywords.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login And Set Up Pin Turkish App    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
account_master_account
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Account
    Verify Label Displays    ACCOUNT    
    Tap Element By Label    vuongvvv
    Verify Label Displays    Username    
    Verify Label Displays    Email    
    Verify Label Displays    Timezone    
    Verify Label Displays    Paper Trading User    
    Verify Label Displays    Merchant User    
    Verify Label Displays    Has Two-Factor Auth?    
    
account_sub_account
    Tap On Back Button
    Tap Sub Account    vuongvvvsub
    Verify Sub Account Details Screen