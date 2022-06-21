*** Settings ***
Resource    ../../resources/locators/android/bitfinex/changelog_updates_locators.robot

Resource    ../common/mobile_common.robot
*** Keywords ***
Verify Changelog Updates Screen Displays
    Wait Element Is Visible    ${rdo_show_new_version_changelog_on_startup}