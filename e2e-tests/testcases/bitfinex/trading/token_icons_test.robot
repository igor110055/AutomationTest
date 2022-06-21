*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Variables ***
${to_be_deleted_string}    TO_BE_DELETED_CAPTURED_IMAGE_

*** Test Cases ***
token_icons
    Search Ticker    FTM
    Capture Screen And Compare    ${to_be_deleted_string}FTM    FTM

    Search Ticker    SHIB
    Capture Screen And Compare    ${to_be_deleted_string}SHIB    SHIB

    Search Ticker    AXS
    Capture Screen And Compare    ${to_be_deleted_string}AXS    AXS
    
    Search Ticker    KAI
    Capture Screen And Compare    ${to_be_deleted_string}KAI    KAI
    
    Search Ticker    PNG
    Capture Screen And Compare    ${to_be_deleted_string}PNG    PNG
    
    Search Ticker    ATLAS
    Capture Screen And Compare    ${to_be_deleted_string}ATLAS    ATLAS
    
    Search Ticker    POLIS
    Capture Screen And Compare    ${to_be_deleted_string}POLIS    POLIS
    
    Search Ticker    VRA
    Capture Screen And Compare    ${to_be_deleted_string}VRA    VRA
    
delist_token
    Search Ticker    HEZ
    Verify Label Displays    No tickers found
    Search Ticker    EOSDT
    Verify Label Displays    No tickers found
    Search Ticker    YGG
    Verify Label Displays    No tickers found
    Search Ticker    ORS
    Verify Label Displays    No tickers found
    Search Ticker    QSH
    Verify Label Displays    No tickers found
    Search Ticker    DCR
    Verify Label Displays    No tickers found
    Search Ticker    UOP
    Verify Label Displays    No tickers found
    Search Ticker    XSN
    Verify Label Displays    No tickers found
    Search Ticker    ESS
    Verify Label Displays    No tickers found
    Search Ticker    MDoge
    Verify Label Displays    No tickers found