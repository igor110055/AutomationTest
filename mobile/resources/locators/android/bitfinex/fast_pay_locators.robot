*** Variables ***
${btn_toggle_btc_sat}    accessibility_id=fast_pay_toggle_btc_view_mode
${btn_support_icon}    accessibility_id=withdrawal_support_icon
# FAST PAY
${btn_fast_pay_support_icon}    xpath=//android.widget.Button[@content-desc="Home, back"]/following-sibling::android.view.ViewGroup[1]
${btn_fast_pay_config_icon}    xpath=//android.widget.Button[@content-desc="Home, back"]/following-sibling::android.view.ViewGroup[2]
${btn_scan}    accessibility_id=fastpay_scan_button
${btn_receive}    accessibility_id=fastpay_receive_button
${lnk_enter_address}    accessibility_id=qrScanner_bottom_link
${txt_enter_address}    accessibility_id=fastpay_address_input
${btn_paste_address_icon}    xpath=//android.widget.EditText[@content-desc="fastpay_address_input"]/following-sibling::android.view.ViewGroup
${btn_okay}    accessibility_id=fastpay_address_okay_button
${btn_pay}    xpath=//android.widget.TextView[@text="Pay"]
${txt_2fa_token}    xpath=//android.widget.EditText[@text="2FA TOKEN"]
${btn_authenticate_fast_pay}    xpath=//android.widget.TextView[@text="Authenticate"]
${btn_scan_on_enter_address}    accessibility_id=fastpay_address_input_scan
${lbl_view_mode}    xpath=//android.view.ViewGroup[@content-desc="fast_pay_toggle_btc_view_mode"]/android.widget.TextView[1]
${btn_home_payment_completed}    xpath=//android.widget.TextView[@text="Home"]
${drd_payment_transport}    xpath=//android.widget.HorizontalScrollView
${txt_amount}    xpath=//android.widget.EditText
${btn_generate_invoice}    xpath=//android.widget.TextView[@text="Generate Invoice"]
${lbl_ln_btc_invoice_code}    xpath=//android.widget.TextView[contains(@text,"lightning:lnbc")]
${lbl_tether_ethereum_invoice_code}    xpath=//android.widget.TextView[contains(@text,"usdt_")]
${lbl_equivalent_amount}    xpath=//android.view.ViewGroup[@content-desc="fastpay_receive_swap_button"]/following-sibling::android.widget.TextView
${btn_receive_swap}    accessibility_id=fastpay_receive_swap_button
${lbl_receive_amount_second_part}    xpath=//android.view.ViewGroup[@content-desc="fastpay_receive_swap_button"]/preceding-sibling::android.widget.TextView[1]

# ACCOUNT - FAST PAY
${btn_fastpay_setting_skip_2fa}    accessibility_id=fastpay_setting_skip2faAmount_config

# LITE MODE
${btn_close_fast_pay_on_lite_mode}    accessibility_id=fastpay_address_cancel_button
${btn_support_infor_on_lite_mode}    xpath=//android.view.View[@text="Fast Pay"]/following-sibling::android.view.ViewGroup[1]

# DYNAMIC
${drd_payment_transport_by_text}    xpath=//android.widget.TextView[@text="_DYNAMIC_0"]
${lbl_btc_sat_mode_on_receive}    xpath=//android.widget.TextView[@text="0 _DYNAMIC_0"]
# RECENT TRANSACTIONS
${row_recent_transactions_by_index}    xpath=//android.widget.TextView[@text="Recent Transactions"]/following-sibling::android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[_DYNAMIC_0]