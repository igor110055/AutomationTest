*** Settings ***
Resource    ../../resources/locators/android/bitfinex/pro_lite_selection_locators.robot

*** Keywords ***
Select Pro Or Lite Version
    [Arguments]    ${version}
    Tap Element By Label    ${version}

Select Welcome Screen
    [Arguments]    ${screen_order}
    ${screen_element}    Generate Element From Dynamic Locator    ${btn_screen_by_sequence}    ${screen_order}
    Click Visible Element    ${screen_element}

Verify Pro Lite Selection Screen Displays
    Verify Label Displays    Choose between the Pro or Lite version of the app based on your personal preference    timeout=20s
    Verify Label Displays    Pro
    Verify Label Displays    Lite
    
Verify Lite Welcome Screens Display
    Verify Label Displays    The simplest crypto experience at your fingertips
    Verify Label Displays    Sign Up
    Verify Label Displays    Sign In
    Select Welcome Screen    2
    Verify Label Displays    Browse to find your favorite crypto
    Verify Label Displays    Sign Up
    Verify Label Displays    Sign In
    Select Welcome Screen    3
    Verify Label Displays    Buying and selling made easy
    Verify Label Displays    Sign Up
    Verify Label Displays    Sign In
    Select Welcome Screen    4    
    Verify Label Displays    Track your balance at a glance
    Verify Label Displays    Sign Up
    Verify Label Displays    Sign In
    Select Welcome Screen    5
    Verify Label Displays    Share live trading insights and analysis on the go
    Verify Label Displays    Sign Up
    Verify Label Displays    Sign In
    Select Welcome Screen    6
    Verify Label Displays    Switch between pro and lite in Account Settings
    Verify Label Displays    Sign Up
    Verify Label Displays    Sign In
    
Verify Pro Welcome Screens Display
    Verify Label Displays    The ultimate crypto experience at your fingertips
    Verify Label Displays    Sign Up
    Verify Label Displays    Sign In
    Select Welcome Screen    2
    Verify Label Displays    Track positions, orders and history at a glance
    Verify Label Displays    Sign Up
    Verify Label Displays    Sign In
    Select Welcome Screen    3
    Verify Label Displays    Real-time data and intuitive, powerful charts
    Verify Label Displays    Sign Up
    Verify Label Displays    Sign In
    Select Welcome Screen    4    
    Verify Label Displays    Advanced order types and the deepest liquidity
    Verify Label Displays    Sign Up
    Verify Label Displays    Sign In
    Select Welcome Screen    5
    Verify Label Displays    Share live trading insights and analysis on the go
    Verify Label Displays    Sign Up
    Verify Label Displays    Sign In
    Select Welcome Screen    6
    Verify Label Displays    Switch between pro and lite in Account Settings
    Verify Label Displays    Sign Up
    Verify Label Displays    Sign In