*** Settings ***
Resource    ../../resources/locators/android/bitfinex/position_detail_locators.robot

*** Keywords ***
Close With Market Order
    Click Visible Element    ${btn_close_with_a_market_order}
    Click Visible Element    ${btn_submit_on_close_position_popup}
    Sleep    2s
    
Tap Position Detail Field
    [Arguments]    ${field}
    ${field_element}    Generate Element From Dynamic Locator    ${lbl_position_detail_field_by_text}    ${field}
    Click Visible Element    ${field_element}    delay=1s
    
Tap Pnl Percentage Share
    Click Visible Element    ${btn_pnl_percentage_share}