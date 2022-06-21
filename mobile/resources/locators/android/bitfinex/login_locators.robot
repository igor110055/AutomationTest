*** Variables ***
${tab_scan_qr}    accessibility_id=qr
${tab_add_key}    accessibility_id=input
${btn_need_login_help}    xpath=//android.widget.TextView[@text='Need login help?']
${btn_close_login_screen}    xpath=//android.widget.TextView[@text='']
${txt_public_key}    accessibility_id=Login-Public-Key-Input
${txt_secret_key}    accessibility_id=Login-Secret-Key-Input
${btn_login_on_login_screen}    accessibility_id=Login-Button
${btn_skip_app_protection_on_login}    accessibility_id=Skip-Create-Pin
${lbl_get_started_on_get_started_modal}    xpath=//android.widget.TextView[@text='GET STARTED']
${btn_close_on_get_started_modal}    accessibility_id=close_icon
${btn_learn_more_on_new_feature_screen}    accessibility_id=submit_button
${btn_no_thanks_on_new_feature_screen}    accessibility_id=cancel_button
${lbl_new_feature_on_new_feature_screen}    xpath=//android.widget.TextView[@text='NEW FEATURE']
${txt_email}    accessibility_id=login_email
${txt_password}    accessibility_id=login_password
${btn_login_with_email}    accessibility_id=login_button
${btn_whilte_using_the_app}    xpath=//android.widget.Button[contains(@resource-id,"permission_allow_foreground_only_button")]
${btn_paste_icon_public_key}    xpath=//android.widget.EditText[@content-desc="Login-Public-Key-Input"]/following-sibling::android.view.ViewGroup/android.widget.TextView
${btn_paste_icon_secret_key}    xpath=//android.widget.EditText[@content-desc="Login-Secret-Key-Input"]/following-sibling::android.view.ViewGroup/android.widget.TextView