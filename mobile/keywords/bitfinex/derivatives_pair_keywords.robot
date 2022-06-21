*** Settings ***
Resource    ../../resources/locators/android/bitfinex/derivatives_pair_locators.robot
Resource    ../../../utility/common/locator_common.robot
Resource    ../../../utility/common/number_common.robot

Resource    ../common/mobile_common.robot
*** Keywords ***
Tap Orders Panel Record By Value
    [Arguments]    ${value}
    ${element_value}    Generate Element From Dynamic Locator    ${cel_on_orders_by_value}    ${value}
    Click Visible Element    ${element_value}

Tap Positions Panel Record By Value
    [Arguments]    ${value}
    ${element_value}    Generate Element From Dynamic Locator    ${cel_on_positions_by_value}    ${value}
    Click Visible Element    ${element_value}
    
Tap Panel On Derivatives Pair
    [Arguments]    ${panel_name}    ${swipe}=${None}
    Run Keyword If    '${panel_name}'=='CHART'    Click Visible Element    ${pnl_chart_derivatives}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='ORDER'    Click Visible Element    ${pnl_order_derivatives}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='ORDER BOOK'    Click Visible Element    ${pnl_order_book_derivatives}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='POSITIONS'    Click Visible Element    ${pnl_positions_derivatives}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='ORDERS'    Click Visible Element    ${pnl_orders_derivatives}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='TRADES'    Click Visible Element    ${pnl_trades_derivatives}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='ORDER HISTORY'    Click Visible Element    ${pnl_order_history_derivatives}    swipe=${swipe}

Tap Trades Panel Tab On Derivatives Pair
    [Arguments]    ${tab_name}
    Run Keyword If    '${tab_name}'=='Market'    Click Visible Element    ${btn_market_trades_panel_derivatives}
    ...    ELSE IF    '${tab_name}'=='Yours'    Click Visible Element    ${btn_yours_trades_panel_derivatives}
    Sleep    2s

Tap Full Book Order Book Panel on Derivatives
    [Arguments]    ${locale}
    Import Resource    ${CURDIR}../../../resources/testdata/locale/${locale}/derivative_pair_locale.robot
    ${full_book_element}    Generate Element From Dynamic Locator    ${lnk_full_book_orderbook_derivatives}    ${LOCALE_FULL_BOOK}
    Click Visible Element    ${full_book_element}

Scroll To Panel On Derivative Pair
    [Arguments]    ${panel_name}    ${ratio}    ${swipe}=${None}    ${start_x}=${None}
    Run Keyword If    '${panel_name}'=='ORDER'    Swipe To Element    ${pnl_order_derivatives}    ${ratio}    ${swipe}    start_x=${start_x}
    ...    ELSE IF    '${panel_name}'=='ORDER BOOK'    Swipe To Element    ${pnl_order_book_derivatives}    ${ratio}    ${swipe}    start_x=${start_x}
    ...    ELSE IF    '${panel_name}'=='POSITIONS'    Swipe To Element    ${pnl_positions_derivatives}    ${ratio}    ${swipe}    start_x=${start_x}
    ...    ELSE IF    '${panel_name}'=='ORDERS'    Swipe To Element    ${pnl_orders_derivatives}    ${ratio}    ${swipe}    start_x=${start_x}
    ...    ELSE IF    '${panel_name}'=='TRADES'    Swipe To Element    ${pnl_trades_derivatives}    ${ratio}    ${swipe}    start_x=${start_x}
    ...    ELSE IF    '${panel_name}'=='ORDER HISTORY'    Swipe To Element    ${pnl_order_history_derivatives}    ${ratio}    ${swipe}    start_x=${start_x}

Select Order Type On Derivatives
    [Arguments]    ${order_type}
    Click Visible Element    ${drd_order_type_on_order_form_derivatives}
    ${rdo_order_type}    Generate Element From Dynamic Locator    ${rdo_order_type_by_label_derivatives}    ${order_type}
    Click Visible Element    ${rdo_order_type}    delay=1s
    Sleep    1s

Create Market Order On Derivatives
    [Arguments]    ${amount}    ${transaction_type}
    Clear Element Text    ${txt_order_amount_on_order_form_derivatives}
    Input Text Into Element    ${txt_order_amount_on_order_form_derivatives}    ${amount}    ${True}
    Confirm Order On Derivatives    ${transaction_type}
    Sleep    1s

Confirm Order On Derivatives
    [Arguments]    ${transaction_type}
    Run Keyword If    '${transaction_type}'=='buy'    Click Visible Element    ${btn_exchange_buy_on_order_form_derivatives}
    ...    ELSE    Click Visible Element    ${btn_exchange_sell_on_order_form_derivatives}
    Click Visible Element    ${btn_confirm_on_confirm_order_popup_derivatives}
    Sleep    1s

Create Limit Order Derivatives
    [Arguments]    ${price}    ${amount}    ${transaction_type}    ${oco}=${False}    ${oco_stop_price}=${None}
    ...    ${hidden}=${False}    ${post_only}=${False}    ${tif}=${False} 
    Run Keyword If    ${oco}==${True}    Click Visible Element    ${chk_oco_on_order_form_derivatives}
    Run Keyword If    ${hidden}==${True}    Click Visible Element    ${chk_hidden_on_order_form_derivatives}
    Run Keyword If    ${post_only}==${True}    Click Visible Element    ${chk_postonly_on_order_form_derivatives}
    Run Keyword If    ${tif}==${True}    Click Visible Element    ${chk_tif_on_order_form_derivatives}
    # Run Keyword If    ${reduce_only}==${True}    Click Visible Element    ${chk_reduce_only_on_order_form_trading}
    Clear Element Text    ${txt_order_amount_on_order_form_derivatives}
    Input Order Price Derivatives    ${price}
    Input Order Amount Derivatives    ${amount}
    Run Keyword If    ${oco}==${True}    Input Text Into Element    ${txt_oco_stop_price_on_order_form_derivatives}    ${oco_stop_price}
    Confirm Order On Derivatives    ${transaction_type}
    Sleep    1s        

Input Order Price Derivatives
    [Arguments]    ${price}=max_bid
    Run Keyword If    '${price}'=='max_bid'    Click Visible Element    ${btn_max_bid_on_order_form_derivatives}
    ...    ELSE IF    '${price}'=='min_ask'    Click Visible Element    ${btn_min_ask_on_order_form_derivatives}
    ...    ELSE    Input Text Into Element    ${txt_order_price_on_order_form_derivatives}    ${price}    clear_text=${True}
    
Input Order Amount Derivatives
    [Arguments]    ${amount}=max_buy
    Run Keyword If    '${amount}'=='max_buy'    Click Visible Element    ${btn_max_buy_on_order_form_derivatives}
    ...    ELSE IF    '${amount}'=='max_sell'    Click Visible Element    ${btn_max_sell_on_order_form_derivatives}
    ...    ELSE    Input Text Into Element    ${txt_order_amount_on_order_form_derivatives}    ${amount}    clear_text=${True}

Cancel All Orders Derivatives
    Click Visible Element    ${btn_cancel_all_orders_orders_panel_derivatives}    swipe=DOWN    start_x=1
    Wait Element Is Visible    ${lbl_no_orders_found_orders_panel_derivatives}    

Select Order Form Tab Derivatives
    [Arguments]    ${tab_name}
    Run Keyword If    '${tab_name}'=='Derivatives'    Click Visible Element    ${tab_derivatives_orders_derivatives}
    ...    ELSE IF    '${tab_name}'=='Account Summary'    Click Visible Element    ${tab_account_summary_orders_derivatives}
    ...    ELSE IF    '${tab_name}'=='Calculator'    Click Visible Element    ${tab_calculator_orders_derivatives}

Tap Highest Bid On Derivatives
    Click Visible Element    ${btn_max_bid_on_order_form_derivatives}

Tap Lowest Ask On Derivatives
    Click Visible Element    ${btn_min_ask_on_order_form_derivatives}

Tap Top Ask On Derivatives
    Click Visible Element    ${btn_top_ask_on_order_form_derivatives}
    
Tap Top Bid On Derivatives
    Click Visible Element    ${btn_top_bid_on_order_form_derivatives}

Tap Max Buy On Derivatives
    Click Visible Element    ${btn_max_buy_on_order_form_derivatives}
    
Tap Max Sell On Derivatives
    Click Visible Element    ${btn_max_sell_on_order_form_derivatives}
    
Verify Highest Bid Populated On Derivatives
    ${amount_highest_bid}    Get Element Text    ${txt_order_price_on_order_form_derivatives}
    ${amount_highest_bid}    Extract Number From String    ${amount_highest_bid}
    ${amount_top_bid}    Get Element Text    ${btn_top_bid_on_order_form_derivatives}
    ${amount_top_bid}    Split String    ${amount_top_bid}    ${SPACE}
    ${amount_top_bid}    Extract Number From String    ${amount_top_bid}[0]
    Should Be Equal    ${amount_highest_bid}    ${amount_top_bid}

Verify Lowest Ask Populated On Derivatives
    ${amount_lowest_ask}    Get Element Text    ${txt_order_price_on_order_form_derivatives}
    ${amount_lowest_ask}    Extract Number From String    ${amount_lowest_ask}
    ${amount_top_ask}    Get Element Text    ${btn_top_ask_on_order_form_derivatives}
    ${amount_top_ask}    Split String    ${amount_top_ask}    ${SPACE}
    ${amount_top_ask}    Extract Number From String    ${amount_top_ask}[0]
    Should Be Equal    ${amount_lowest_ask}    ${amount_top_ask}

Verify Max Buy Populated On Derivatives
    ${amount_max_buy}    Get Element Text    ${txt_order_amount_on_order_form_derivatives}
    Should Not Be Empty    ${amount_max_buy}

Verify Max Sell Populated On Derivatives
    ${amount_max_sell}    Get Element Text    ${txt_order_amount_on_order_form_derivatives}
    Should Not Be Empty    ${amount_max_sell}

Verify Order Book Panel On Derivatives Is Loaded
    [Arguments]    ${locale}
    Import Resource    ${CURDIR}../../../resources/testdata/locale/${locale}/derivative_pair_locale.robot    
    ${full_book_element}    Generate Element From Dynamic Locator    ${lnk_full_book_orderbook_derivatives}    ${LOCALE_FULL_BOOK}
    Swipe Down To Element    ${full_book_element}    ratio=0.25
    Wait Element Is Visible    ${full_book_element}
    
Verify Trades Panel On Derivatives Is Loaded
    [Arguments]    ${locale}
    Import Resource    ${CURDIR}../../../resources/testdata/locale/${locale}/derivative_pair_locale.robot
    ${full_trade_element}    Generate Element From Dynamic Locator    ${lnk_full_trade_trades_derivatives}    ${LOCALE_FULL_TRADE}
    Swipe Down To Element    ${full_trade_element}    ratio=0.25
    Wait Element Is Visible    ${full_trade_element}
    
Verify Full Book Screen Displays On Derivatives
    Wait Element Is Visible    ${lbl_total_bids_full_book_derivatives}
    Sleep    5s
    
Verify Chart Loading Success On Derivatives
    [Arguments]    ${expected_load_time}
    Sleep	2s
    ${indicator_element}    Generate Element From Dynamic Locator    ${lbl_indicator_by_name_on_derivatives}    Balance of Power
    Wait Element Is Visible    ${indicator_element}    ${expected_load_time}
    ${average_indicator_element}    Generate Element From Dynamic Locator    ${lbl_indicator_by_name_on_derivatives}    Average Price
    Wait Element Is Visible    ${average_indicator_element}    ${expected_load_time}
    Wait Element Is Visible    ${btn_volume_on_chart_on_derivatives}    ${expected_load_time}