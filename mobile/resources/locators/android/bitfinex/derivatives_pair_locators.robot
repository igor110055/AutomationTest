*** Variables ***
${btn_volume_on_chart_on_derivatives}    xpath=//android.view.View[@text='Volume']

# CHART panel
${pnl_chart_derivatives}    accessibility_id=charts_collapsible


# ORDER FORM panel
${pnl_order_derivatives}    xpath=//android.view.ViewGroup[@content-desc="order_form_collapsible"]/android.view.ViewGroup[1]/android.widget.TextView[2]
${drd_order_type_on_order_form_derivatives}    accessibility_id=order_form_type_picker

# ORDER BOOK panel
${pnl_order_book_derivatives}    accessibility_id=order_book_collapsible
${lbl_total_bids_full_book_derivatives}    xpath=(//android.widget.TextView[@text='TOTAL'])[1]
${btn_max_buy_on_order_form_derivatives}    accessibility_id=max_buy_btn
${btn_max_sell_on_order_form_derivatives}    accessibility_id=max_sell_btn
${txt_order_amount_on_order_form_derivatives}    accessibility_id=order_form_amount_input
${btn_exchange_buy_on_order_form_derivatives}    accessibility_id=order_buy_button
${btn_exchange_sell_on_order_form_derivatives}    accessibility_id=order_sell_button
${btn_confirm_on_confirm_order_popup_derivatives}    xpath=//android.widget.TextView[@text='Confirm']
${btn_max_bid_on_order_form_derivatives}    accessibility_id=max_bid_btn
${btn_min_ask_on_order_form_derivatives}    accessibility_id=min_ask_btn
${btn_top_bid_on_order_form_derivatives}    xpath=//android.view.ViewGroup[@content-desc="top_bid_btn"]/android.widget.TextView
${btn_top_ask_on_order_form_derivatives}    xpath=//android.view.ViewGroup[@content-desc="top_ask_btn"]/android.widget.TextView
${txt_order_price_on_order_form_derivatives}    accessibility_id=order_form_price_input
${chk_reduce_only_on_order_form_derivatives}    accessibility_id=reduceonly_checkbox
${chk_oco_on_order_form_derivatives}    accessibility_id=oco_checkbox
${chk_hidden_on_order_form_derivatives}    accessibility_id=hidden_checkbox
${chk_postonly_on_order_form_derivatives}    accessibility_id=postonly_checkbox
${chk_tif_on_order_form_derivatives}    //android.widget.TextView[@text='TIF']
${txt_oco_stop_price_on_order_form_derivatives}    accessibility_id=order_form_stop_input
# POSITIONS panel
${pnl_positions_derivatives}    accessibility_id=positions_collapsible

# ORDERS panel
${pnl_orders_derivatives}    accessibility_id=orders_collapsible
${btn_cancel_all_orders_orders_panel_derivatives}    //android.widget.TextView[contains(@text,'Cancel') and contains(@text,'orders')]
${tab_derivatives_orders_derivatives}    accessibility_id=order_form_derivatives_tab
${tab_account_summary_orders_derivatives}    accessibility_id=order_form_specs_tab
${tab_calculator_orders_derivatives}    accessibility_id=order_form_calculator

# TRADES panel
${pnl_trades_derivatives}    accessibility_id=trades_collapsible
${btn_market_trades_panel_derivatives}    accessibility_id=market-btn
${btn_yours_trades_panel_derivatives}    accessibility_id=yours-btn

# ORDER HISTORY panel
${pnl_order_history_derivatives}    accessibility_id=order_history_collapsible

# DYNAMIC
${lbl_indicator_by_name_on_derivatives}    xpath=//android.view.View[@text='_DYNAMIC_0']

# ORDER FORM
${rdo_order_type_by_label_derivatives}    xpath=//android.widget.TextView[@text='_DYNAMIC_0']
# ORDERS
${cel_on_orders_by_value}    xpath=//android.view.ViewGroup[@content-desc="orders_collapsible"]//following-sibling::android.widget.HorizontalScrollView//android.widget.TextView[@text='_DYNAMIC_0']
${lbl_no_orders_found_orders_panel_derivatives}    xpath=//android.widget.TextView[@text='No orders found']

# POSITIONS
${cel_on_positions_by_value}    xpath=//android.view.ViewGroup[@content-desc="positions_collapsible"]//following-sibling::android.widget.HorizontalScrollView//android.widget.TextView[@text='_DYNAMIC_0']

# ORDER BOOK panel
${lnk_full_book_orderbook_derivatives}    xpath=//android.widget.TextView[@text="_DYNAMIC_0"]

# TRADES panel
${lnk_full_trade_trades_derivatives}    xpath=//android.widget.TextView[@text="_DYNAMIC_0"]

# ORDER HISTORY panel
${lnk_full_order_history_orderhistory_derivatives}    xpath=//android.widget.TextView[@text="_DYNAMIC_0"]