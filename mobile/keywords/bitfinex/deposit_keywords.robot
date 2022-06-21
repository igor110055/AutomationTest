*** Settings ***
Resource    ../../resources/locators/android/bitfinex/deposit_locators.robot
Resource    common_keywords.robot
*** Keywords ***
Tap I Icon On Deposit
    Click Visible Element    ${btn_i_support_infor}

Tap Close Icon On Deposits Support
    Click Visible Element    ${btn_close_icon_deposits_support}

Tap Payment Type Dropdown
    Click Visible Element    ${drd_payment_type_deposit}
    
Select Payment Type On Deposit
    [Arguments]    ${payment_type}
    Tap Payment Type Dropdown
    Tap Element By Label    ${payment_type}
    
Select Payment Method On Payment Card Deposit
    [Arguments]    ${payment_method}
    Tap Element By Label    ${payment_method}

Select Cryptocurrency Dropdown Item
    [Arguments]    ${cryptocurrency}
    Click Visible Element    ${drd_cryptocurrency}
    Input Text To Textbox    ${cryptocurrency}
    Tap Element By Label    ${cryptocurrency}

# BANK WIRE
Tap Currency Dropdown
    Click Visible Element    ${drd_cryptocurrency}

Select Curency Dropdown Item
    [Arguments]    ${currency_item}
    Tap Currency Dropdown
    Tap Element By Label    ${currency_item}

Input Bank Wire Deposit Amount
    [Arguments]    ${amount}
    Input Text Into Element    ${txt_bank_wire_amount}    ${amount}
    
Submit Bank Wire Request
    [Arguments]    ${currency}    ${amount}    ${wallet}=Exchange
    Select Curency Dropdown Item    ${currency}
    Input Bank Wire Deposit Amount    ${amount}
    Tap Element By Label    ${wallet}
    Click Visible Element    ${chk_agree_terms_condition}
    Click Visible Element    ${btn_deposit_next_button}

# CRYPTOCURRENCIES
Generate Invoice For LN-BTC
    [Arguments]    ${amount}
    Input Text Into Element    ${txt_amount_on_ln_btc_deposit}    ${amount}
    Tap Element By Label    Generate Invoice

Tap Close Icon On Choose Deposit Cryptocurrency
    Click Visible Element    ${btn_close_icon_deposits_choose_cryptocurrency}
    
# TETHER
Select Choose Tether Dropdown Item
    [Arguments]    ${tether}
    Click Visible Element    ${drd_choose_tether}
    Tap Element By Label    ${tether}

Select Choose Transport Dropdown Item
    [Arguments]    ${transport}
    Click Visible Element    ${drd_choose_transport}
    Tap Element By Label    ${transport}
    
Verify To Wallet Dropdown Disappears On Deposit
    Wait Element Disappear    ${drd_to_wallet_deposit}
    
Verify Deposit Screen Displays
    Wait Element Is Visible    ${drd_payment_type_deposit}
    
Verify Deposit Payment Card Fiat Currency
    ${mercuryo_element}    Generate Element From Dynamic Locator    ${lbl_fiat_by_payment_type}    Mercuryo
    Verify Element Text Should Be    ${mercuryo_element}    USD, EUR, GBP, RUB, JPY, TRY
    ${ownr_element}    Generate Element From Dynamic Locator    ${lbl_fiat_by_payment_type}    Ownr Wallet
    Verify Element Text Should Be    ${ownr_element}    USD, EUR, GBP, RUB
    ${simplex_element}    Generate Element From Dynamic Locator    ${lbl_fiat_by_payment_type}    Simplex
    Verify Element Text Should Be    ${simplex_element}    USD, EUR, GBP, JPY, TRY
    
Verify Currency Not Shown On Cryptocurrencies Dropdown
    [Arguments]    ${cryptocurrency}
    Click Visible Element    ${drd_cryptocurrency}
    Input Text To Textbox    ${cryptocurrency}
    Verify Label Not Display    ${cryptocurrency}