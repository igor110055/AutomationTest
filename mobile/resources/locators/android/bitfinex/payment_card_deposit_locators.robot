*** Variables ***
${btn_min_payment_card_deposit}    accessibility_id=payment_deposit_amount_input_min
${btn_max_payment_card_deposit}    accessibility_id=payment_deposit_amount_input_max
${chk_tos_agree_payment_card_deposit}    accessibility_id=payment_deposit_terms_agree_checkbox
${btn_submit_payment_card_deposit}    accessibility_id=payment_deposit_terms_submit
${btn_ok_please_confirm_payment_card_deposit}    xpath=//android.widget.TextView[@text="Okay"]
${drd_deposit_currency}    accessibility_id=payment_deposit_picker
${drd_deposit_currency_fiat}    accessibility_id=payment_deposit_picker_fiat
${txt_fiat_amount}    accessibility_id=payment_deposit_price_input
${txt_deposit_amount}    accessibility_id=payment_deposit_amount_input
${drd_to_wallet}    accessibility_id=payment_deposit_picker_wallet

# DYNAMIC
${drd_payment_card_item}    xpath=//android.widget.TextView[@text="_DYNAMIC_0"]