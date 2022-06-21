*** Variables ***
${txt_type_message}    xpath=//android.widget.EditText[contains(@resource-id,"val-field")]
${btn_send_message}    xpath=//android.widget.Button[@text="Send"]

# DYNAMIC
${lbl_text_in_chat_panel}    xpath=//android.view.View[@text="_DYNAMIC_0"]