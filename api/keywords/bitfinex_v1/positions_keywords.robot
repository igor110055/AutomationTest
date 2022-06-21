*** Settings ***
Resource    bitfinex_common.robot
Resource    ../../../utility/common/string_common.robot

*** Keywords ***
Post Active Positions
    [Arguments]    ${api_key}=${BITFINEX_API_KEY}    ${api_secret}=${BITFINEX_API_SECRET}
    Create Authenticated Header    /v1/positions
    ${RESP}    Post Request    ${BITFINEX_SESSION_V1}    /v1/positions    headers=&{BITFINEX_V1_HEADER}
    Set Test Variable    ${RESP}
    
Post Close Position
    [Arguments]    ${position_id}    ${api_key}=${BITFINEX_API_KEY}    ${api_secret}=${BITFINEX_API_SECRET}
    ${current_date}    Get Current Date    result_format=epoch
    ${current_date}    Evaluate    ${current_date}*1000000
    ${json_payload_body}    Set Variable    { "position_id": ${position_id}, "request": "/v1/position/close", "nonce": "${${current_date}}" }
    
    ${base64_payload}    Encode Base64 String    ${json_payload_body}
    ${signature}    Encode SHA384    ${BITFINEX_API_SECRET}    ${base64_payload}
    
    &{BITFINEX_V1_HEADER}    Create Dictionary    X-BFX-APIKEY=${api_key}    X-BFX-PAYLOAD=${base64_payload}    X-BFX-SIGNATURE=${signature}
    ${RESP}    Post Request    ${BITFINEX_SESSION_V1}    /v1/position/close    headers=&{BITFINEX_V1_HEADER}
    Set Test Variable    ${RESP}