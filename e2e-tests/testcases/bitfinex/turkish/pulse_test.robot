*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/bitfinex_pulse_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login And Set Up Pin Turkish App    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Variables ***
${pulse_title}    Bitcoin Heads for Worst Week in 8 Months as Traders Lament 'Pikachu Pattern'

*** Test Cases ***
pulse_create_new_pulse
    Access Bitfinex Pulse
    Tap Create New Pulse
    Create New Pulse    ${pulse_title}    The bitcoin price is down 19% in the past seven days – the cryptocurrency's worst weekly performance since May 2021, when fears of China's renewed crackdown on cryptocurrency trading and mining sent the market reeling, and tweets by Tesla CEO Elon Musk focused public attention on the Bitcoin blockchain network's potential environmental harms.
    Tap Pulse Option By Title    ${pulse_title}    Delete
    Tap Element By Label    Confirm
    Verify Label Not Display    ${pulse_title}
        
your_profile
    Tap Element By Label    Your Profile
    Tap Edit Profile Button Of Your Pulse
    Verify Label Displays    Pulse Feed Languages
    Verify Label Displays    Enable account for public leaderboard
    Verify Label Displays    Show Twitter nickname (if set) in public boards
    Verify Label Not Display    Allow Private Messages
    Verify Label Not Display    Allow Invites to Group Chats
    
update_your_profile
    Update Your Profile    nickname=automationtest    description=say something about yourself    settings_public_leaderboard=ON    settings_show_twitter_name=ON
    Tap Edit Profile Button Of Your Pulse
    Update Your Profile    nickname=vuongprod1988    description=say something about yourself        settings_public_leaderboard=OFF    settings_show_twitter_name=OFF