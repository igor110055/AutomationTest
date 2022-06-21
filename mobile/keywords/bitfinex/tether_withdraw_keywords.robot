*** Settings ***
Resource    ../../resources/locators/android/bitfinex/tether_withdraw_locators.robot
Resource    ../../../utility/common/locator_common.robot

*** Keywords ***
Select Choose Transport Dropdown
    [Arguments]    ${transport}
    Click Visible Element    ${drd_choose_transport}
    ${transport_element}    Generate Element From Dynamic Locator    ${drd_tether_withdraw_dropdown_item_by_text}    ${transport}
    Click Visible Element    ${transport_element}
    
Input Address
    [Arguments]    ${address}
    Input Text Into Element    ${txt_address}    ${address}    clear_text=${True}
    
Input Withdraw Amount
    [Arguments]    ${withdraw_amount}=min
    Run Keyword If    "${withdraw_amount}"=="min"    Click Visible Element    ${btn_min_amount}    swipe=DOWN
    ...    ELSE    Input Text Into Element    ${txt_withdraw_amount}    ${withdraw_amount}    swipe=DOWN

Tap Take Fee From Amount Checkbox
    Click Visible Element    ${chk_take_fee_from_amount}    swipe=DOWN
    
Tap Add A Note Checkbox
    Click Visible Element    ${chk_add_a_note}    swipe=DOWN
    
Tap I Have Read Checkbox
    Click Visible Element    ${chk_i_have_read}    delay=2s    swipe=DOWN
    
Tap Request Withdraw Button
    Click Visible Element    ${btn_request_withdrawal}    swipe=DOWN
    
Tap I Icon Tether Withdraw
    Click Visible Element    ${btn_i_tether_withdraw}
    
Tap Help Modal Item
    [Arguments]    ${item}
    ${item_element}    Generate Element From Dynamic Locator    ${lnk_item_on_tether_withdraw_help_modal}    ${item}
    Click Visible Element    ${item_element}

Tap Close Button Tether Withdraw
    Click Visible Element    ${btn_close_tether_withdraw}
    
Verify Invalid Address Error Message Displays
    Wait Element Is Visible    ${lbl_invalid_address_error}