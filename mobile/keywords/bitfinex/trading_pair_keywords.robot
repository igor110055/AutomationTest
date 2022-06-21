*** Settings ***
Resource    ../../resources/locators/android/bitfinex/trading_pair_locators.robot
Resource    ../../../utility/common/string_common.robot
Resource    ../../../utility/common/number_common.robot

Resource    common_keywords.robot
*** Keywords ***
Tap I Icon On Ticker
    Click Visible Element    ${btn_i_icon_ticker}

# CHART
Select Indicator
    [Arguments]    ${indicator}
    Click Visible Element    ${drd_indicator_chart}
    Tap Element By Label    ${indicator}

Select Chart Style
    Click Visible Element    ${drd_styles_chart}
    Send Key    0
    Send Key    0
    Send Key    66

Select Chart Interval
    Click Visible Element    ${drd_intervals_chart}
    Send Key    0
    Send Key    0
    Send Key    66
        
Tap Refresh Chart Button
    Click Visible Element    ${btn_refresh_chart}    delay=2s
    Sleep    3s

Tap Share Snapshot Button
    Click Visible Element    ${btn_share_snapshot_chart}
        
Select Order Type
    [Arguments]    ${order_type}
    Click Visible Element    ${drd_order_type_on_order_form_trading}
    ${rdo_order_type}    Generate Element From Dynamic Locator    ${rdo_order_type_by_label}    ${order_type}
    Click Visible Element    ${rdo_order_type}    delay=2s

Tap Orders Panel Record By Value On Trading Pair
    [Arguments]    ${value}
    ${element_value}    Generate Element From Dynamic Locator    ${cel_on_orders_by_value_on_trading}    ${value}
    Click Visible Element    ${element_value}

Cancel All Orders
    Click Visible Element    ${btn_cancel_all_orders_orders_panel}    swipe=DOWN
    Wait Element Is Visible    ${lbl_no_orders_found_orders_panel}
    
Confirm Order
    [Arguments]    ${transaction_type}    ${confirm}=${True}
    Run Keyword If    '${transaction_type}'=='buy'    Click Visible Element    ${btn_exchange_buy_on_order_form_trading}	swipe=DOWN
    ...    ELSE    Click Visible Element    ${btn_exchange_sell_on_order_form_trading}    swipe=DOWN
    Run Keyword If    ${confirm}==${True}    Click Visible Element    ${btn_confirm_on_confirm_order_popup}
    Sleep    1s

Select Order Form Tab
    [Arguments]    ${tab_name}
    Run Keyword If    '${tab_name}'=='Account Summary'    Click Visible Element    ${tab_account_summary_order}
    ...    ELSE IF    '${tab_name}'=='Exchange'    Click Visible Element    ${tab_exchange_order}
    ...    ELSE IF    '${tab_name}'=='Margin'    Click Visible Element    ${tab_margin_order}
    ...    ELSE IF    '${tab_name}'=='Calculator'    Click Visible Element    ${tab_calculator_order}
    
Input Order Price
    [Arguments]    ${price}=max_bid
    Run Keyword If    '${price}'=='max_bid'    Click Visible Element    ${btn_max_bid_on_order_form_trading}
    ...    ELSE IF    '${price}'=='min_ask'    Click Visible Element    ${btn_min_ask_on_order_form_trading}
    ...    ELSE    Input Text Into Element    ${txt_order_price_on_order_form_trading}    ${price}    clear_text=${True}
    
Input Order Amount
    [Arguments]    ${amount}=max_buy
    Run Keyword If    '${amount}'=='max_buy'    Click Visible Element    ${btn_max_buy_on_order_form_trading}
    ...    ELSE IF    '${amount}'=='max_sell'    Click Visible Element    ${btn_max_sell_on_order_form_trading}
    ...    ELSE    Input Text Into Element    ${txt_order_amount_on_order_form_trading}    ${amount}    clear_text=${True}

Input Limit Price
    [Arguments]    ${amount}=max_buy
    Run Keyword If    '${amount}'=='max_buy'    Click Visible Element    ${btn_max_bid_limit_on_order_form_trading}
    ...    ELSE IF    '${amount}'=='max_sell'    Click Visible Element    ${btn_min_ask_limit_on_order_form_trading}
    ...    ELSE    Input Text Into Element    ${txt_limit_price_on_order_form_trading}    ${amount}    clear_text=${True}

# ORDER FORM
Create Limit Order
    [Arguments]    ${price}    ${amount}    ${transaction_type}=${None}    ${oco}=${False}    ${oco_stop_price}=${None}
    ...    ${hidden}=${False}    ${post_only}=${False}    ${tif}=${False} 
    Run Keyword If    ${oco}==${True}    Click Visible Element    ${chk_oco_on_order_form_trading}
    Run Keyword If    ${hidden}==${True}    Click Visible Element    ${chk_hidden_on_order_form_trading}
    Run Keyword If    ${post_only}==${True}    Click Visible Element    ${chk_postonly_on_order_form_trading}
    Run Keyword If    ${tif}==${True}    Click Visible Element    ${chk_tif_on_order_form_trading}
    # Run Keyword If    ${reduce_only}==${True}    Click Visible Element    ${chk_reduce_only_on_order_form_trading}
    Input Order Price    ${price}
    Input Order Amount    ${amount}
    Run Keyword If    ${oco}==${True}    Input Text Into Element    ${txt_oco_stop_price_on_order_form_trading}    ${oco_stop_price}
    Run Keyword If    "${transaction_type}"!="${None}"    Confirm Order    ${transaction_type}
    Sleep    1s

Create Market Order
    [Arguments]    ${amount}    ${transaction_type}=${None}    ${reduce_only}=${False}
    Input Text Into Element    ${txt_order_amount_on_order_form_trading}    ${amount}    ${True}    clear_text=${True}
    Run Keyword If    '${reduce_only}'=='${True}'    Click Visible Element    ${chk_reduce_only_on_order_form_trading}
    Run Keyword If    "${transaction_type}"!="${None}"    Confirm Order    ${transaction_type}    
    Sleep    1s

Create Stop Limit Order
    [Arguments]    ${stop_price}    ${limit_price}    ${amount}    ${transaction_type}=${None}    ${confirm}=${True}
    ...    ${hidden}=${False}    ${tif}=${False}
    Run Keyword If    ${hidden}==${True}    Click Visible Element    ${chk_hidden_on_order_form_trading}
    Run Keyword If    ${tif}==${True}    Click Visible Element    ${chk_tif_on_order_form_trading}
    Input Order Price    ${stop_price}
    Input Order Amount    ${amount}
    Input Limit Price    ${limit_price}
    Run Keyword If    "${transaction_type}"!="${None}"    Confirm Order    ${transaction_type}    ${confirm}
    Sleep    1s  

Create Stop Order
    [Arguments]    ${stop_price}    ${amount}    ${transaction_type}=${None}    ${confirm}=${True}
    ...    ${tif}=${False}
    Run Keyword If    ${tif}==${True}    Click Visible Element    ${chk_tif_on_order_form_trading}
    Input Order Price    ${stop_price}
    Input Order Amount    ${amount}
    Run Keyword If    "${transaction_type}"!="${None}"    Confirm Order    ${transaction_type}    ${confirm}
    Sleep    1s

Create Trailing Stop Order
    [Arguments]    ${distance}    ${amount}    ${transaction_type}=${None}
    ...    ${tif}=${False}
    Run Keyword If    ${tif}==${True}    Click Visible Element    ${chk_tif_on_order_form_trading}
    Input Order Price    ${distance}
    Input Order Amount    ${amount}
    Run Keyword If    "${transaction_type}"!="${None}"    Confirm Order    ${transaction_type}
    Sleep    1s
    
Create Fill Or Kill Order
    [Arguments]    ${price}    ${amount}    ${transaction_type}=${None}    ${confirm}=${True}
    Input Order Price    ${price}
    Input Order Amount    ${amount}
    Run Keyword If    "${transaction_type}"!="${None}"    Confirm Order    ${transaction_type}    ${confirm}
    Sleep    1s

Create Immediate Or Cancel Order
    [Arguments]    ${price}    ${amount}    ${transaction_type}=${None}    ${confirm}=${True}
    Input Order Price    ${price}
    Input Order Amount    ${amount}
    Run Keyword If    "${transaction_type}"!="${None}"    Confirm Order    ${transaction_type}    ${confirm}
    Sleep    1s

Verify Buy And Sell Buttons Are Disabled
    Click Visible Element    ${btn_exchange_buy_on_order_form_trading}
    Verify Label Contain Text Not Display    Confirm Order    Are you sure
    Click Visible Element    ${btn_exchange_sell_on_order_form_trading}
    Verify Label Contain Text Not Display    Confirm Order    Are you sure

# LITE MODE
Create Market Order In Lite Mode
    [Arguments]    ${base_amount}=${None}    ${quote_amount}=${None}    ${transaction_type}=BUY    ${balance_percentage}=${None}
    Run Keyword If    "${transaction_type}"=="BUY"    Click Visible Element    ${rdo_buy_order_form_lite}
    ...    ELSE    Click Visible Element    ${rdo_sell_order_form_lite}
    Run Keyword If    "${base_amount}"!="${None}"    Input Order Price    ${base_amount}
    Run Keyword If    "${quote_amount}"!="${None}"    Input Order Amount    ${quote_amount}
    Run Keyword If    "${balance_percentage}"!="${None}"    Input Text Into Element    ${txt_balance_slider_order_form_lite}    ${balance_percentage}
    Run Keyword If    "${transaction_type}"=="BUY"    Click Visible Element    ${btn_preview_buy_order_form_lite}    swipe=DOWN
    ...    ELSE    Click Visible Element    ${btn_preview_sell_order_form_lite}    swipe=DOWN
    Click Visible Element    ${btn_confirm_on_confirm_order_popup}
    Sleep    1s

Verify Percentage Textbox
    [Arguments]    ${expected_value}
    Verify Element Text Should Be    ${txt_percentage_order_form}    ${expected_value}
        
Tap Highest Bid Button
    Click Visible Element    ${btn_max_bid_on_order_form_trading}    0.5

Tap Lowest Ask Button
    Click Visible Element    ${btn_min_ask_on_order_form_trading}    0.5
    
Tap Top Bid Button
    Click Visible Element    ${btn_top_bid_on_order_form_trading}    0.5
    
Tap Top Ask Button
    Click Visible Element    ${btn_top_ask_on_order_form_trading}    0.5

Tap Max Buy Button
    Click Visible Element    ${btn_max_buy_on_order_form_trading}    0.5
    
Tap Max Sell Button
    Click Visible Element    ${btn_max_sell_on_order_form_trading}    0.5

Tap Doc Icon On Ticker
    Click Visible Element    ${btn_doc_icon_ticker}
            
Verify Highest Bid Populated
    ${amount_highest_bid}    Get Element Text    ${txt_order_price_on_order_form_trading}
    ${amount_highest_bid}    Extract Number From String    ${amount_highest_bid}
    ${amount_top_bid}    Get Element Text    ${lbl_top_bid_on_order_form_trading}
    ${amount_top_bid}    Extract Number From String    ${amount_top_bid}
    Should Be Equal    ${amount_highest_bid}    ${amount_top_bid}

Verify Lowest Ask Populated
    ${amount_lowest_ask}    Get Element Text    ${txt_order_price_on_order_form_trading}
    ${amount_lowest_ask}    Extract Number From String    ${amount_lowest_ask}
    ${amount_top_ask}    Get Element Text    ${lbl_top_ask_on_order_form_trading}
    ${amount_top_ask}    Extract Number From String    ${amount_top_ask}
    Should Be Equal    ${amount_lowest_ask}    ${amount_top_ask}

Verify Max Buy Populated
    ${amount_max_buy}    Get Element Text    ${txt_order_amount_on_order_form_trading}
    Should Not Be Empty    ${amount_max_buy}

Verify Max Sell Populated
    ${amount_max_sell}    Get Element Text    ${txt_order_amount_on_order_form_trading}
    Should Not Be Empty    ${amount_max_sell}
    
Clear Order Amount
    Clear Element Text    ${txt_order_amount_on_order_form_trading}

Verify Chart Loading Success
    [Arguments]    ${expected_load_time}
    Sleep	2s
    ${indicator_element}    Generate Element From Dynamic Locator    ${lbl_indicator_by_name}    Balance of Power
    Wait Element Is Visible    ${indicator_element}    ${expected_load_time}
    ${average_indicator_element}    Generate Element From Dynamic Locator    ${lbl_indicator_by_name}    Average Price
    Wait Element Is Visible    ${average_indicator_element}    ${expected_load_time}
    Wait Element Is Visible    ${btn_volume_on_chart}    ${expected_load_time}
    
Verify Price Warning Popup
    [Arguments]    ${dismiss}=${True}
    Wait Element Is Visible    ${lbl_price_warning_message_warning_popup}
    Run Keyword If    ${dismiss}==${True}    Click Visible Element    ${btn_no_warning_popup}
    
Verify Ticker Information Screen Displays
    [Arguments]    ${ticker}
    ${ticker_title}    Generate Element From Dynamic Locator    ${lbl_ticker_information}    ${ticker}
    Wait Element Is Visible    ${ticker_title}
    
Verify No Orders Found On Orders Panel
    Swipe Down To Element    ${lbl_no_orders_found_orders_panel}
    Wait Element Is Visible    ${lbl_no_orders_found_orders_panel}
    
Verify Screen Title Displays With Last Price
    [Arguments]    ${pair}
    ${label}    Get Text Element Contains Label    ${pair}
    Should Match Regexp    ${label}    ${pair} \\d+
    