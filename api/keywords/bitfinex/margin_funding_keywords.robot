*** Settings ***
Resource    bitfinex_v2_common.robot
*** Keywords ***
# Post Active Funding Offers
    # [Arguments]    ${symbol}    ${apiKey}=${BITFINEX_API_KEY}    ${api_secret}=${BITFINEX_API_SECRET}
    # ${current_date}    Get Current Date    result_format=epoch
    # ${nonce}    Evaluate    ${current_date}*1000000
    # ${nonce}    Convert To Integer    ${nonce}
    # ${nonce}    Convert To String    ${nonce}
    # ${api_path}    Convert To String    v2/auth/r/wallets
    
    # ${body}    Set Variable    {}
    # ${body}    To Json    ${body}
    
    # ${signature}    Convert To Bytes    /api/${api_path}${nonce}${body}
    # ${secret}    Convert To Bytes    ${api_secret}
    # # ${base64_payload}    Encode Base64 String    ${signature}
    # ${encode_signature}    Encode_SHA384_1        ${secret}    ${signature}
    
    # # &{BITFINEX_V2_HEADER}=    Create Dictionary    Content-Type=application/json    bfx-nonce=1625556681779000    bfx-signature=d30b4355696629b9ba9aa3834b73d12b9293bebd342941905d63d14aaf17b490821c4f0f198cf30c900f07035e9c2987    bfx-apikey=${apiKey}
    # &{BITFINEX_V2_HEADER}=    Create Dictionary    Content-Type=application/json    bfx-nonce=${nonce}    bfx-signature=${encode_signature}    bfx-apikey=${apiKey}

    # ${RESP}    Post Request    ${BITFINEX_SESSION}    ${api_path}    json=${body}    headers=&{BITFINEX_V2_HEADER}
    # Set Test Variable    ${RESP}

Post Active Funding Offers
    [Arguments]    ${symbol}    ${apiKey}=${BITFINEX_API_KEY}    ${api_secret}=${BITFINEX_API_SECRET}
    ${body}    Set Variable    {}
    ${body}    To Json    ${body}
    ${BITFINEX_V2_HEADER}    Generate_Authorisation_Header    RlAiD8cpCsxoEOYX3Mx50quE0owCFZ2zZflk5jDkTtc    Fc4p6WceFLTbKZY4hNUFssPX8kpJPbqzwMrBIegO1zE    v2/auth/r/wallets    {}
    Set To Dictionary    ${BITFINEX_V2_HEADER}    Content-Type=application/json
    ${RESP}    Post Request    ${BITFINEX_SESSION}    v2/auth/r/wallets    data=${body}    headers=${BITFINEX_V2_HEADER}
    Set Test Variable    ${RESP}