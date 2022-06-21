*** Settings ***
Resource    ../../resources/locators/android/bitfinex/stake_locators.robot

Resource    common_keywords.robot
*** Keywords ***
Tap I Want To Stake Dropdown
    Click Visible Element    ${drd_i_want_to_stake}

Select I Want To Stake Dropdown
    [Arguments]    ${cryptocurrency}
    Input Text To Textbox    ${cryptocurrency}
    Tap Element By Label    ${cryptocurrency}

Input Stake Amount
    [Arguments]    ${amount}
    Input Text Into Element    ${txt_amount_stake}    ${amount}    clear_text=${True}

Tap Deposit Stake Button
    Click Visible Element    ${btn_deposit_stake}

Tap Stake Support Faq Button
    Click Visible Element    ${btn_stake_support_faq}

Tap Stake Support Close Icon
    Click Visible Element    ${btn_stake_support_faq_close_icon}

Verify I Want To Stake Dropdown Item
    [Arguments]    ${currency}    ${estimated_staking_reward}
    ${dropdown_item}    Generate Element From Dynamic Locator    ${lbl_choose_cryptocurrency_dropdown}    ${currency}    ${estimated_staking_reward}
    Wait Element Is Visible    ${dropdown_item}    
    
Verify Estimation Rewards In Usd
    [Arguments]    ${daily}    ${weekly}    ${monthly}    ${yearly}
    ${daily_element}    Generate Element From Dynamic Locator    ${lbl_estimation_rewards_in_usd_by_label}    Daily Rewards*
    Verify Element Text Should Be    ${daily_element}    ${daily}
    ${weekly_element}    Generate Element From Dynamic Locator    ${lbl_estimation_rewards_in_usd_by_label}    Weekly Rewards*
    Verify Element Text Should Be    ${weekly_element}    ${weekly}
    ${monthly_element}    Generate Element From Dynamic Locator    ${lbl_estimation_rewards_in_usd_by_label}    Monthly Rewards*
    Verify Element Text Should Be    ${monthly_element}    ${monthly}
    ${yearly_element}    Generate Element From Dynamic Locator    ${lbl_estimation_rewards_in_usd_by_label}    Yearly Rewards*
    Verify Element Text Should Be    ${yearly_element}    ${yearly}
    
Verify Estimation Rewards In Crypto
    [Arguments]    ${daily}    ${weekly}    ${monthly}    ${yearly}
    ${daily_element}    Generate Element From Dynamic Locator    ${lbl_estimation_rewards_in_crypto_by_label}    Daily Rewards*
    Verify Element Text Should Be    ${daily_element}    ${daily}
    ${weekly_element}    Generate Element From Dynamic Locator    ${lbl_estimation_rewards_in_crypto_by_label}    Weekly Rewards*
    Verify Element Text Should Be    ${weekly_element}    ${weekly}
    ${monthly_element}    Generate Element From Dynamic Locator    ${lbl_estimation_rewards_in_crypto_by_label}    Monthly Rewards*
    Verify Element Text Should Be    ${monthly_element}    ${monthly}
    ${yearly_element}    Generate Element From Dynamic Locator    ${lbl_estimation_rewards_in_crypto_by_label}    Yearly Rewards*
    Verify Element Text Should Be    ${yearly_element}    ${yearly}