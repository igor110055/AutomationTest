*** Settings ***
Resource    ../../resources/locators/android/bitfinex/reports_locators.robot

*** Keywords ***
# LEFT MENU NAVIGATION
Select Left Menu Item On Report
    [Arguments]    ${menu_item}    ${swipe}=${None}
    Run Keyword If    "${menu_item}"=="Ledgers"    Click Visible Element    ${mnu_ledgers_on_reports}    swipe=${swipe}
    ...    ELSE IF    "${menu_item}"=="Invoices"    Click Visible Element    ${mnu_invoices_on_reports}    swipe=${swipe}
    ...    ELSE IF    "${menu_item}"=="Trades"    Click Visible Element    ${mnu_trades_on_reports}    swipe=${swipe}
    ...    ELSE IF    "${menu_item}"=="Orders"    Click Visible Element    ${mnu_orders_on_reports}    swipe=${swipe}
    ...    ELSE IF    "${menu_item}"=="Movements"    Click Visible Element    ${mnu_movements_on_reports}    swipe=${swipe}
    ...    ELSE IF    "${menu_item}"=="Positions"    Click Visible Element    ${mnu_positions_on_reports}    swipe=${swipe}
    ...    ELSE IF    "${menu_item}"=="Wallets"    Click Visible Element    ${mnu_wallets_on_reports}    swipe=${swipe}
    ...    ELSE IF    "${menu_item}"=="Offers"    Click Visible Element    ${mnu_offers_on_reports}    swipe=${swipe}
    ...    ELSE IF    "${menu_item}"=="Loans"    Click Visible Element    ${mnu_loans_on_reports}    swipe=${swipe}
    ...    ELSE IF    "${menu_item}"=="Credits"    Click Visible Element    ${mnu_credits_on_reports}    swipe=${swipe}
    ...    ELSE IF    "${menu_item}"=="Payments"    Click Visible Element    ${mnu_payments_on_reports}    swipe=${swipe}
    ...    ELSE IF    "${menu_item}"=="Staking"    Click Visible Element    ${mnu_staking_on_reports}    swipe=${swipe}
    ...    ELSE IF    "${menu_item}"=="Affiliates"    Click Visible Element    ${mnu_affiliates_on_reports}    swipe=${swipe}
    ...    ELSE IF    "${menu_item}"=="Pub Trades"    Click Visible Element    ${mnu_pub_trades_on_reports}    swipe=${swipe}
    ...    ELSE IF    "${menu_item}"=="Pub Trades Funding"    Click Visible Element    ${mnu_pub_trades_funding_on_reports}    swipe=${swipe}
    ...    ELSE IF    "${menu_item}"=="Tickers"    Click Visible Element    ${mnu_tickers_on_reports}    swipe=${swipe}
    ...    ELSE IF    "${menu_item}"=="Derivatives"    Click Visible Element    ${mnu_derivatives_on_reports}    swipe=${swipe}
    ...    ELSE IF    "${menu_item}"=="Account Summary"    Click Visible Element    ${mnu_account_summary_on_reports}    swipe=${swipe}
    ...    ELSE IF    "${menu_item}"=="Logins"    Click Visible Element    ${mnu_logins_on_reports}    swipe=${swipe}
    ...    ELSE IF    "${menu_item}"=="Change Logs"    Click Visible Element    ${mnu_change_logs_on_reports}    swipe=${swipe}
    
Verify Reports Screen Displays
    Wait Element Is Visible    ${lbl_bitfinex_on_reports}	30s
    Wait Element Is Visible    ${lbl_account_summary_reports}	30s