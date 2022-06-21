*** Settings ***
Resource    ../../resources/locators/android/bitfinex/trading_locators.robot
Resource    ../../../utility/common/list_common.robot

*** Keywords ***
Click Collapse Ticker
    [Arguments]    ${times_to_click}=1
    Click Visible Element    ${btn_collapse_tickers}    2s    ${times_to_click}
    
Verify Tickers Disappear
    Wait Element Disappear    ${txt_search_tickers}
    Wait Element Disappear    ${ddl_filter_tickers}
    Wait Element Disappear    ${btn_starred_tickers_icon}
    Wait Element Disappear    ${tab_all_tickers}
    
Tap Starred Icon
    Click Visible Element    ${btn_starred_tickers_icon}
    Sleep    1s
    
Select All Tab
    Click Visible Element    ${tab_all_tickers}
    
Click Tickers Table Column Header
    [Arguments]    ${header_name}
    ${locator_column_header}    Generate Element From Dynamic Locator    ${lbl_tickers_table_column_by_name}    ${header_name}
    Wait Element Is Visible    ${locator_column_header}    
    Click Visible Element    ${locator_column_header}
    
Search Ticker
    [Arguments]    ${ticker}
    Input Text Into Element    ${txt_search_tickers}    ${ticker}    delay=1s
    
Clear Ticker Search
    Click Visible Element    ${btn_clear_search_tickers}    1s    2
    
Access Trading Pair
    [Arguments]    ${pair}
    ${pair_locator}    Generate Element From Dynamic Locator    ${tbl_cell_ticker_by_name}    ${pair}
    Click Visible Element    ${pair_locator}

Tap Panel On Trading Pair
    [Arguments]    ${panel_name}    ${swipe}=${None}
    Run Keyword If    '${panel_name}'=='CHART'    Click Visible Element    ${pnl_chart_trading}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='ORDER'    Click Visible Element    ${pnl_order_trading}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='ORDER BOOK'    Click Visible Element    ${pnl_order_book_trading}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='POSITIONS'    Click Visible Element    ${pnl_positions_trading}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='ORDERS'    Click Visible Element    ${pnl_orders_trading}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='TRADES'    Click Visible Element    ${pnl_trades_trading}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='ORDER HISTORY'    Click Visible Element    ${pnl_order_history_trading}    swipe=${swipe}

Swipe To Panel
    [Arguments]    ${panel_name}    ${ratio}    ${swipe}=${None}
    Run Keyword If    '${panel_name}'=='CHART'    Swipe To Element    ${pnl_chart_trading}    ${ratio}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='ORDER'    Swipe To Element    ${pnl_order_trading}    ${ratio}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='ORDER BOOK'    Swipe To Element    ${pnl_order_book_trading}    ${ratio}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='POSITIONS'    Swipe To Element    ${pnl_positions_trading}    ${ratio}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='ORDERS'    Swipe To Element    ${pnl_orders_trading}    ${ratio}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='TRADES'    Swipe To Element    ${pnl_trades_trading}    ${ratio}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='ORDER HISTORY'    Swipe To Element    ${pnl_order_history_trading}    ${ratio}    swipe=${swipe}

Tap Trades Panel Tab
    [Arguments]    ${tab_name}
    Run Keyword If    '${tab_name}'=='Market'    Click Visible Element    ${btn_market_trades_panel_trading}
    ...    ELSE IF    '${tab_name}'=='Yours'    Click Visible Element    ${btn_yours_trades_panel_trading}
    Sleep    2s

Tap Full Book On Order Book Panel
    [Arguments]    ${locale}
    Import Resource    ${CURDIR}../../../resources/testdata/locale/${locale}/trading_pair_locale.robot
    ${full_book_element}    Generate Element From Dynamic Locator    ${lnk_full_book_orderbook_trading}    ${LOCALE_FULL_BOOK}
    Click Visible Element    ${full_book_element}

Tap Full Order History On Order History Panel
    [Arguments]    ${locale}
    Import Resource    ${CURDIR}../../../resources/testdata/locale/${locale}/trading_pair_locale.robot
    ${full_history_element}    Generate Element From Dynamic Locator    ${lnk_full_order_history_orderhistory_trading}    ${LOCALE_FULL_HISTORY}
    Click Visible Element    ${full_history_element}

Verify Tickers Table
    [Arguments]    @{tickers}
    FOR    ${ticker}    IN    @{tickers}
        ${ticker_element}    Generate Element From Dynamic Locator    ${tbl_cell_ticker_by_name}    ${ticker}
        Wait Element Is Visible    ${ticker_element}
    END
    
Verify Tickers Column Sorting
    [Arguments]    ${column_name}    ${sort}
    ${elements_text}    Run Keyword If    '${column_name}'=='last'    Get Elements Text    ${tbl_last_cells}
    ...    ELSE IF    '${column_name}'=='vol_usd'    Get Elements Text    ${tbl_vol_usd_cells}
    ${number_list}    Run Keyword If    '${column_name}'=='last' or '${column_name}'=='vol_usd'    Convert List Item To Number    ${elements_text}
    Run Keyword And Continue On Failure    Verify List Is Sorting    ${number_list}    ${sort}
    
Verify Order Book Panel Is Loaded
    [Arguments]    ${locale}
    Import Resource    ${CURDIR}../../../resources/testdata/locale/${locale}/trading_pair_locale.robot
    ${full_book_element}    Generate Element From Dynamic Locator    ${lnk_full_book_orderbook_trading}    ${LOCALE_FULL_BOOK}
    Swipe Down To Element    ${full_book_element}    ratio=0.25
    Wait Element Is Visible    ${full_book_element}
    
Verify Trades Panel Is Loaded
    [Arguments]    ${locale}
    Import Resource    ${CURDIR}../../../resources/testdata/locale/${locale}/trading_pair_locale.robot
    ${full_trade_element}    Generate Element From Dynamic Locator    ${lnk_full_trade_trades_trading}    ${LOCALE_FULL_TRADE}
    Swipe Down To Element    ${full_trade_element}    ratio=0.25
    Wait Element Is Visible    ${full_trade_element}

Verify Full Book Screen Displays
    Wait Element Is Visible    ${lbl_total_bids_full_book_trading}
    Sleep    5s
    
Verify Order History Panel Is Loaded
    [Arguments]    ${locale}
    Import Resource    ${CURDIR}../../../resources/testdata/locale/${locale}/trading_pair_locale.robot
    ${full_history_element}    Generate Element From Dynamic Locator    ${lnk_full_order_history_orderhistory_trading}    ${LOCALE_FULL_HISTORY}
    Swipe Down To Element    ${full_history_element}
    Wait Element Is Visible    ${full_history_element}
    
Verify Tickers Table Has No Data
    Wait Element Is Visible    ${lbl_no_tickers_found}
    
Verify Tickers
    Wait Element Is Visible    ${btn_collapse_tickers}
    Wait Element Is Visible    ${txt_search_tickers}
    Wait Element Is Visible    ${ddl_filter_tickers}
    Wait Element Is Visible    ${btn_starred_tickers_icon}
    Wait Element Is Visible    ${tab_all_tickers}