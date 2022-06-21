*** Variables ***
${drd_from}    xpath=//android.view.ViewGroup[@content-desc="conversion_from"]/android.widget.TextView[1]
${drd_to}    xpath=//android.view.ViewGroup[@content-desc="conversion_to"]/android.widget.TextView[1]
${drd_to_wallet}    accessibility_id=conversion_to_wallet
${drd_from_wallet}    accessibility_id=conversion_from_wallet
${btn_max_amount}    accessibility_id=conversion_form_max_period_btn
${txt_amount}    accessibility_id=conversion_amount
${lbl_balances_amount}    xpath=//android.widget.TextView[@text="Balances"]/following-sibling::android.widget.TextView