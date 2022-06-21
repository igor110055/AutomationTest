*** Settings ***
Resource    ../../resources/locators/android/bitfinex/verification_locators.robot

*** Keywords ***
Tap Manage Documents
    Swipe Down To Element    ${btn_manage_documents_verification}
    Click Visible Element    ${btn_manage_documents_verification}

Tap FAQ Link
    Click Visible Element    ${lnk_faq_verification}

Tap Bitfinex Security Verify Button
    Click Visible Element    ${btn_bitfinex_securities_verification}    swipe=DOWN
    
Verify Verification Documents
    Wait Element Is Visible    ${btn_choose_file_verification_documents}
    
Verify Verification Screen Displays
    Wait Element Is Visible    ${lbl_bitfinex}
    Wait Element Is Visible    ${lnk_faq_verification}