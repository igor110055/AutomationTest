*** Settings ***
Documentation    MARGIN_FUNDING

Resource    ../../resources/init.robot
Resource    ../../keywords/bitfinex/bitfinex_v2_common.robot
Resource    ../../keywords/bitfinex/margin_funding_keywords.robot

Test Setup    Create Bitfinex Session
Test Teardown     Delete All Sessions


*** Test Cases ***
MARGIN_FUNDING
    [Documentation]    MARGIN_FUNDING
    [Tags]    draft
    Post Active Funding Offers    fUSD
    Response Correct Code    ${SUCCESS_CODE}