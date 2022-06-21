*** Settings ***
Library    Collections
Resource    string_common.robot

*** Keywords ***
Should Be Number
    [Arguments]    ${item}
    ${number_item}    Convert To Number    ${item}
    Should Be Equal    ${item}    ${number_item}
    
Convert Item To Number
    [Arguments]    ${item}    ${separator}=.    ${thousand_separator}=${None}
    ${convert_item}    Replace String From Right    ${item}    ${separator}    _SEPARATOR_
    ${convert_item}    Run Keyword If    '${thousand_separator}'!='${None}'    Replace String    ${convert_item}    ${thousand_separator}    ${EMPTY}
    ${convert_item}    Replace String    ${item}    ${separator}    .
    ${return_value}    Convert To Number    ${convert_item}
    [Return]    ${return_value}
    
Extract Number From String
    [Arguments]    ${string}
    ${return_number}    Remove String Using Regexp    ${string}    \\D+
    [Return]    ${return_number}