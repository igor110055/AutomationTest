*** Settings ***
Resource    ../../resources/locators/android/bitfinex/zoom_fonts_locators.robot

Resource    ../common/mobile_common.robot
*** Keywords ***
Verify Zoom Fonts Screen Displays
    Wait Element Is Visible    ${btn_default_zoom_fonts}
    Wait Element Is Visible    ${lbl_warning_message_zoom_fonts}
    Wait Element Is Visible    ${btn_update_zoom_fonts}