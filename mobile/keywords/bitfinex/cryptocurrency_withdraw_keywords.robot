*** Settings ***
Resource    ../../resources/locators/android/bitfinex/cryptocurrency_withdraw_locators.robot
Resource    ../../../utility/common/locator_common.robot

Resource    ../common/mobile_common.robot
*** Keywords ***
Input Cryptocurrency Withdraw Amount
    [Arguments]    ${withdraw_amount}=min
    Run Keyword If    "${withdraw_amount}"=="min"    Click Visible Element    ${btn_min_amount_cryptocurrency_withdraw}
    ...    ELSE    Input Text Into Element    ${txt_amount_cryptocurrency_withdraw}    ${withdraw_amount}
    
Tap Take Fee From Amount Checkbox On Cryptocurrency Withdraw
    Click Visible Element    ${chk_take_fee_from_amount_cryptocurrency_withdraw}

Tap Add A Note Checkbox On Cryptocurrency Withdraw
    Click Visible Element    ${chk_add_a_note_cryptocurrency_withdraw}
    
Tap I Have Read Checkbox On Cryptocurrency Withdraw
    Click Visible Element    ${chk_i_have_read_cryptocurrency_withdraw}    swipe=DOWN
    
Tap Request Withdraw Button On Cryptocurrency Withdraw
    Click Visible Element    ${btn_request_withdrawal_cryptocurrency_withdraw}    swipe=DOWN