*** Variables ***
${drd_alert_pair}    accessibility_id=price_alert_pair_selector
${drd_alert_symbol}    accessibility_id=price_alert_symbol_selector
${txt_alert_price}    accessibility_id=price_alert_price_input
${btn_place_price_alert}    accessibility_id=price_alert_submit_button
${txt_search_price_dropdown}    xpath=//android.widget.EditText

# DYNAMIC
${drd_alert_symbol_item_price_alert}    xpath=//android.widget.TextView[@text='_DYNAMIC_0']
${drd_alert_pair_item_price_alert}    xpath=//android.widget.TextView[@text='_DYNAMIC_0']
${btn_x_close_price_alert_by_pair}    xpath=//android.widget.TextView[@text='_DYNAMIC_0']//following-sibling::android.view.ViewGroup