*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/calculator_keywords.robot

Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login And Set Up Pin Turkish App    ${TEST_DATA_PAPER_TRADING_API_KEY}    ${TEST_DATA_PAPER_TRADING_API_SECRET}    Production    lite_mode=${True}
Suite Teardown    Close Test Application


*** Test Cases ***
lite_mode_order_form_calculator_fields
    Tap On Navigation Tab By Name    Trading
    Access Trading Pair    TESTBTC:TESTUSD
    Select Order Form Tab    Calculator
    Verify Lite Calculator
    
lite_mode_order_form_calculator_long
    Input Calculator Fields    trade_type=LONG    entry_price=2000    exit_price=3000    amount_base=1
    Verify Amount Quote Value    2000.00
    Verify Profit Loss Values    1,000    50%
    
lite_mode_order_form_calculator_short
    Input Calculator Fields    trade_type=SHORT    entry_price=2000    exit_price=3000    amount_base=1
    Verify Amount Quote Value    2000.00
    Verify Profit Loss Values    -1,000    -50%

slider_max
    Tap On Back Button
    Swipe To Panel    ORDERS    0.1    swipe=DOWN
    Tap Element By Label    Market
    Input Order Price    9000
    Verify Percentage Textbox    100 %+
            
lite_mode_order_form_order_buy
    Create Market Order In Lite Mode    base_amount=35    transaction_type=BUY
    Create Market Order In Lite Mode    quote_amount=0.001    transaction_type=SELL