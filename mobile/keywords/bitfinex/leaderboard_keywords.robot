*** Settings ***
Resource    ../../resources/locators/android/bitfinex/leaderboard_locators.robot

Resource    ../common/mobile_common.robot
*** Keywords ***
Verify Leaderboard Screen Displays
    Wait Element Is Visible    ${lbl_bitfinex_leaderboard}    30s
    Wait Element Is Visible    ${lbl_learn_more_leaderboard}    30s
    # Wait Element Is Visible    ${btn_enable_your_account}
    Swipe Down To Element    ${txt_search_leaderboard}    30s
    Wait Element Is Visible    ${txt_search_leaderboard}    30s