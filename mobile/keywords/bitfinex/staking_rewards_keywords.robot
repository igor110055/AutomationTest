*** Settings ***
Resource    ../../resources/locators/android/bitfinex/staking_rewards_locators.robot

Resource    ../common/mobile_common.robot
*** Keywords ***
Verify Staking Rewards Screen Displays
    Wait Element Is Visible    ${pnl_stake_program_staking_rewards}
    Wait Element Is Visible    ${pnl_banner_staking_rewards}
    Wait Element Is Visible    ${btn_deposit_now_staking_rewards}