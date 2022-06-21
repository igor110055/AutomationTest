*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/funding_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/calculator_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_PAPER_TRADING_API_KEY}    ${TEST_DATA_PAPER_TRADING_API_SECRET}    Production
Suite Teardown    Close Test Application
*** Test Cases ***
funding_order_form_tabs
    Tap On Navigation Tab By Name    Funding
    Access Trading Pair On Funding    TESTUSD
    Scroll To Panel On Funding Pair    FUNDING BOOK    0.2    DOWN
    Verify Funding Form

funding_order_form_max_offer
    Tap Max Offer On Funding
    Verify Max Offer Populated On Funding

funding_order_form_min_period
    Tap Min Period On Funding
    Verify Period Field On Funding    2
    
funding_order_form_max_period
    Tap Max Period On Funding
    Verify Period Field On Funding    120
    
funding_order_form_top_bid
    Tap Top Bid On Funding
    Verify Top Bid Populated On Funding
    
funding_order_form_top_ask
    Tap Top Ask On Funding
    Verify Top Ask Populated On Funding
    
*** Keywords ***
Verify Funding Form
    Tap Balance Summary On Funding
    Verify Balance Summary Displays
    Tap Balance Summary On Funding