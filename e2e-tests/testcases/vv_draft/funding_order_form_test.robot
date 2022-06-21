*** Settings ***

Resource    ../../../mobile/resources/init.robot
Resource    ../../../mobile/keywords/bitfinex/common_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/funding_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/funding_pair_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/calculator_keywords.robot

Suite Setup    Open Apps    Bitfinex
Suite Teardown    Close Test Application
*** Test Cases ***
funding_form_highest_bid
    [Documentation]    order_form_test
    [Tags]     smoke    prod_paper
    Tap On Navigation Tab By Name    Derivative
    Access Trading Pair On Funding    TESTUSD  
    Scroll To Panel On Funding Pair    FUNDING    0.20    DOWN
    