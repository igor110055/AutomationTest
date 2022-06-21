*** Variables ***
${btn_volume_on_chart}    xpath=//android.view.View[@text='Volume']
${btn_exchange_buy_on_order_form_trading}    accessibility_id=order_buy_button
${btn_exchange_sell_on_order_form_trading}    accessibility_id=order_sell_button
${drd_order_type_on_order_form_trading}    accessibility_id=order_form_type_picker
${btn_max_buy_on_order_form_trading}    accessibility_id=max_buy_btn
${btn_max_sell_on_order_form_trading}    accessibility_id=max_sell_btn

# TICKER panel
${btn_i_icon_ticker}    accessibility_id=tickers_crypto_info_icon
${btn_doc_icon_ticker}    accessibility_id=securities_or_santiment_data

# CHART
${btn_refresh_chart}    xpath=//android.view.ViewGroup[@content-desc="charts_collapsible"]/android.view.ViewGroup[2]
${drd_indicator_chart}    xpath=//android.view.View[@resource-id="header-toolbar-indicators"]
${drd_styles_chart}    xpath=//android.view.View[@resource-id="header-toolbar-chart-styles"]
${drd_intervals_chart}    xpath=//android.view.View[@resource-id="header-toolbar-intervals"]
${btn_share_snapshot_chart}    xpath=//android.view.ViewGroup[@content-desc="charts_collapsible"]/android.view.ViewGroup[4]

# ORDER panel
${btn_max_bid_on_order_form_trading}    accessibility_id=max_bid_btn
${btn_min_ask_on_order_form_trading}    accessibility_id=min_ask_btn
${btn_max_bid_limit_on_order_form_trading}    accessibility_id=max_bid_limit_btn
${btn_min_ask_limit_on_order_form_trading}    accessibility_id=min_ask_limit_btn
${rdo_buy_order_form_lite}    xpath=//android.widget.TextView[@text="BUY"]
${rdo_sell_order_form_lite}    xpath=//android.widget.TextView[@text="SELL"]
${txt_percentage_order_form}    accessibility_id=order_form_slider_step_input

${btn_top_bid_on_order_form_trading}    accessibility_id=top_bid_btn
${btn_top_ask_on_order_form_trading}    accessibility_id=top_ask_btn
${lbl_top_bid_on_order_form_trading}    xpath=//android.view.ViewGroup[@content-desc="top_bid_btn"]/android.widget.TextView
${lbl_top_ask_on_order_form_trading}    xpath=//android.view.ViewGroup[@content-desc="top_ask_btn"]/android.widget.TextView

${txt_order_amount_on_order_form_trading}    accessibility_id=order_form_amount_input
${txt_order_price_on_order_form_trading}    accessibility_id=order_form_price_input
${txt_oco_stop_price_on_order_form_trading}    accessibility_id=order_form_stop_input
${txt_limit_price_on_order_form_trading}    accessibility_id=order_form_price_aux_limit_input
${txt_price_lower_on_order_form_trading}    accessibility_id=order_form_price_lower_input
${txt_price_upper_on_order_form_trading}    accessibility_id=order_form_price_upper_input
${txt_amount_on_order_form_trading}    accessibility_id=order_form_amount_input
${txt_order_count_on_order_form_trading}    accessibility_id=order_form_count_input
${txt_amount_variance_on_order_form_trading}    accessibility_id=order_form_variance_input
${txt_price_variance_on_order_form_trading}    accessibility_id=order_form_price_input
${txt_balance_slider_order_form_lite}    accessibility_id=order_form_lite_balance_slider_step_input
${btn_preview_buy_order_form_lite}    accessibility_id=order_form_lite_preview_buy
${btn_preview_sell_order_form_lite}    accessibility_id=order_form_lite_preview_sell

${btn_confirm_on_confirm_order_popup}    xpath=//android.widget.TextView[@text='Confirm']
${chk_reduce_only_on_order_form_trading}    accessibility_id=reduceonly_checkbox
${chk_oco_on_order_form_trading}    accessibility_id=oco_checkbox
${chk_hidden_on_order_form_trading}    accessibility_id=hidden_checkbox
${chk_postonly_on_order_form_trading}    accessibility_id=postonly_checkbox
${chk_tif_on_order_form_trading}    //android.widget.TextView[@text='TIF']
${tab_account_summary_order}    accessibility_id=order_form_specs_tab
${tab_exchange_order}    accessibility_id=order_form_exchange_tab
${tab_margin_order}    accessibility_id=order_form_margin_tab
${tab_calculator_order}    accessibility_id=order_form_calculator
${lnk_collateral_info}    xpath=//android.widget.TextView[@text='Collateral Info']

${lbl_price_warning_message_warning_popup}    xpath=//android.widget.TextView[contains(@text,'ticker price')]
${btn_no_warning_popup}    xpath=//android.widget.TextView[@text='No']

# ORDERS panel
${btn_cancel_all_orders_orders_panel}    xpath=//android.widget.TextView[contains(@text,'Cancel') and contains(@text,'orders')]
${lbl_no_orders_found_orders_panel}    xpath=//android.widget.TextView[@text='No orders found']
${lbl_order_confirm_or_warning_popups}    xpath=//android.widget.TextView[contains(@text,'Confirm Order') or contains(@text,'Are you sure')]

#DYNAMIC
${rdo_order_type_by_label}    xpath=//android.widget.TextView[@text='_DYNAMIC_0']
${tab_exchange_margin}    xpath=//android.widget.TextView[@text='_DYNAMIC_0']
${lbl_indicator_by_name}    xpath=//android.view.View[@text='_DYNAMIC_0']

# TICKER
${lbl_ticker_information}    xpath=//android.view.View[@text="_DYNAMIC_0"]

# ORDERS
${cel_on_orders_by_value_on_trading}    xpath=//android.view.ViewGroup[@content-desc="orders_collapsible"]//following-sibling::android.widget.HorizontalScrollView//android.widget.TextView[@text='_DYNAMIC_0']