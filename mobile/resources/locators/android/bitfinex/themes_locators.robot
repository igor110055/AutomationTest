*** Variables ***
${btn_default_themes}    xpath=(//android.widget.TextView[@text='Default'])[1]
${rdo_default_theme_themes}    xpath=(//android.widget.TextView[@text='Default'])[2]
${rdo_white_theme_themes}    xpath=//android.widget.TextView[@text='White']
${rdo_black_theme_themes}    xpath=//android.widget.TextView[@text='Black']
${rdo_color_blind_theme_themes}    xpath=//android.widget.TextView[@text='Colour blind']

${chk_green_up_red_down}    xpath=//android.view.ViewGroup[@content-desc="default_candle_theme"]/android.view.ViewGroup
${chk_red_up_green_down}    xpath=//android.view.ViewGroup[@content-desc="reverse_candle_theme"]/android.view.ViewGroup