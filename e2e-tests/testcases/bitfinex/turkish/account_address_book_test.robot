*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/address_book_keywords.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login And Set Up Pin Turkish App    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Variables ***
${valid_address}    0xB0fbF1497E051954A01c31666b8F407cFa17dCC2
${invalid_address}    0xB0fbF1497E051954A01c31666b8F407cFa17dCC3

*** Test Cases ***
add_address
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Account
    Tap On Account Menu Item    Address Book    
    Tap Add Address Button
    Add Address To Address Book    ETH - Ethereum    AUTOMATION_ETH    ${invalid_address}    submit=${False}
    Verify Label Displays    Invalid Address
    Add Address To Address Book    ETH - Ethereum    AUTOMATION_ETH    ${invalid_address}    submit=${False}    input_address=paste
    Verify Label Displays    Invalid Address
    Add Address To Address Book    ETH - Ethereum    AUTOMATION_ETH    ${valid_address}
    Delete Address Book    ${valid_address}
    Verify Label Not Display    ${valid_address}