*** Variables ***
${txt_search_tickers}    accessibility_id=Tickers-Search-Input
${btn_clear_search_tickers}    accessibility_id=Tickers-Search-Clear-Button
${btn_close_currency_dropdown}    xpath=//android.widget.TextView[@text='']
${ddl_filter_tickers}    xpath=//android.widget.TextView[@text='Any']/..
${btn_collapse_tickers}    accessibility_id=Tickers-Collapsible
${btn_starred_tickers_icon}    xpath=//android.view.ViewGroup[@content-desc="Tickers-Collapsible"]/android.view.ViewGroup[2]
${tab_all_tickers}    accessibility_id=Tickers-All-Button
${lbl_no_tickers_found}    xpath=//android.widget.TextView[@text='No tickers found']
${tbl_name_column}    xpath=(//android.widget.ScrollView)[2]//android.widget.TextView[1]
${pnl_liquidations}    xpath=//android.widget.TextView[@text='LIQUIDATIONS']

# CHART panel
${pnl_chart_trading}    accessibility_id=charts_collapsible

# ORDER FORM panel
${pnl_order_trading}    xpath=//android.view.ViewGroup[@content-desc="order_form_collapsible"]/android.view.ViewGroup[1]/android.widget.TextView[2]

# ORDER BOOK panel
${pnl_order_book_trading}    accessibility_id=order_book_collapsible
${lbl_total_bids_full_book_trading}    xpath=(//android.widget.TextView[@text='TOTAL'])[1]

# POSITIONS panel
${pnl_positions_trading}    accessibility_id=positions_collapsible

# ORDERS panel
${pnl_orders_trading}    accessibility_id=orders_collapsible

# TRADES panel
${pnl_trades_trading}    accessibility_id=trades_collapsible
${btn_market_trades_panel_trading}    accessibility_id=market-btn
${btn_yours_trades_panel_trading}    accessibility_id=yours-btn

# ORDER HISTORY panel
${pnl_order_history_trading}    accessibility_id=order_history_collapsible

# DYNAMIC
${lbl_tickers_table_column_by_name}    xpath=//android.widget.TextView[@text="_DYNAMIC_0"]
${tbl_cell_ticker_by_name}    accessibility_id=tickers_table_t_DYNAMIC_0
${tbl_last_cells}    xpath=//android.view.ViewGroup[contains(@content-desc,"tickers_table")]//android.widget.TextView[4]
${tbl_vol_usd_cells}    xpath=//android.view.ViewGroup[contains(@content-desc,"tickers_table")]//android.widget.TextView[7]

# ORDER BOOK panel
${lnk_full_book_orderbook_trading}    xpath=//android.widget.TextView[@text="_DYNAMIC_0"]

# TRADES panel
${lnk_full_trade_trades_trading}    xpath=//android.widget.TextView[@text="_DYNAMIC_0"]

# ORDER HISTORY panel
${lnk_full_order_history_orderhistory_trading}    xpath=//android.widget.TextView[@text="_DYNAMIC_0"]