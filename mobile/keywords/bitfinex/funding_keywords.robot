*** Settings ***
Resource    ../../resources/locators/android/bitfinex/funding_locators.robot
Resource    ../../../utility/common/list_common.robot

*** Keywords ***
Clear Ticker Search On Funding
    Wait Element Is Visible    ${btn_clear_search_tickers_on_funding}
    Click Visible Element    ${btn_clear_search_tickers_on_funding}
    
Access Trading Pair On Funding
    [Arguments]    ${pair}    ${scroll}=${None}
    ${pair_locator}    Generate Element From Dynamic Locator    ${tbl_cell_ticker_on_funding_by_name}    ${pair}
    Scroll To Element    ${pair_locator}    ${scroll}
    Wait Element Is Visible    ${pair_locator}
    Click Visible Element    ${pair_locator}
    
Search Ticker On Funding
    [Arguments]    ${ticker}
    Wait Element Is Visible    ${txt_search_tickers_on_funding}
    Input Text Into Element    ${txt_search_tickers_on_funding}    ${ticker}
    
Tap On Column Header On Funding
    [Arguments]    ${column_name}
    ${column_element}    Generate Element From Dynamic Locator    ${col_header_tickers_table_on_funding_by_name}    ${column_name}
    Click Visible Element    ${column_element}

Tap On Bids And Offers Row
    [Arguments]    ${currency}
    ${currency_element}    Generate Element From Dynamic Locator    ${cel_currency_on_bids_and_offers}    ${currency}
    Click Visible Element    ${currency_element}
    
Verify Tickers Column Sorting On Funding
    [Arguments]    ${column_name}    ${sort}
    ${elements_text}    Run Keyword If    '${column_name}'=='name'    Get Elements Text    ${tbl_name_cells_on_funding}
    ...    ELSE IF    '${column_name}'=='last'    Get Elements Text    ${tbl_last_cells_on_funding}
    Run Keyword And Continue On Failure    Verify List Is Sorting    ${elements_text}    ${sort}
    
Verify Tickers Table On Funding
    [Arguments]    @{tickers}
    FOR    ${ticker}    IN    @{tickers}
        ${ticker_element}    Generate Element From Dynamic Locator    ${tbl_cell_ticker_on_funding_by_name}    ${ticker}
        Run Keyword And Continue On Failure    Wait Element Is Visible    ${ticker_element}
    END
    
# TODAY'S EARNINGS
Verify Today Earnings Equivalent
    [Arguments]    ${currency}    ${expected_value}
    ${value_element}    Generate Element From Dynamic Locator    ${cel_today_earnings_value_by_currency}    ${currency}
    Verify Element Text Contains    ${value_element}    ${expected_value}    