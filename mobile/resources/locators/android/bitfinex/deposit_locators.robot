*** Variables ***
${btn_i_support_infor}    xpath=//android.view.ViewGroup[@content-desc="deposit_collapsible"]/android.view.ViewGroup[2]
${drd_payment_type_deposit}    accessibility_id=deposits_payment_type_picker
${lbl_simplex_payment_card_deposit}    accessibility_id=payment_deposit_simplex_radio
${lbl_mercuryo_payment_card_deposit}    accessibility_id=payment_deposit_mercuryo_radio
${lbl_ownr_wallet_payment_card_deposit}    accessibility_id=payment_deposit_ownr_radio
${drd_cryptocurrency}    accessibility_id=deposits_currency_picker
${drd_to_wallet_deposit}    accessibility_id=deposits_wallet_type_picker
${btn_close_icon_deposits_support}    accessibility_id=movement_support_close

# CRYPTOCURRENCIES
# LN-BTC
${txt_amount_on_ln_btc_deposit}    xpath=(//android.widget.EditText)[1]
${btn_close_icon_deposits_choose_cryptocurrency}    accessibility_id=deposits_currency_picker_close

# TETHER
${drd_choose_tether}    accessibility_id=deposits_tether_picker
${drd_choose_transport}    accessibility_id=deposits_tether_transport_picker

# BANK WIRE
${txt_bank_wire_amount}    accessibility_id=deposits_wire_amount
${btn_deposit_next_button}    accessibility_id=deposits_next_button
${chk_agree_terms_condition}    accessibility_id=market_checkbox

# DYNAMIC
# DEPOSIT DETAILS
${lbl_deposit_details_field}    xpath=//android.widget.TextView[@text="_DYNAMIC_0"]
# CHOOSE PAYMENT TYPE
${lbl_fiat_by_payment_type}    xpath=//android.widget.TextView[@text="_DYNAMIC_0"]/following-sibling::android.widget.TextView[3]