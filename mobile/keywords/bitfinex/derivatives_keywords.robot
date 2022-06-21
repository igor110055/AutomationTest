*** Settings ***
Resource    ../../resources/locators/android/bitfinex/derivatives_locators.robot
Resource    ../../../utility/common/locator_common.robot
Resource    ../../../utility/common/list_common.robot

Resource    ../common/mobile_common.robot
*** Keywords ***
Clear Ticker Search On Derivatives
    Wait Element Is Visible    ${btn_clear_search_tickers_on_derivatives}
    Click Visible Element    ${btn_clear_search_tickers_on_derivatives}
    
Access Trading Pair On Derivatives
    [Arguments]    ${pair}
    ${pair_locator}    Generate Element From Dynamic Locator    ${tbl_cell_ticker_on_derivatives_by_name}    ${pair}
    Wait Element Is Visible    ${pair_locator}
    Click Visible Element    ${pair_locator}
    
Search Ticker On Derivatives
    [Arguments]    ${ticker}
    Wait Element Is Visible    ${txt_search_tickers_on_derivatives}
    Input Text Into Element    ${txt_search_tickers_on_derivatives}    ${ticker}
    Sleep    2s

Verify Ticker Panel Displays On Derivatives
    Wait Element Is Visible    ${btn_collapse_tickers_on_derivatives}
    
Verify Tickers On Derivatives
    [Arguments]    ${expected_name}
    ${property_value}    Get Elements Property    ${tbl_cells_pair_name_on_derivatives}    content-desc
    FOR    ${property_value}    IN    @{property_value}
        Should Contain    ${property_value}    ${expected_name}
    END

Verify Tickers Column Sorting On Derivatives
    [Arguments]    ${column_name}    ${sort}
    ${elements_text}    Run Keyword If    '${column_name}'=='name'    Get Elements Text    ${tbl_name_cells_on_derivatives}
    ...    ELSE IF    '${column_name}'=='last'    Get Elements Text    ${tbl_last_cells_on_derivatives}
    Run Keyword And Continue On Failure    Verify List Is Sorting    ${elements_text}    ${sort}
    
Tap On Column Header On Derivatives
    [Arguments]    ${column_name}
    ${column_element}    Generate Element From Dynamic Locator    ${col_header_tickers_table_on_derivatives_by_name}    ${column_name}
    Click Visible Element    ${column_element}