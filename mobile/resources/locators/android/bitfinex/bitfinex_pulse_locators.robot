*** Variables ***
${mnu_hamberger}    accessibility_id=pulse_menu
${txt_pulse_search}    accessibility_id=pulse_search_bar
${mnu_home_item_on_hamberger_menu}    accessibility_id=pulse_home
${mnu_your_pulse_item_on_hamberger_menu}    accessibility_id=pulse_your_pulse
${mnu_notifications_item_on_hamberger_menu}    accessibility_id=pulse_notifications
${mnu_messages_item_on_hamberger_menu}    accessibility_id=pulse_messages
${mnu_search_item_on_hamberger_menu}    accessibility_id=pulse_search
${btn_bitfinex_pulse_back}    xpath=//android.widget.TextView[@text="Bitfinex Pulse"]/preceding-sibling::android.widget.TextView
# YOUR PROFILE
${btn_edit_profile_on_your_pulse}    accessibility_id=pulse_edit_profile
${tgl_enable_account_for_public_leaderboard}    xpath=(//android.widget.Switch)[1]
${tgl_show_twitter_nickname}    xpath=(//android.widget.Switch)[2]
${txt_nickname}    xpath=(//android.widget.EditText)[1]
${txt_say_something_about_yourself}    xpath=(//android.widget.EditText)[2]

${btn_create_new_pulse}    accessibility_id=pulse_create_button
${txt_create_pulse_title}    xpath=//android.widget.EditText[@text="Title of your pulse (16 to 120 characters)"]
${txt_create_pulse_content}    xpath=//android.widget.EditText[@resource-id="content"]

# DYNAMIC
${btn_pulse_option_by_title}    xpath=//android.widget.TextView[@text="_DYNAMIC_0"]/following-sibling::android.view.ViewGroup/android.view.ViewGroup[5]