*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/deposit_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/tether_deposit_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
usd
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Deposit
    Select Payment Type On Deposit    Bank wire
    Select Curency Dropdown Item    US Dollar (USD)
    Verify Label Displays    By creating this deposit, I confirm that I will send a wire transfer with the correct transaction reference and I accept that some fees may be applied by the banks involved in the transaction. Bitfinex fee structure 0.1% (min 60.0 USD)
    Verify Label Displays    Notice regarding wiring other currencies than USD
    Verify Label Displays    In case the customer wires funds with the wrong currency (other than USD), Bitfinex will not be responsible for the exchange rate conversion applied upon arrival of such funds. Bitfinex will credit the amount provided by the bank in USD after conversion, based on the rates applied by our bank at the time of conversion.
    
gbp
    Select Curency Dropdown Item    Pound Sterling (GBP)
    Verify Label Displays    By creating this deposit, I confirm that I will send a wire transfer with the correct transaction reference and I accept that some fees may be applied by the banks involved in the transaction. Bitfinex fee structure 0.1% (min 60.0 GBP)
    Verify Label Displays    Notice regarding wiring other currencies than GBP
    Verify Label Displays    In case the customer wires funds with the wrong currency (other than GBP), Bitfinex will not be responsible for the exchange rate conversion applied upon arrival of such funds. Bitfinex will credit the amount provided by the bank in GBP after conversion, based on the rates applied by our bank at the time of conversion.

jpy
    Select Curency Dropdown Item    Japanese Yen (JPY)
    Verify Label Displays    By creating this deposit, I confirm that I will send a wire transfer with the correct transaction reference and I accept that some fees may be applied by the banks involved in the transaction. Bitfinex fee structure 0.1% (min 60.0 JPY)
    Verify Label Displays    Notice regarding wiring other currencies than JPY
    Verify Label Displays    In case the customer wires funds with the wrong currency (other than JPY), Bitfinex will not be responsible for the exchange rate conversion applied upon arrival of such funds. Bitfinex will credit the amount provided by the bank in JPY after conversion, based on the rates applied by our bank at the time of conversion.

cnh
    Select Curency Dropdown Item    CNH (CNH)
    Verify Label Displays    By creating this deposit, I confirm that I will send a wire transfer with the correct transaction reference and I accept that some fees may be applied by the banks involved in the transaction. Bitfinex fee structure 0.1% (min 60.0 CNH)
    Verify Label Displays    Notice regarding wiring other currencies than CNH
    Verify Label Displays    In case the customer wires funds with the wrong currency (other than CNH), Bitfinex will not be responsible for the exchange rate conversion applied upon arrival of such funds. Bitfinex will credit the amount provided by the bank in CNH after conversion, based on the rates applied by our bank at the time of conversion.
        
euro_openpayd
    Select Curency Dropdown Item    Euro (EUR)
    Tap Element By Label    OpenPayd
    Verify Label Displays    I acknowledge that some fees may be applied by OpenPayd and by the banks involved in the transaction. Bitfinex’s fee structure is 0.5 EUR per transaction.
    Verify Label Displays    Notice regarding wiring other currencies than EUR    swipe=DOWN
    Verify Label Displays    In case the customer wires funds with the wrong currency (other than EUR), Bitfinex will not be responsible for the exchange rate conversion applied upon arrival of such funds. Bitfinex will credit the amount provided by the bank in EUR after conversion, based on the rates applied by our bank at the time of conversion.    swipe=DOWN
    
euro_manual_instruction
    Tap Element By Label    Manual Instructions    swipe=UP
    Verify Label Displays    By creating this deposit, I confirm that I will send a wire transfer with the correct transaction reference and I accept that some fees may be applied by the banks involved in the transaction. Bitfinex fee structure 0.1% (min 60.0 EUR)
    Verify Label Displays    Notice regarding wiring other currencies than EUR    swipe=DOWN
    Verify Label Displays    In case the customer wires funds with the wrong currency (other than EUR), Bitfinex will not be responsible for the exchange rate conversion applied upon arrival of such funds. Bitfinex will credit the amount provided by the bank in EUR after conversion, based on the rates applied by our bank at the time of conversion.    swipe=DOWN
    
