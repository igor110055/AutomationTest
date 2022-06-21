*** Variables ***
${txt_username_signup}    accessibility_id=input_user_name
${txt_email_signup}    accessibility_id=input_email
${txt_password_signup}    accessibility_id=input_password
${txt_confirm_password_signup}    accessibility_id=input_confirm_password
${chk_confirm_strong_password_signup}    xpath=//android.view.ViewGroup[@content-desc="input_confirm_password"]/android.view.ViewGroup
${btn_signup_signup}    accessibility_id=signup_btn
${drd_country_signup}    accessibility_id=country_picker
${drd_region_signup}    accessibility_id=region_picker
${txt_search_signup}    xpath=//android.widget.EditText[@text='Search']
${btn_clear_search_country_signup}    xpath=//android.widget.TextView[@text='']
${txt_referrer_code_signup}    xpath=//android.widget.TextView[@text="Referral Code (Optional)"]/following-sibling::android.widget.EditText

# DYNAMIC
${lbl_invalid_username_signup}    xpath=//android.widget.TextView[@text='_DYNAMIC_0']
${drd_location_by_text}    xpath=(//android.widget.TextView[contains(@text,"_DYNAMIC_0")])[1]
${lbl_registration_closed_by_location_signup}    xpath=//android.widget.TextView[@text="_DYNAMIC_0"]