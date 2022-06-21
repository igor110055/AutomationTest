*** Settings ***
Resource    ../../resources/locators/android/bitfinex/bitfinex_pulse_locators.robot

Resource    common_keywords.robot
*** Keywords ***
Tap Create New Pulse
    Click Visible Element    ${btn_create_new_pulse}

Tag Person When Create Pulse
    [Arguments]    ${tag_person}
    Input Text Into Element    ${txt_create_pulse_content}    @
    Sleep    2s
    Input Text Into Element    ${txt_create_pulse_content}    vu
    Sleep    5s    
    Tap Element By Label    @${tag_person}
    Sleep    5s    
        
Create New Pulse
    [Arguments]    ${title}    ${content}    ${tag_person}=${None}
    Input Text Into Element    ${txt_create_pulse_title}    ${title}
    Input Text Into Element    ${txt_create_pulse_content}    ${content}
    Run Keyword If    "${tag_person}"!="${None}"   Tag Person When Create Pulse    ${tag_person}
    Tap Element By Label    Post
    Sleep    5s

Tap Pulse Option By Title
    [Arguments]    ${pulse_title}    ${option}
    ${pulse_title_element}    Generate Element From Dynamic Locator    ${btn_pulse_option_by_title}    ${pulse_title}
    Click Visible Element    ${pulse_title_element}
    Tap Element By Label    ${option}    

# YOUR PROFILE    
Tap Edit Profile Button Of Your Pulse
    Click Visible Element    ${btn_edit_profile_on_your_pulse}
    
Toggle Your Profile Settings
    [Arguments]    ${public_leaderboard}    ${show_twitter_name}
    Toggle Switch    ${tgl_enable_account_for_public_leaderboard}    ${public_leaderboard}
    Toggle Switch    ${tgl_show_twitter_nickname}    ${show_twitter_name}

Update Your Profile
    [Arguments]    ${nickname}=${None}    ${description}=${None}    ${settings_public_leaderboard}=${None}    ${settings_show_twitter_name}=${None}
    Run Keyword If    "${nickname}"!="${None}"   Input Text Into Element    ${txt_nickname}    ${nickname}    clear_text=${True}
    Run Keyword If    "${description}"!="${None}"   Input Text Into Element    ${txt_say_something_about_yourself}    ${description}    clear_text=${True}
    Run Keyword If    "${settings_public_leaderboard}"!="${None}"   Toggle Switch    ${tgl_enable_account_for_public_leaderboard}    ${settings_public_leaderboard}
    Run Keyword If    "${settings_show_twitter_name}"!="${None}"   Toggle Switch    ${tgl_show_twitter_nickname}    ${settings_show_twitter_name}
    Tap Element By Label    Save    wait_disappear=${True}
    
Tap Bitfinex Pulse Back Button
    Click Visible Element    ${btn_bitfinex_pulse_back}
    
Verify Pulse Content
    [Arguments]    ${expected_content}
    Verify Element Text Should Be    ${txt_create_pulse_content}    ${expected_content}