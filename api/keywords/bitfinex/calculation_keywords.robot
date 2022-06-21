*** Settings ***
Library    RequestsLibrary    

*** Keywords ***
Post Foreign Exchange Rate
    [Arguments]    ${ccy_1}    ${ccy_2}
    ${RESP}    Post Request    ${BITFINEX_SESSION}    /v2/calc/fx    data={"ccy1":"${ccy_1}","ccy2":"${ccy_2}"}    headers=&{BITFINEX_V2_HEADER}
    Set Test Variable    ${RESP}
    
Post Market Average Price
    [Arguments]    ${params}
    ${RESP}    Post Request    ${BITFINEX_SESSION}    /v2/calc/trade/avg?${params}    headers=&{BITFINEX_V2_HEADER}
    Set Test Variable    ${RESP}