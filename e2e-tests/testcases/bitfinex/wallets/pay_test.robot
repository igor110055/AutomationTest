*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/fast_pay_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/fast_pay_support_keywords.robot

Resource    ../../../../mobile/resources/testdata/staging/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Staging
Suite Teardown    Close Test Application
*** Variables ***
${invoice_ln_btc_1usd_vuong0204}    lightning:lnbc23060n1psmcrpxpp5wxtanp7aj7uvj2egdwme7qtkawy9f5lyavp258r3m7ffc4yx9l6qdp5xpjrwcenxu6xvdtr89nrscfnvvmnqvesxsckydekvcmxyvehvdsscqzpgxq9f395qsp5grpfym6e8lw0xdw482lakhqq0dttz5hjftnqklgsyh5pt3jxclqq9qyyssq6ldrty4zp4s8kzmgxa7pgqeg78257nh4rs3rfmes5aad6pjcj0lqtsxr2r2yf96jwqu2vfz7u03jlwe0vwly99zetvxmrl6z2tzvy6qpym7z9e
${invoice_tether_1usd_on_ethereum_vuong0204}    usdt_erc20:0xEfE91280fdE5923B9E4ca854cc8c3c0A92FC2f6E?amount=1.00503

*** Test Cases ***
wallets_pay_access
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Pay

show_btc_sat_mode
    Toggle BTC SAT View Mode
    Verify View Mode    SAT
    Tap Receive Button
    Verify BTC SAT Mode On Receive    SAT
    Input Amount To Receive    10
    Verify Equivalent Amount Displays In Mode    SAT
    Tap Receive Amount Equivalent Swap Button
    Verify Equivalent Amount Displays In Mode    $
    Tap Receive Amount Equivalent Swap Button
    Verify Second Part Of Receive Amount Displays In Mode    ${SPACE}BTC
    Verify Equivalent Amount Displays In Mode    $
    Tap Receive Amount Equivalent Swap Button
    Verify Equivalent Amount Displays In Mode    SAT
    Tap On Back Button
    
    Toggle BTC SAT View Mode
    Verify View Mode    BTC
    Tap Receive Button
    Verify BTC SAT Mode On Receive    BTC
    Input Amount To Receive    10
    Verify Equivalent Amount Displays In Mode    BTC
    Tap Receive Amount Equivalent Swap Button
    Verify Equivalent Amount Displays In Mode    $
    Tap Receive Amount Equivalent Swap Button
    Verify Second Part Of Receive Amount Displays In Mode    ${SPACE}SAT
    Verify Equivalent Amount Displays In Mode    $
    Tap Receive Amount Equivalent Swap Button
    Verify Equivalent Amount Displays In Mode    BTC
    Tap On Back Button
    
support_information
    Tap Fast Pay Support Icon
    Tap Element By Label    What is Fast Pay?
    Verify Label Displays    What is Fast Pay?
    Tap Close Icon
    Tap Element By Label    What is my spending limit?
    Verify Label Displays    What is my spending limit?
    Tap Close Icon
    Tap Element By Label    How to set up faster payments?
    Verify Label Displays    How to skip 2FA when using the Fast Pay feature        
    Tap Close Icon
    Close Fast Pay Support Screen

recent_transactions
    Tap Recent Transaction Record    1
    Tap Element By Label    Amount
    Verify Label Displays    Copied to clipboard    wait_disappear=${True}
    Verify Label Displays    Time
    Tap Element By Label    Description
    Verify Label Displays    Copied to clipboard    wait_disappear=${True}
    Tap Element By Label    Order Id
    Verify Label Displays    Copied to clipboard    wait_disappear=${True}
    Tap Element By Label    Tx Id
    Verify Label Displays    Copied to clipboard    wait_disappear=${True}
    
fast_pay_config
    Tap On Back Button
    Tap Fast Pay Config Icon
    Verify Label Displays    Skip 2FA for small payments