*** Settings ***
Resource    ../../resources/locators/android/bitfinex/notification_locators.robot

Resource    ../common/mobile_common.robot
*** Keywords ***
Verify Notifications Screen Displays
    Wait Element Is Visible    ${pnl_push_notification_notifications}
    Wait Element Is Visible    ${pnl_in_app_notifications_notifications}