*** Variables ***
${btn_i_withdraw}    xpath=//android.view.ViewGroup[@content-desc="withdraw_collapsible"]/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.TextView
${drd_payment_type_withdraw}    accessibility_id=payment_type_selector
${drd_from_wallet_withdraw}    accessibility_id=from_wallet_selector
${drd_cryptocurrencies_withdraw}    accessibility_id=cryptocurrency_selector
${drd_choose_tether}    accessibility_id=withdrawals_tether_picker
${btn_next_withdraw}    accessibility_id=withdrawal_next_btn
${btn_address_book}    xpath=//android.widget.TextView[@text=""]
${lbl_address_book_empty}    xpath=//android.widget.TextView[contains(@text,"address book is empty")]
${btn_close_choose_address}    xpath=//android.widget.TextView[@text="Choose Address"]//following-sibling::android.widget.TextView
${lbl_polkadot_subscan}    accessibility_id=polkadot.subscan

# DYNAMIC
${drd_withdraw_dropdown_item_by_text}    xpath=//android.widget.TextView[@text="_DYNAMIC_0"]
${drd_tether_dropdown_item_by_text}    xpath=//android.widget.TextView[contains(@text,"_DYNAMIC_0")]