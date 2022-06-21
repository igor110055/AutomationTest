*** Variables ***
${txt_calculator__description}    xpath=//android.widget.TextView[@text="All values are approximate and do not take into account fees or slippage."]
${rdo_long_calculator}    accessibility_id=calculator_long_radio_btn
${rdo_short_calculator}    accessibility_id=calculator_short_radio_btn
${txt_entry_price_calculator}    accessibility_id=calculator_entry_price_input
${txt_exit_price_calculator}    accessibility_id=calculator_exit_price_input
${txt_amount_base_calculator}    accessibility_id=calculator_quantity_input
${txt_amount_quote_calculator}    accessibility_id=calculator_entry_value_input
${lbl_profit_loss_usd}    xpath=//android.view.ViewGroup[@content-desc="calculator_exit_pl_value"]/android.widget.TextView
${lbl_profit_loss_percent}    xpath=//android.view.ViewGroup[@content-desc="calculator_exit_pl_prec_value"]/android.widget.TextView

# PRO VERSION
${txt_amount_pro_version}    accessibility_id=calculator_amount
${txt_entry_price_pro_version}    accessibility_id=calculator_entry_price
${txt_entry_val_pro_version}    accessibility_id=calculator_entry_value
${txt_exit_price_pro_version}    accessibility_id=calculator_exit_price
${txt_exit_val_pro_version}    accessibility_id=calculator_exit_value
${txt_exit_pnl_pro_version}    accessibility_id=calculator_exit_pl_ccy
${txt_exit_pnl_percentage_pro_version}    accessibility_id=calculator_exit_pl_perc
${txt_stop_price_pro_version}    accessibility_id=calculator_stop_price
${txt_stop_val_pro_version}    accessibility_id=calculator_stop_val
${txt_stop_pnl_pro_version}    accessibility_id=calculator_stop_pl_ccy
${txt_stop_pnl_percentage_pro_version}    accessibility_id=calculator_stop_pl_perc