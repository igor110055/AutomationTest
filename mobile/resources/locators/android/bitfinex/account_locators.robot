*** Variables ***
${mnu_log_out}    accessibility_id=Logout-App
${btn_confirm_on_logout_modal}    xpath=(//android.widget.TextView[@text='Log Out'])[3]
${mnu_account_on_settings}    xpath=//android.widget.TextView[@text='Account']//following-sibling::android.view.ViewGroup
${lbl_announcements_on_medium}    accessibility_id=ANNOUNCEMENTS
${tgl_detach_inactive_screens}    xpath=//android.widget.TextView[@text="Detach Inactive Screens"]//following-sibling::android.view.ViewGroup/android.widget.Switch
${btn_i_understand_lite_mode}    //android.widget.TextView[@text="I understand"]
${tgl_fast_pay_skip_2fa_for_small_payments}    xpath=//android.widget.Switch
${btn_app_share}    xpath=//android.widget.TextView[@text="Build Version"]/following-sibling::android.view.ViewGroup

# DYNAMIC
${mnu_account_item_by_name}    xpath=//android.widget.TextView[@text='_DYNAMIC_0']
${lbl_title_on_web_browser}    xpath=(//android.view.View[contains(@text,"_DYNAMIC_0")])[1]
${tgl_toggle_by_text}    xpath=//android.widget.TextView[@text="_DYNAMIC_0"]//following-sibling::android.view.ViewGroup/android.widget.Switch
${lbl_account_sub_accounts_by_username}    xpath=//android.widget.TextView[@text='_DYNAMIC_0']