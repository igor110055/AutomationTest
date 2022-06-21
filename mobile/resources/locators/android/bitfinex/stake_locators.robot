*** Variables ***
${drd_i_want_to_stake}    accessibility_id=stake_currency_picker
${txt_amount_stake}    accessibility_id=stake_amount_input
${btn_deposit_stake}    accessibility_id=stake_rewards_submit_btn
${btn_stake_support_faq}    accessibility_id=stake_support_faq_icon
${btn_stake_support_faq_close_icon}    accessibility_id=stake_support_faq_close_icon

# DYNAMIC
${lbl_estimation_rewards_in_usd_by_label}    xpath=//android.widget.TextView[@text="_DYNAMIC_0"]/following-sibling::android.widget.TextView[2]
${lbl_estimation_rewards_in_crypto_by_label}    xpath=//android.widget.TextView[@text="_DYNAMIC_0"]/following-sibling::android.widget.TextView[4]
${lbl_choose_cryptocurrency_dropdown}    xpath=//android.widget.TextView[@text="TRON (TRX)"]/following-sibling::android.widget.TextView