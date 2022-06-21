*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/stake_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/cryptocurrency_deposit_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production    lite_mode=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
disclaimer
    Tap On Navigation Tab By Name    Stake
    Verify Label Displays    Calculate your potential rewards
    Tap Element By Label    * This is the estimated annual staking reward for staked tokens. Actual annualized staking rewards may differ. Learn more
    Verify Label Displays    STAKE DISCLAIMER
    Tap Close Icon
    Verify Label Displays    Please select
    Verify Estimation Rewards In Usd    0.00 USD    0.00 USD    0.00 USD    0.00 USD
    
stake_support
    Tap Stake Support Faq Button
    Tap Element By Label    How it works?
    Verify Label Displays    HOW IT WORKS
    Tap Close Icon
    Tap Element By Label    How frequently will I receive staking rewards?
    Verify Label Displays    How frequently will I receive staking rewards?
    Tap Close Icon
    Tap Element By Label    Is there a minimum/maximum digital token holdings requirement to start staking?
    Verify Label Displays    Is there a minimum/maximum digital token holdings requirement to start staking?
    Tap Close Icon
    Tap Element By Label    Do I have to pay fees to use this service?
    Verify Label Displays    Do I have to pay fees to use this service?
    Tap Close Icon
    Tap Element By Label    Is it safe and how does Bitfinex stake my digital tokens?
    Verify Label Displays    Is it safe and how does Bitfinex stake my digital tokens?
    Tap Close Icon
    Tap Element By Label    So I just leave my digital tokens in my Bitfinex account and they earn rewards?
    Verify Label Displays    So I just leave my digital tokens in my Bitfinex account and they earn rewards?
    Tap Close Icon 
    Tap Element By Label    Who makes the governance decisions with my tokens?
    Verify Label Displays    Who makes the governance decisions with my tokens?
    Tap Close Icon 
    Tap Element By Label    Will I still be able to trade or withdraw my staked tokens?
    Verify Label Displays    Will I still be able to trade or withdraw my staked tokens?
    Tap Close Icon 
    Tap Element By Label    How do I stake Ethereum (ETH2)?
    Verify Label Displays    How do I stake Ethereum (ETH2)?
    Tap Close Icon 
    Tap Stake Support Close Icon
    
stake_i_want_to_stake_dropdown_items
    Tap I Want To Stake Dropdown
    Verify I Want To Stake Dropdown Item    TRON (TRX)    6% - 8%*
    Verify I Want To Stake Dropdown Item    EOS (EOS)    0% - 3%*
    Verify I Want To Stake Dropdown Item    Tezos (XTZ)    3% - 5%*
    Verify I Want To Stake Dropdown Item    Cosmos-Atom (ATOM)    1.5% - 3%*
    Verify I Want To Stake Dropdown Item    Algorand (ALGO)    3% - 5%*
    Verify I Want To Stake Dropdown Item    Solana (SOL)    Up to 6.5%*
    Verify I Want To Stake Dropdown Item    MATIC (Ethereum) (MATIC)    15% - 17% for a limited time*
    Verify I Want To Stake Dropdown Item    Cardano ADA (ADA)    4% - 5%*
    Verify I Want To Stake Dropdown Item    Polkadot (DOT)    Up to 7%*
    Verify I Want To Stake Dropdown Item    ETH2 (ETH2)    Up to 10%*
    Verify I Want To Stake Dropdown Item    Kusama (KSM)    Up to 8%*

deposit    
    Select I Want To Stake Dropdown    Polkadot (DOT)
    Input Stake Amount    300
    Verify Estimation Rewards In Usd    1.33 USD    8.87 USD    38.82 USD    465.80 USD
    Verify Estimation Rewards In Crypto    0.06 DOT    0.40 DOT    1.75 DOT    21.00 DOT
    Verify Label Displays    Estimated annual staking rewards*
    Verify Label Displays    Up to 7%
    Tap Deposit Stake Button
    Verify Cryptocurrency Deposit Screen Displays