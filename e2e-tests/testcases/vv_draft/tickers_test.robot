*** Settings ***

Resource    ../../../mobile/resources/init.robot
Resource    ../../../mobile/keywords/bitfinex/common_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/home_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/login_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/derivatives_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/funding_keywords.robot

Test Setup    Open Apps    Bitfinex
Test Teardown    Close Test Application

*** Variables ***

*** Test Cases ***
tickers
    [Documentation]    tickers
    [Tags]     E2E
    # # Tickers is expanded tap on header to check is it collapsible 
    # Verify Tickers
    # Click Collapse Ticker
    # Verify Tickers Disappear
    # Click Collapse Ticker
    # Verify Tickers
    
    # Select Starred Tab
    # Select All Tab
    
    # # Type non-existing ticker pair will show No ticker found
    # Search Ticker    NONEXIST
    # Verify Tickers Table Has No Data
    # Clear Ticker Search
    
    Search Ticker    BTC/USD
    Verify Tickers Table    BTCUSD    BTCUST
    
    Click Tickers Table Column Header    LAST
    Verify Tickers Column Sorting    last    asc
        
    Click Tickers Table Column Header    LAST
    Verify Tickers Column Sorting    last    desc
    
    Click Tickers Table Column Header    VOL USD
    Verify Tickers Column Sorting    vol_usd    asc
    
    Click Tickers Table Column Header    VOL USD
    Verify Tickers Column Sorting    vol_usd    desc
        
    Clear Ticker Search
    
    # Click Currency Filter
    # Select Currency    USD
    # Click Currency Filter
    # Select Currency    Any
    
    # Tap On Navigation Tab By Name    Derivative
    # Search Ticker On Derivatives    BTC
    # Verify Tickers On Derivatives    BTC
    # Tap On Column Header On Derivatives    NAME
    # Verify Tickers Column Sorting On Derivatives    name    asc
    # Tap On Column Header On Derivatives    NAME
    # Verify Tickers Column Sorting On Derivatives    name    desc
    # Tap On Column Header On Derivatives    LAST
    # Verify Tickers Column Sorting On Derivatives    last    asc
    # Tap On Column Header On Derivatives    LAST
    # Verify Tickers Column Sorting On Derivatives    last    desc
    
    Tap On Navigation Tab By Name    Funding
    Search Ticker    USD
    Verify Tickers Table On Funding    USD    UST
    Clear Ticker Search On Funding
    
    Tap On Column Header On Derivatives    NAME
    Verify Tickers Column Sorting On Funding    name    asc
    Tap On Column Header On Derivatives    NAME
    Verify Tickers Column Sorting On Funding    name    desc
    Tap On Column Header On Derivatives    LAST
    Verify Tickers Column Sorting On Funding    last    asc
    Tap On Column Header On Derivatives    LAST
    Verify Tickers Column Sorting On Funding    last    desc
    