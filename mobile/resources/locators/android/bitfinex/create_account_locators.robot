*** Variables ***
${txt_username}    accessibility_id=input_user_name
${txt_email}    accessibility_id=input_email
${txt_password}    accessibility_id=input_password
${txt_confirm_password}    accessibility_id=input_confirm_password
${chk_confirmation}    xpath=//android.view.ViewGroup[@content-desc="input_confirm_password"]/android.view.ViewGroup
${ddl_time_zone}    accessibility_id=timezone_picker
${btn_sign_up_create_account}    accessibility_id=signup_btn
${btn_log_in}    xpath=//android.widget.TextView[@text='Log In']
${btn_close_create_account_screen}    accessibility_id=close_icon
${lbl_username_validation_message_sign_up}    xpath=(//android.widget.EditText[@content-desc="input_user_name"]/..//following-sibling::android.widget.TextView)[1]
${lbl_email_validation_message_sign_up}    xpath=(//android.widget.EditText[@content-desc="input_email"]/..//following-sibling::android.widget.TextView)[1]
${lbl_password_validation_message_sign_up}    xpath=(//android.widget.EditText[@content-desc="input_password"]/..//following-sibling::android.widget.TextView)[2]
${lbl_confirm_password_validation_message_sign_up}    xpath=(//android.widget.EditText[@content-desc="input_confirm_password"]/..//following-sibling::android.widget.TextView)[2]
${btn_back_cancel_signup}    xpath=//android.widget.TextView[@text='Back']
${btn_view_qr_and_secret_code}    xpath=//android.widget.TextView[@text='View QR and Secret code']
${txt_secret_code_copy_secret_code}    xpath=//android.widget.TextView[@text='']/../preceding-sibling::android.widget.TextView
${btn_next_copy_secret_code}    xpath=//android.widget.TextView[@text='Next']