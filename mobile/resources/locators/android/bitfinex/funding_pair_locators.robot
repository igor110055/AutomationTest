*** Variables ***
${btn_volume_on_chart_on_funding}    xpath=//android.view.View[@text='Volume']

# CHART panel
${pnl_chart_funding}    accessibility_id=charts_collapsible

# FUNDING panel
${txt_rate_per_day_funding}    accessibility_id=funding_form_rate_input
${txt_amount_funding}    accessibility_id=funding_form_amount_input
${txt_period_funding}    accessibility_id=funding_form_period_input
${btn_max_offer_funding}    accessibility_id=funding_form_all_offer
${btn_min_period_funding}    xpath=(//android.view.ViewGroup[@content-desc="funding_form_min_period_btn"])[1]
${btn_max_period_funding}    xpath=(//android.view.ViewGroup[@content-desc="funding_form_min_period_btn"])[2]
${chk_hidden_funding}    accessibility_id=funding_form_hidden_checkbox
${chk_frr_funding}    accessibility_id=funding_form_frr_checkbox
${chk_frr_variable_funding}    accessibility_id=funding_form_frr_variable_checkbox
${chk_frr_fixed_funding}    accessibility_id=funding_form_frr_fixed_checkbox
${btn_top_bid_funding}    xpath=//android.view.ViewGroup[@content-desc="top_bid_btn"]/android.widget.TextView
${btn_top_ask_funding}    xpath=//android.view.ViewGroup[@content-desc="top_ask_btn"]/android.widget.TextView
${btn_balance_summary_funding}    accessibility_id=funding_toggle_spec
${lbl_funding_wallet_funding}    xpath=//android.widget.TextView[@text="Funding Wallet"]

# FUNDING OFFER panel
${pnl_funding_offer_funding}    accessibility_id=offer_collapsible

# FUNDING BOOK panel
${pnl_funding_book_funding}    accessibility_id=order_book_collapsible
${lbl_total_bids_full_book_funding}    xpath=(//android.widget.TextView[@text='TOTAL'])[1]

# FUNDING EARNINGS panel
${pnl_funding_earnings_funding}    accessibility_id=reports_collapsible

# TAKEN (UNUSED) panel
${pnl_taken_unused_funding}    xpath=(//android.view.ViewGroup[@content-desc="taken_collapsible"])[1]

# TAKEN (USING) panel
${pnl_taken_using_funding}    xpath=(//android.view.ViewGroup[@content-desc="taken_collapsible"])[2]

# PROVIDED panel
${pnl_provided_funding}    accessibility_id=provided_collapsible

# BIDS & OFFERS panel
${pnl_bids_and_offers_funding}    accessibility_id=bids_offers_collapsible

# AUTORENEW FORM panel
${pnl_autorenew_form_funding}    accessibility_id=autorenew_collapsible

# MATCHED panel
${pnl_matched_funding}    accessibility_id=trades_collapsible
${btn_market_trades_panel_funding}    accessibility_id=market-btn
${btn_yours_trades_panel_funding}    accessibility_id=yours-btn

# DYNAMIC
${lbl_indicator_by_name_on_funding}    xpath=//android.view.View[@text='_DYNAMIC_0']

# MATCHED panel
${lnk_full_funding_matched_funding}    xpath=//android.widget.TextView[@text="_DYNAMIC_0"]

# FUNDING BOOK panel
${lnk_full_book_fundingbook_funding}    xpath=//android.widget.TextView[@text="_DYNAMIC_0"]