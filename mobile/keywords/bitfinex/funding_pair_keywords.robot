*** Settings ***
Resource    ../../resources/locators/android/bitfinex/funding_pair_locators.robot
Resource    ../../../utility/common/number_common.robot
*** Keywords ***
Tap Panel On Funding Pair
    [Arguments]    ${panel_name}    ${swipe}=${None}
    Run Keyword If    '${panel_name}'=='CHART'    Click Visible Element    ${pnl_chart_funding}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='FUNDING'    Click Visible Element    ${pnl_funding_offer_funding}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='FUNDING BOOK'    Click Visible Element    ${pnl_funding_book_funding}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='FUNDING EARNINGS'    Click Visible Element    ${pnl_funding_earnings_funding}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='TAKEN (UNUSED)'    Click Visible Element    ${pnl_taken_unused_funding}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='TAKEN (USING)'    Click Visible Element    ${pnl_taken_using_funding}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='PROVIDED'    Click Visible Element    ${pnl_provided_funding}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='BIDS & OFFERS'    Click Visible Element    ${pnl_bids_and_offers_funding}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='AUTORENEW FORM'    Click Visible Element    ${pnl_autorenew_form_funding}    swipe=${swipe}
    ...    ELSE IF    '${panel_name}'=='MATCHED'    Click Visible Element    ${pnl_matched_funding}    swipe=${swipe}
    # Run Keyword If    '${panel_name}'=='CHART'    Swipe To Element    ${pnl_chart_funding}    ratio=0.2    swipe=${swipe}
    # ...    ELSE IF    '${panel_name}'=='FUNDING'    Swipe To Element    ${pnl_funding_offer_funding}    ratio=0.2    swipe=${swipe}
    # ...    ELSE IF    '${panel_name}'=='FUNDING BOOK'    Swipe To Element    ${pnl_funding_book_funding}    ratio=0.2    swipe=${swipe}
    # ...    ELSE IF    '${panel_name}'=='FUNDING EARNINGS'    Swipe To Element    ${pnl_funding_earnings_funding}    ratio=0.2    swipe=${swipe}
    # ...    ELSE IF    '${panel_name}'=='TAKEN (UNUSED)'    Swipe To Element    ${pnl_taken_unused_funding}    ratio=0.2    swipe=${swipe}
    # ...    ELSE IF    '${panel_name}'=='TAKEN (USING)'    Swipe To Element    ${pnl_taken_using_funding}    ratio=0.2    swipe=${swipe}
    # ...    ELSE IF    '${panel_name}'=='PROVIDED'    Swipe To Element    ${pnl_provided_funding}    ratio=0.2    swipe=${swipe}
    # ...    ELSE IF    '${panel_name}'=='BIDS & OFFERS'    Swipe To Element    ${pnl_bids_and_offers_funding}    ratio=0.2    swipe=${swipe}
    # ...    ELSE IF    '${panel_name}'=='AUTORENEW FORM'    Swipe To Element    ${pnl_autorenew_form_funding}    ratio=0.2    swipe=${swipe}
    # ...    ELSE IF    '${panel_name}'=='MATCHED'    Swipe To Element    ${pnl_matched_funding}    ratio=0.2    swipe=${swipe}

Tap Matched Panel Tab On Funding
    [Arguments]    ${tab_name}
    Run Keyword If    '${tab_name}'=='Market'    Click Visible Element    ${btn_market_trades_panel_funding}
    ...    ELSE IF    '${tab_name}'=='Yours'    Click Visible Element    ${btn_yours_trades_panel_funding}
    Sleep    2s

Tap Full Book Funding Book Panel on Funding
    [Arguments]    ${locale}
    Import Resource    ${CURDIR}../../../resources/testdata/locale/${locale}/funding_pair_locale.robot
    ${full_book_element}    Generate Element From Dynamic Locator    ${lnk_full_funding_matched_funding}    ${LOCALE_FULL_BOOK}
    Click Visible Element    ${full_book_element}

Tap Balance Summary On Funding
    Click Visible Element    ${btn_balance_summary_funding}

# FUNDING FORM
Tap Max Offer On Funding
    Click Visible Element    ${btn_max_offer_funding}

Tap Min Period On Funding
    Click Visible Element    ${btn_min_period_funding}

Tap Max Period On Funding
    Click Visible Element    ${btn_max_period_funding}

Tap Top Bid On Funding
    Click Visible Element    ${btn_top_bid_funding}

Tap Top Ask On Funding
    Click Visible Element    ${btn_top_ask_funding}
    
Input Rate Per Day
    [Arguments]    ${rate_per_day}
    Input Text Into Element    ${txt_rate_per_day_funding}    ${rate_per_day}
        
Scroll To Panel On Funding Pair
    [Arguments]    ${panel_name}    ${ratio}    ${swipe}=${None}    ${start_x}=${None}
    Run Keyword If    '${panel_name}'=='FUNDING'    Swipe To Element    ${pnl_funding_offer_funding}    ${ratio}    ${swipe}    start_x=${start_x}
    ...    ELSE IF    '${panel_name}'=='BIDS & OFFERS'    Swipe To Element    ${pnl_bids_and_offers_funding}    ${ratio}    ${swipe}    start_x=${start_x}
    ...    ELSE IF    '${panel_name}'=='FUNDING BOOK'    Swipe To Element    ${pnl_funding_book_funding}    ${ratio}    ${swipe}    start_x=${start_x}

Verify Chart Loading Success On Funding
    [Arguments]    ${expected_load_time}
    Sleep	2s
    ${indicator_element}    Generate Element From Dynamic Locator    ${lbl_indicator_by_name_on_funding}    Balance of Power
    Wait Element Is Visible    ${indicator_element}    ${expected_load_time}
    ${average_indicator_element}    Generate Element From Dynamic Locator    ${lbl_indicator_by_name_on_funding}    Average Price
    Wait Element Is Visible    ${average_indicator_element}    ${expected_load_time}
    Wait Element Is Visible    ${btn_volume_on_chart_on_funding}    ${expected_load_time}
    
Verify Matched Panel Is Loaded
    [Arguments]    ${locale}
    Import Resource    ${CURDIR}../../../resources/testdata/locale/${locale}/funding_pair_locale.robot
    ${full_funding_element}    Generate Element From Dynamic Locator    ${lnk_full_funding_matched_funding}    ${LOCALE_FULL_FUNDING}
    Swipe Down To Element    ${full_funding_element}    ratio=0.25
    Wait Element Is Visible    ${full_funding_element}
    
Verify Funding Book Panel Is Loaded
    [Arguments]    ${locale}
    Import Resource    ${CURDIR}../../../resources/testdata/locale/${locale}/funding_pair_locale.robot
    ${full_book_element}    Generate Element From Dynamic Locator    ${lnk_full_book_fundingbook_funding}    ${LOCALE_FULL_BOOK}
    Swipe Down To Element    ${full_book_element}    ratio=0.25
    Wait Element Is Visible    ${full_book_element}
    
Verify Full Book Screen Displays On Funding
    Wait Element Is Visible    ${lbl_total_bids_full_book_funding}
    Sleep    5s
    
Verify Balance Summary Displays
    Wait Element Is Visible    ${lbl_funding_wallet_funding}
    
Verify Max Offer Populated On Funding
    ${offer_amount}    Get Element Text    ${txt_amount_funding}
    Should Not Be Empty    ${offer_amount}
    
Verify Period Field On Funding
    [Arguments]    ${expected_value}
    ${period_value}    Get Element Text    ${txt_period_funding}
    Should Be Equal    ${period_value}    ${expected_value}
    
Verify Top Bid Populated On Funding
    ${period_value}    Get Element Text    ${txt_rate_per_day_funding}
    ${period_value}    Extract Number From String    ${period_value}
    ${top_bid_value}    Get Element Text    ${btn_top_bid_funding}
    ${top_bid_value}    Extract Number From String    ${top_bid_value}
    Should Be Equal    ${period_value}    ${top_bid_value}
    
Verify Top Ask Populated On Funding
    ${period_value}    Get Element Text    ${txt_rate_per_day_funding}
    ${period_value}    Extract Number From String    ${period_value}
    ${top_ask_value}    Get Element Text    ${btn_top_ask_funding}
    ${top_ask_value}    Extract Number From String    ${top_ask_value}
    Should Be Equal    ${period_value}    ${top_ask_value}