*** Settings ***
Resource    ../../resources/locators/android/bitfinex/themes_locators.robot
*** Keywords ***
Select Theme
    [Arguments]    ${theme}
    Run Keyword If    "${theme}"=="Green Up/Red Down"    Click Visible Element    ${chk_green_up_red_down}
    ...    ELSE        Click Visible Element    ${chk_red_up_green_down}
    
Verify Themes Screen Displays
    Wait Element Is Visible    ${btn_default_themes}
    Wait Element Is Visible    ${rdo_default_theme_themes}
    Wait Element Is Visible    ${rdo_white_theme_themes}
    Wait Element Is Visible    ${rdo_black_theme_themes}
    Wait Element Is Visible    ${rdo_color_blind_theme_themes}
    Verify Label Displays    COLOR PREFERENCE
    Verify Label Displays    Green Up/Red Down
    Verify Label Displays    Red Up/Green Down
    
Verify Changing Theme
    Click Visible Element    ${rdo_white_theme_themes}    delay=1
    Click Visible Element    ${rdo_default_theme_themes}    delay=1
    Click Visible Element    ${rdo_black_theme_themes}    delay=1
    Click Visible Element    ${btn_default_themes}    delay=1
    Click Visible Element    ${rdo_color_blind_theme_themes}    delay=1
    Click Visible Element    ${rdo_default_theme_themes}    delay=1
    
Verify Current Color Reference
    [Arguments]    ${color_reference}
    ${color_reference_element}    Run Keyword If    "${color_reference}"=="Green Up/Red Down"    Set Variable    ${chk_green_up_red_down}/android.widget.TextView
    ...    ELSE    Set Variable    ${chk_red_up_green_down}/android.widget.TextView
    Wait Element Is Visible    ${color_reference_element}