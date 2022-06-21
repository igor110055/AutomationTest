*** Settings ***
Resource    ../../resources/locators/android/bitfinex/borrow_locators.robot
Resource    ../../../utility/common/locator_common.robot

*** Keywords ***
Tap Continue To Borrow Button
    Swipe Down To Element    ${btn_continue_to_borrow}
    Click Visible Element    ${btn_continue_to_borrow}
    
Tap On Wallet Icon
    Click Visible Element    ${btn_wallet_icon}
    
Input Borrow Amount
    [Arguments]    ${amount}
    Input Text Into Element    ${txt_borrow_amount}    ${amount}    clear_text=${True}

Tap Collateral Amount Dropdown
    Click Visible Element    ${drd_collateral_amount}

Tap I Icon To Use Available Fund
    Click Visible Element    ${btn_use_available_fund}

Tap How It Works
    Click Visible Element    ${btn_how_it_works}    swipe=DOWN

Tap Borrow Button
    Swipe Down To Element    ${btn_borrow}    1
    Click Visible Element    ${btn_borrow}

Tap Confirm Borrowing On Borrow Confirmation Popup
    [Arguments]    ${is_swipe_down}=${False}
    Run Keyword If    ${is_swipe_down}==${True}    Swipe Down To Element    ${btn_confirm_borrowing_on_borrow_confirmation_popup}
    Click Visible Element    ${btn_confirm_borrowing_on_borrow_confirmation_popup}

Tap Okay On Borrow Completed Popup
    Click Visible Element    ${btn_okay_on_borrow_completed_popup}
    Sleep    3s

Tap Fix Rate Checkbox
    Click Visible Element    ${chk_fixed_rate}
    Sleep    2s    

Tap Add Funds Link
    Click Visible Element    ${lnk_add_funds}

Tap Upgrade Button On Verified Warning Popup
    Click Visible Element    ${btn_upgrade_verified_warning_popup}
    
Select Collateral Currency
    [Arguments]    ${currency}
    Tap Collateral Amount Dropdown
    ${currency_element}    Generate Element From Dynamic Locator    ${drd_currency_on_collateral_dropdown_by_text}    ${currency}
    Click Visible Element    ${currency_element}

Select Borrow Currency
    [Arguments]    ${currency}
    Click Visible Element    ${drd_i_want_to_borrow}
    ${currency_element}    Generate Element From Dynamic Locator    ${drd_currency_on_collateral_dropdown_by_text}    ${currency}
    Click Visible Element    ${currency_element}    delay=1s

Input Period Days
    [Arguments]    ${days}
    Input Text Into Element    ${txt_period_days}    ${days}    clear_text=${True}

Close How It Works Popup
    Wait Element Is Visible    ${btn_okay_on_how_it_works_popup}
    Click Visible Element    ${btn_okay_on_how_it_works_popup}    

Scroll To Borrow Dropdown
    Swipe Up To Element    ${drd_i_want_to_borrow}

Verify You Have Link
    [Arguments]    ${currency}
    ${lnk_you_have_element}    Generate Element From Dynamic Locator    ${lnk_you_have_by_text}    ${currency}
    Run Keyword And Continue On Failure    Wait Element Is Visible    ${lnk_you_have_element}
    
Verify Collateral Amount Textbox Value
    [Arguments]    ${expected_collateral_amount}
    ${collateral_amount}    Get Element Text    ${txt_collateral_amount}
    Run Keyword And Continue On Failure    Should Be Equal    ${collateral_amount}    ${expected_collateral_amount}
    
Verify Borrow Amount Textbox Value
    [Arguments]    ${expected_amount}
    ${collateral_amount}    Get Element Text    ${txt_borrow_amount}
    Should Be Equal    ${collateral_amount}    ${expected_amount}
    
Verify Period Days Value
    [Arguments]    ${expected_days}
    ${period_days}    Get Element Text    ${txt_period_days}
    Should Be Equal    ${period_days}    ${expected_days}
    
Verify Period Days Field Limitation Error
    Wait Element Is Visible    ${lbl_period_days_limitation_error}

Verify Borrow Screen Displays
    Wait Element Is Visible    ${lbl_bitfinex_borrow}

Verify Verified Warning Popup Displays
    Wait Element Is Visible    ${lbl_verified_at_basic_level_verified_warning_popup}
    
Verify Currency On Borrow
    Wait Element Is Visible    ${lbl_you_can_borrow_currency}
    Wait Element Is Visible    ${lbl_accepted_collateral_currency}
    