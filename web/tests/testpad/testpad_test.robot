*** Settings ***
Resource    ../../resources/init.robot
Resource    ../../keywords/testpad/testpad_common_keywords.robot
Resource    ../../keywords/testpad/script_keywords.robot

*** Variables ***
${version}    5.8

*** Test Cases ***
testpad_mobile_test
    Open Browser With Option    https://ontestpad.com/login
    Login Testpad    vuong.van@bitfinex.com    3V@bkdn0707
    # LITE MODE
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/1541#//    vuong.van@bitfinex.com
    
    # Update & Maintenance
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/1438#//    fred.lin@bitfinex.com
    # Wallets - Cryptocurrency Withdraw
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/1291#//    vuong.van@bitfinex.com
    # Security Verification
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/1190#//    vuong.van@bitfinex.com
    # BORROW
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/998#//    vuong.van@bitfinex.com
    
    # Ticker screen
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/853#//    obinna.okoro@bitfinex.com
    # Wallet
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/751#//    ivan.coric@bitfinex.com
    # Sign UP
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/750#//    amresh.suresh@bitfinex.com
    # Login / Logout
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/51#//    ivan.coric@bitfinex.com
    # Provided
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/71#//    ivan.coric@bitfinex.com
    # Funding Form
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/70#//    amresh.suresh@bitfinex.com
    # Summary
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/69#//    justin.xavier@bitfinex.com
    # Bids & Offers
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/63#//    justin.xavier@bitfinex.com
    # Order Books
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/67#//    justin.xavier@bitfinex.com
    
    # Order Form
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/65#//    fred.lin@bitfinex.com
    # Orders
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/59#//    fred.lin@bitfinex.com
    # Order History and Liquidation
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/60#//    rahul.garg@bitfinex.com
    # Taken
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/61#//    rahul.garg@bitfinex.com
    # Tickers
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/57#//    rahul.garg@bitfinex.com
    # Ticker and Santiment
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/72#//    amresh.suresh@bitfinex.com
    # Account Page
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/54#//    vuong.van@bitfinex.com
    # Read API permission
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/52#//    vuong.van@bitfinex.com
    # Positions
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/58#//    obinna.okoro@bitfinex.com
    # Pulse
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/709#//    justin.xavier@bitfinex.com
    # Chart
    Create Test Pad Test Run    https://bitfinex.ontestpad.com/script/710#//    obinna.okoro@bitfinex.com
    
*** Keywords ***
Create Test Pad Test Run
    [Arguments]    ${url_to_test}    ${tester}    ${build}=${version}
    Go To Url    ${url_to_test}
    Click Create New Test Run Button
    Click I Really Do Want A New Test Button
    Submit Test Run Details    ${tester}    ${build}    ${tester}