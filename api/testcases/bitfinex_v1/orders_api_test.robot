*** Settings ***
Documentation    ORDERS

Resource    ../../resources/init.robot
Resource    ../../keywords/bitfinex_v1/bitfinex_common.robot
Resource    ../../keywords/bitfinex_v1/orders_keywords.robot

Test Setup    Create Bitfinex V1 Session
Test Teardown     Delete All Sessions

*** Test Cases ***
orders_test
    [Documentation]    ORDERS
    [Tags]    Regression    High    Smoke
    Post New Order    { "symbol": "btcusd", "amount": "0.02", "price": "5", "side": "buy", "type": "exchange limit", "ocoorder": false }
    Response Correct Code    ${SUCCESS_CODE}
    Fetch Property From Response    id    ORDER_ID
    
    Post Multiple New Orders    { "orders": [{ "symbol": "btcusd", "amount": "0.02", "price": "5", "side": "buy", "type": "exchange limit" }, { "symbol": "btcusd", "amount": "0.02", "price": "5", "side": "buy", "type": "exchange limit" }]}
    Response Correct Code    ${SUCCESS_CODE}
    Fetch All Property Values    order_ids..id    ORDER_IDS
    
    Post Order Status    ${ORDER_ID}
    Response Correct Code    ${SUCCESS_CODE}
    
    Post Cancel Multiple Order    ${ORDER_IDS}
    Response Correct Code    ${SUCCESS_CODE}
    
    Post Cancel Order    ${ORDER_ID}
    Response Correct Code    ${SUCCESS_CODE}
    
    Post Cancel All Orders
    Response Correct Code    ${SUCCESS_CODE}
    
    Post Active Order
    Response Correct Code    ${SUCCESS_CODE}
    
    Post Order History
    Response Correct Code    ${SUCCESS_CODE}
    Response Property Should Be    .src    web
    Response Property Should Be Number    .original_amount
    Response Property Should Be Number    .executed_amount