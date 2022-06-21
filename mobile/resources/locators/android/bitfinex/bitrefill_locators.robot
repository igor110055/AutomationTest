*** Variables ***
${lbl_search_icon_bitrefill}    //android.view.View[@resource-id='search-label']
${txt_search_bitrefill}    //android.widget.EditText[@resource-id='search-input']
${btn_i_bitrefill}    xpath=//android.widget.TextView[@text='']
${btn_okay_bitrefill}    xpath=//android.widget.TextView[@text='Okay']
${btn_search_icon}    xpath=//android.view.View[@content-desc="?hl=en"]/following-sibling::android.widget.Button
${btn_cart_icon}    xpath=//android.view.View[@content-desc="?hl=en"]/following-sibling::android.view.View
${txt_enter_amount}    xpath=(//android.widget.EditText)[1]
${txt_phone_number}    xpath=//android.widget.EditText[@resource-id="recipient"]

${btn_delete_by_product}    xpath=//android.view.View[contains(@content-desc,"_DYNAMIC_0")]/android.widget.Button    