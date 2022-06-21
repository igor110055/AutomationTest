*** Variables ***
${drd_choose_transport}    accessibility_id=withdrawals_tether_transport_picker
${txt_address}    accessibility_id=withdrawal_address_input
${btn_min_amount}    accessibility_id=withdrawal_min_amount_usd_text
${txt_withdraw_amount}    accessibility_id=withdrawal_crypto_amount
${btn_request_withdrawal}    accessibility_id=request_invoice_withdrawal_btn
${chk_take_fee_from_amount}    xpath=//android.widget.TextView[@text="Take fee from amount"]
${chk_add_a_note}    xpath=//android.widget.TextView[@text="Add a note to this withdrawal for your records"]
${chk_i_have_read}    xpath=//android.widget.TextView[@text="I have read, understand and agree to the conditions"]
${lbl_invalid_address_error}    xpath=//android.widget.TextView[@text="Invalid Address"]
${btn_i_tether_withdraw}    accessibility_id=withdrawal_support_icon
${btn_close_tether_withdraw}    xpath=//android.view.ViewGroup[@content-desc="movement_support_close"]/android.widget.TextView[2]

# DYNAMIC
${drd_tether_withdraw_dropdown_item_by_text}    xpath=//android.widget.TextView[@text="_DYNAMIC_0"]
${lnk_item_on_tether_withdraw_help_modal}    xpath=//android.widget.TextView[@text="_DYNAMIC_0"]