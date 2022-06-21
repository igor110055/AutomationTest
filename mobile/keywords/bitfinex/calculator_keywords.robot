*** Settings ***
Resource    ../../resources/locators/android/bitfinex/calculator_locators.robot

*** Keywords ***
Input Calculator Fields
    [Arguments]    ${trade_type}=LONG    ${entry_price}=${None}    ${exit_price}=${None}    ${amount_base}=${None}    ${amount_quote}=${None}
    Run Keyword If    "${trade_type}"=="LONG"    Click Visible Element    ${rdo_long_calculator}
    ...    ELSE    Click Visible Element    ${rdo_short_calculator}
    Run Keyword If    "${entry_price}"!="${None}"    Input Text Into Element    ${txt_entry_price_calculator}    ${entry_price}    clear_text=${True}
    Run Keyword If    "${exit_price}"!="${None}"    Input Text Into Element    ${txt_exit_price_calculator}    ${exit_price}    clear_text=${True}
    Run Keyword If    "${amount_base}"!="${None}"    Input Text Into Element    ${txt_amount_base_calculator}    ${amount_base}    clear_text=${True}
    Run Keyword If    "${amount_quote}"!="${None}"    Input Text Into Element    ${txt_amount_quote_calculator}    ${amount_quote}    clear_text=${True}
    
Verify Calculator Screen Displays
    Wait Element Is Visible    ${txt_calculator_description}
    Verify Element Text Should Be    ${txt_amount_pro_version}    ${EMPTY}
    Verify Element Text Should Be    ${txt_entry_price_pro_version}    ${EMPTY}
    Verify Element Text Should Be    ${txt_entry_val_pro_version}    ${EMPTY}
    Verify Element Text Should Be    ${txt_exit_price_pro_version}    ${EMPTY}
    Verify Element Text Should Be    ${txt_exit_val_pro_version}    ${EMPTY}
    Verify Element Text Should Be    ${txt_exit_pnl_pro_version}    ${EMPTY}
    Verify Element Text Should Be    ${txt_exit_pnl_percentage_pro_version}    ${EMPTY}
    Verify Element Text Should Be    ${txt_stop_price_pro_version}    ${EMPTY}
    Verify Element Text Should Be    ${txt_stop_val_pro_version}    ${EMPTY}
    Verify Element Text Should Be    ${txt_stop_pnl_pro_version}    ${EMPTY}
    Verify Element Text Should Be    ${txt_stop_pnl_percentage_pro_version}    ${EMPTY}

Verify Lite Calculator
    Verify Element Text Should Be    ${txt_entry_price_calculator}    ${EMPTY}
    Verify Element Text Should Be    ${txt_exit_price_calculator}    ${EMPTY}
    Verify Element Text Should Be    ${txt_amount_base_calculator}    ${EMPTY}
    Verify Element Text Should Be    ${txt_amount_quote_calculator}    ${EMPTY}

Verify Profit Loss Values
    [Arguments]    ${profit_loss_usd}    ${profit_loss_percent}
    Verify Element Text Should Be    ${lbl_profit_loss_usd}    ${profit_loss_usd}
    Verify Element Text Should Be    ${lbl_profit_loss_percent}    ${profit_loss_percent}
    
Verify Amount Quote Value
    [Arguments]    ${expected_amount_quote}
    Verify Element Text Should Be    ${txt_amount_quote_calculator}    ${expected_amount_quote}