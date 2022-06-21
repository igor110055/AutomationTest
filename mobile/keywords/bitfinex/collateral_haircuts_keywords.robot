*** Settings ***
Resource    ../../resources/locators/android/bitfinex/collateral_haircuts_locators.robot

Resource    ../common/mobile_common.robot
*** Keywords ***
Verify Collateral Haircuts Screen Displays
    Wait Element Is Visible    ${txt_collateral_haircuts_description}