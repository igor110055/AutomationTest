*** Settings ***
Resource    ../../resources/locators/android/bitfinex/account_locators.robot
Resource    ../../resources/testdata/locale/en/account_locale.robot
*** Keywords ***
Logout Bitfinex App
    Swipe Down To Element    ${mnu_log_out}
    Click Visible Element    ${mnu_log_out}
    Click Visible Element    ${btn_confirm_on_logout_modal}
    
Tap On Account Menu Item
    [Arguments]    ${name}    ${swipe_direction}=${None}
    ${mnu_item_element}    Run Keyword If    '${name}'=='Account'    Set Variable    ${mnu_account_on_settings}
    ...    ELSE    Generate Element From Dynamic Locator    ${mnu_account_item_by_name}    ${name}
    Run Keyword If    '${swipe_direction}'=='down'    Swipe Down To Element    ${mnu_item_element}    ratio=0.05
    ...    ELSE IF    '${swipe_direction}'=='up'    Swipe Up To Element    ${mnu_item_element}
    ...    ELSE    Wait Element Is Visible    ${mnu_item_element}
    Click Visible Element    ${mnu_item_element}   

Wait Account Menu Item Disappear
    [Arguments]    ${menu_name}
    ${mnu_item_element}    Generate Element From Dynamic Locator    ${mnu_account_item_by_name}    ${menu_name}
    Wait Element Disappear    ${mnu_item_element}    delay=1s

Change Language
    [Arguments]    ${from_language_locale}    ${to_language}
    Import Resource    ${CURDIR}../../../resources/testdata/locale/${from_language_locale}/account_locale.robot
    Tap On Account Menu Item    ${LOCALE_SETTINGS}
    Tap On Account Menu Item    ${LOCALE_SETTINGS_LANGUAGE}
    Tap On Account Menu Item    ${to_language}
    Wait Account Menu Item Disappear	${to_language}

Choose Server
    [Arguments]    ${server}
    Tap On Account Menu Item    Choose Server
    Tap On Account Menu Item    ${server}
    Sleep    3s

Toggle Skip 2FA for Small Payments
    [Arguments]    ${toggle}=ON
    Toggle Switch    ${tgl_fast_pay_skip_2fa_for_small_payments}    toggle=${toggle}

Tap App Share Button
    Click Visible Element    ${btn_app_share}

# LITE MODE
Tap Lite Pro Mode Switch
    [Arguments]    ${menu_text}=Lite Mode
    ${toggle_element}    Generate Element From Dynamic Locator    ${tgl_toggle_by_text}    ${menu_text}
    Click Visible Element    ${toggle_element}    swipe=DOWN
    Sleep    1s
    
Switch To Lite Mode
    ${is_trading_label_display}    Run Keyword And Return Status    Verify Label Displays    Trading
    Run Keyword If    ${is_trading_label_display}==${True}    Run Keywords    Tap On Navigation Tab By Name    Account
    ...    AND    Tap Lite Pro Mode Switch
    ...    AND    Verify Label Displays    The Lite version of the app will only reflect balances in your exchange wallet. You can switch back to the Pro version to view your other wallets, open orders, and open positions.    
    ...    AND    Click Visible Element    ${btn_i_understand_lite_mode}
    Sleep    2s

Switch To Pro Mode
    ${is_trading_label_display}    Run Keyword And Return Status    Verify Label Displays    Trading
    Run Keyword If    ${is_trading_label_display}==${False}    Run Keywords    Tap On Navigation Tab By Name    Account
    ...    AND    Tap Lite Pro Mode Switch
    Sleep    2s

Tap Sub Account
    [Arguments]    ${username}
    ${sub_account_element}    Generate Element From Dynamic Locator    ${lbl_account_sub_accounts_by_username}    ${username}
    Click Visible Element    ${sub_account_element}

Toggle Detach Inactive Screens
    Click Visible Element    ${tgl_detach_inactive_screens}    swipe=DOWN
    
Verify Others Screen Displays
    @{others_menu_list}    Create List    Announcements    Security Policies    Community    Legal    Derivatives    Our Fees
    FOR    ${menu_item}    IN    @{others_menu_list}
        ${element}    Generate Element From Dynamic Locator    ${mnu_account_item_by_name}    ${menu_item}
        Wait Element Is Visible    ${element}
    END
    
Verify Community Screen Displays
    @{community_menu_list}    Create List    Telegram    Twitter    Reddit    Medium
    FOR    ${menu_item}    IN    @{community_menu_list}
        ${element}    Generate Element From Dynamic Locator    ${mnu_account_item_by_name}    ${menu_item}
        Wait Element Is Visible    ${element}
    END
    
Verify Legal Screen Displays
    @{legal_menu_list}    Create List    Terms of Service    API Terms of Service    RRT Token Terms    Risk Disclosure Statement    Privacy Policy    Cookies Policy    Law Enforcement Request Policy    Trademark Notices    Anti-Spam Policy    Affiliate Program Terms
    FOR    ${menu_item}    IN    @{legal_menu_list}
        ${element}    Generate Element From Dynamic Locator    ${mnu_account_item_by_name}    ${menu_item}
        Wait Element Is Visible    ${element}
    END
    
Verify Derivatives Screen Displays
    @{derivatives_menu_list}    Create List    Derivative Terms of Service    Derivative Fee and Margin Schedule    Product Descriptions    Perpetual Contract Funding Summary    Derivative Products Risk Disclosure Statement
    FOR    ${menu_item}    IN    @{derivatives_menu_list}
        ${element}    Generate Element From Dynamic Locator    ${mnu_account_item_by_name}    ${menu_item}
        Wait Element Is Visible    ${element}
    END
    
Verify Account Screen Displays
    @{account_menu_list}    Create List    Permissions    ACCOUNT    SUB ACCOUNTS    SECURITY ACCOUNTS    Address Book
    FOR    ${menu_item}    IN    @{account_menu_list}
        ${element}    Generate Element From Dynamic Locator    ${mnu_account_item_by_name}    ${menu_item}
        Swipe Down To Element    ${element}
    END
    
Verify Login Settings Displays
    @{account_menu_list}    Create List    APP PROTECTION    PIN REQUEST TIMEOUT    SET CUSTOM TIMEOUT
    FOR    ${menu_item}    IN    @{account_menu_list}
        ${element}    Generate Element From Dynamic Locator    ${mnu_account_item_by_name}    ${menu_item}
        Wait Element Is Visible    ${element}
    END
    
Verify Page Opens In Browser
    [Arguments]    ${title}    ${timeout}=60s
    ${announcements_element}    Generate Element From Dynamic Locator    ${lbl_title_on_web_browser}    ${title}
    Wait Element Is Visible    ${announcements_element}    timeout=${timeout}
    
Verify Medium Opens In Browser
    Wait Element Is Visible    ${lbl_announcements_on_medium}
    
Verify Account Menu Item Disappears
    [Arguments]    ${menu_name}
    Wait Account Menu Item Disappear    ${menu_name}