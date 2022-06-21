*** Settings ***
Resource    ../../resources/locators/android/bitfinex/wallet_locators.robot

*** Keywords ***
Tap On I Button
    Click Visible Element    ${btn_i_open_help_modal}
    
Tap On Eyes Icon
    Click Visible Element    ${btn_eyes}    
    
Tap On Balances Button
    [Arguments]    ${button}
    Run Keyword If    '${button}'=='Deposit'    Click Visible Element    ${btn_deposit_on_balances_panel}
    ...    ELSE IF    '${button}'=='Conversion'    Click Visible Element    ${btn_conversion_on_balances_panel}
    ...    ELSE IF    '${button}'=='Withdraw'    Click Visible Element    ${btn_withdraw_on_balances_panel}
    ...    ELSE IF    '${button}'=='Pay'    Click Visible Element    ${btn_pay_on_balances_panel}

Tap On I Button On Deposit Panel
    Click Visible Element    ${btn_i_on_deposit_panel}
        
Select Currency Conversion
    [Arguments]    ${amount}
    Input Text Into Element    ${txt_amount_on_currency_conversion_panel}    ${amount}
    Click Visible Element    ${drd_from_on_currency_conversion_panel}
    Tap On Dropdown Item    USD
    Click Visible Element    ${drd_from_wallet_on_currency_conversion_panel}
    Tap On Dropdown Item    Exchange
    Click Visible Element    ${btn_convert_on_currency_conversion_panel}
    
Swipe Back To Top
    Swipe Up To Element    ${pnl_balances}
    
Search For Currency On Balance
    [Arguments]    ${currency}
    Input Text Into Element    ${txt_search_on_balances_panel}    ${currency}

Tap On Clear Search Button
    Click Visible Element    ${btn_clear_search_on_balances_panel}

# CONFIGURE BALANCE
Tap Configure Balance
    [Arguments]    ${swipe}=${None}
    Click Visible Element    ${btn_configure_balance}    swipe=${swipe}
    
Tap Configure Balance Gear Icon
    Click Visible Element    ${btn_configure_hide_small_balance_configure_balance}

Configure Small Balance Threshold
    [Arguments]    ${threshold_in_usd}
    Tap Configure Balance Gear Icon
    Input Text Into Element    ${txt_small_balance_threshold_in_usd}    ${threshold_in_usd}    clear_text=${True}
    Tap Element By Label    Save
    Sleep    2s
    
Tap Balances Balance Analytics Button
    Click Visible Element    ${btn_balance_analytics}    delay=1s

Tap Balances Normal View Button
    Click Visible Element    ${btn_balances_normal_view}

Tap Balances Compact View Button
    Click Visible Element    ${btn_balances_compact_view}
    
Tap Balance Of Currency
    [Arguments]    ${currency}    ${wallet_type}    ${balance_type}
    ${balance_element}    Run Keyword If    '${balance_type}'=='total'    Generate Element From Dynamic Locator    ${cel_currency_total_balance_on_balances_table}    ${currency}    ${wallet_type}
    ...    ELSE    Generate Element From Dynamic Locator    ${cel_currency_available_balance_on_balances_table}    ${currency}    ${wallet_type}
    Click Visible Element    ${balance_element}

Tap Balance Currency In Lite Mode
    [Arguments]    ${currency}   ${balance_type}
    ${balance_element}    Run Keyword If    '${balance_type}'=='TOTAL'    Generate Element From Dynamic Locator    ${cel_currency_balance_on_balances_table_lite_mode}    ${currency}    1
    ...    ELSE    Generate Element From Dynamic Locator    ${cel_currency_balance_on_balances_table_lite_mode}    ${currency}    2
    Click Visible Element    ${balance_element}

Tap Transfer On Exchange Wallet Popup
    Click Visible Element    ${btn_transfer_on_exchange_wallet_popup}    0.5s

Swipe To Wallets Panel
    [Arguments]    ${panel_name}    ${ratio}    ${swipe}
    Run Keyword If    '${panel_name}'=='POSITIONS'    Swipe To Element    ${pnl_positions_wallets}    ${ratio}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='ORDERS'    Swipe To Element    ${pnl_orders_wallets}    ${ratio}    swipe=${swipe}

Tap Wallets Panel
    [Arguments]    ${panel_name}
    Run Keyword If    '${panel_name}'=='BALANCES'    Click Visible Element    ${pnl_balances}
    ...    ELSE IF    '${panel_name}'=='POSITIONS'    Click Visible Element    ${pnl_positions_wallets}
    ...    ELSE IF    '${panel_name}'=='ORDERS'    Click Visible Element    ${pnl_orders_wallets}
    ...    ELSE IF    '${panel_name}'=='ORDER HISTORY'    Click Visible Element    ${pnl_order_history_wallets}
    
Tap Positions Panel Record By Value On Wallets
    [Arguments]    ${value}
    ${element_value}    Generate Element From Dynamic Locator    ${cel_on_positions_by_value_wallets}    ${value}
    Click Visible Element    ${element_value}    swipe=DOWN

Input Search Textbox
    [Arguments]    ${text_to_search}
    Input Text Into Element    ${txt_search}    ${text_to_search}    clear_text=${True}

Clear Search Textbox
    Click Visible Element    ${btn_clear_search_on_balances_panel}

Tap Show Market Value Checkbox
    Click Visible Element    ${chk_show_market_value_configure_balance}

Tap Hide Small Balances Checkbox
    Click Visible Element    ${chk_hide_small_balance_configure_balance}
    
Tap How To Wallet Transfer Button
    Click Visible Element    ${btn_infor_configure_balance}
    Click Visible Element    ${btn_okay_got_it_configure_balance}

Tap Slide In Menu
    [Arguments]    ${menu_item}
    Tap Element By Label    ${menu_item}    delay=2s

Select Item Currency Equivalent On Configure Balances
    [Arguments]    ${currency}
    Sleep    1s
    Click Visible Element    ${drd_currency_equivalent_configure_balance}
    Tap Element By Label    ${currency}
    
Verify Currency On Balances Table
    [Arguments]    ${currency}
    ${currency_element}    Generate Element From Dynamic Locator    ${cel_currency_on_balances_table}    ${currency}
    Swipe Down To Element    ${currency_element}

Verify Currency Does Not Display On Table
    [Arguments]    ${currency}
    ${currency_element}    Generate Element From Dynamic Locator    ${cel_currency_on_balances_table}    ${currency}
    Wait Element Disappear    ${currency_element}    

Verify Balances Information Is Hidden
    Wait Element Disappear    ${lnk_currency_on_balances_panel}
    Wait Element Disappear    ${lbl_equivalent_on_balances_panel}
    Wait Element Disappear    ${chk_market_on_balances_panel}
    Wait Element Disappear    ${lbl_market_on_balances_panel}
    Verify Element Text Should Be    ${cel_balances_table_on_balances_panel}    *
    
Verify Balances Information Is Shown
    Wait Element Is Visible    ${lnk_currency_on_balances_panel}
    Wait Element Is Visible    ${lbl_equivalent_on_balances_panel}
    Wait Element Is Visible    ${chk_market_on_balances_panel}
    Wait Element Is Visible    ${lbl_market_on_balances_panel}
    Verify Element Text Shoud Not Be    ${cel_balances_table_on_balances_panel}    *
    
Verify How To Wallet Transfer Checkbox Disappear
    Wait Element Disappear    ${chk_show_market_value_configure_balance}
    
Verify Balances Analytics Tab Displays
    [Arguments]    ${empty_wallet}=${False}
    Run Keyword If    ${empty_wallet}==${False}    Verify Label Displays    Exchange Wallet Composition
    ...    ELSE    Verify Label Displays    No Balance found
    
Verify Balances Normal View Shown
    [Arguments]    ${currency}    ${wallet_type}
    ${expected_element}    Generate Element From Dynamic Locator    ${cel_currency_available_balance_on_balances_table}    ${currency}    ${wallet_type}
    Wait Element Is Visible    ${expected_element}

Verify Balances Compact View Shown
    [Arguments]    ${currency}    ${wallet_type}
    ${expected_element}    Generate Element From Dynamic Locator    ${cel_currency_available_balance_on_balances_table}    ${currency}    ${wallet_type}
    Wait Element Disappear    ${expected_element}
    
Verify Slide In Menu
    [Arguments]    ${currency}
    Verify Label Displays    ${currency}${SPACE}Exchange Wallet
    Verify Label Displays    Total
    Verify Label Displays    Available
    Verify Label Displays    Equivalent (Total)
    
Verify Displaying Currency On Equivalent
    [Arguments]    ${currency}    ${symbol_currency}    ${equivalent_currency}
    ${balance_element}    Generate Element From Dynamic Locator    ${cel_currency_balance_on_balances_table_lite_mode}    ${currency}    2
    ${element_text}    Get Element Text    ${balance_element}
    Should Contain    ${element_text}    ${symbol_currency}
    Verify Label Displays    ${equivalent_currency}${SPACE}EQUIVALENT
    
Verify Slide In Menu Fields
    [Arguments]    ${equivalent_total_currency}=${None}
    Run Keyword If    "${equivalent_total_currency}"!="${None}"    Verify Element Text Should Be    ${lbl_equivalent_total_currency}    ${SPACE}${equivalent_total_currency}    delay=1s