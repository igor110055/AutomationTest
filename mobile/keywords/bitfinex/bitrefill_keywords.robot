*** Settings ***
Resource    ../../resources/locators/android/bitfinex/bitrefill_locators.robot
*** Keywords ***
Tap Cart Icon
    Click Visible Element    ${btn_cart_icon}
    
Tap I Icon
    Click Visible Element    ${btn_i_bitrefill}
    
Tap Okay On Bitrefill Popup
    Wait Element Is Visible    ${btn_okay_bitrefill}
    Click Visible Element    ${btn_okay_bitrefill}
    
Search For Products Or Phone Number
    [Arguments]    ${products_or_phone_number}
    Click Visible Element    ${btn_search_icon}
    Input Text Into Element    ${txt_search_bitrefill}    ${products_or_phone_number}
    
Add Product Into Cart
    [Arguments]    ${amount}    ${phone_number}
    Swipe Down To Element    ${txt_enter_amount}
    Input Text Into Element    ${txt_enter_amount}    ${amount}
    Input Text Into Element    ${txt_phone_number}    ${phone_number}    swipe=DOWN
    Tap Button By Label    Add to cart
    
Remove Product From Cart
    [Arguments]    ${product}
    Tap Cart Icon
    ${delete_product_element}    Generate Element From Dynamic Locator    ${btn_delete_by_product}    ${product}
    Click Visible Element    ${delete_product_element}
    
Verify Bitrefill Screen Displays
    Wait Element Is Visible    ${lbl_search_icon_bitrefill}    30s
    Wait Element Is Visible    ${txt_search_bitrefill}    30s