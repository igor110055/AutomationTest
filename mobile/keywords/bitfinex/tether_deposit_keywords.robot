*** Settings ***
Resource    ../../resources/locators/android/bitfinex/tether_deposit_locators.robot

*** Keywords ***
Verify Tether Deposit Screen Displays
    Verify Label Displays    Please send assets to Tether deposit address displayed below. The deposit will be credited in your exchange wallet.