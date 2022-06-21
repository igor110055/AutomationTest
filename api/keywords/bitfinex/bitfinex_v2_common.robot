*** Settings ***
Library    RequestsLibrary    
Library    DateTime
Library    Collections        
Library    ../../python_library/common/EncodeLibrary.py

*** Keywords ***
Create Bitfinex Session
    Create Session    ${BITFINEX_SESSION}    ${BITFINEX_HOST}    verify=true
    &{BITFINEX_V2_HEADER}=    Create Dictionary    Content-Type=application/json
    Set Suite Variable    &{BITFINEX_V2_HEADER}