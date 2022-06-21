*** Settings ***
Resource    ../../resources/locators/android/bitfinex/available_balances_locators.robot

*** Keywords ***
Verify Available Balances
    ${currency_element}    Generate Element From Dynamic Locator    ${lbl_column_header_by_name_on_available_balances}    CURRENCY
    Wait Element Is Visible    ${currency_element}
    ${name_element}    Generate Element From Dynamic Locator    ${lbl_column_header_by_name_on_available_balances}    NAME
    Wait Element Is Visible    ${name_element}
    ${margin_wallet_element}    Generate Element From Dynamic Locator    ${lbl_column_header_by_name_on_available_balances}    MARGIN WALLET
    Wait Element Is Visible    ${margin_wallet_element}
    
Fetch Margin Balance By Currency
    [Arguments]    ${currency}
    ${cel_margin_wallet_element}    Generate Element From Dynamic Locator    ${cel_margin_wallet_by_currency_on_available_balances}    ${currency}
    ${MARGIN_BALANCE}    Get Element Text    ${cel_margin_wallet_element}
    Set Suite Variable    ${MARGIN_BALANCE}