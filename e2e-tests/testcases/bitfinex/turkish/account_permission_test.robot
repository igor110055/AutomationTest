*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot

Suite Teardown    Close Test Application

*** Test Cases ***
no_get_account_information_verification
    Open Apps    BitfinexTurkish
    Login And Set Up Pin Turkish App    ${TEST_DATA_FULL_VERIFIED_NO_GET_ACCOUNT_INFORMATION_API_KEY}    ${TEST_DATA_FULL_VERIFIED_NO_GET_ACCOUNT_INFORMATION_API_SECRET}    Production
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Verification
    Verify Label Displays    Require 'Get account fee information' permission to view KYC status and documents
    
no_get_account_information_affilate
    Tap On Back Button
    Tap On Account Menu Item    Affiliate
    Verify Label Displays    Require 'Get account fee information' permission to view affiliate revenues

no_get_account_information_reports
    Tap On Back Button
    Tap On Account Menu Item    Reports
    Verify Label Displays    Require 'Get account fee information' permission to view reports and account information
    Close Test Application
    
no_edit_account_information_verification
    Open Apps    BitfinexTurkish
    Login And Set Up Pin Turkish App    ${TEST_DATA_FULL_VERIFIED_NO_EDIT_ACCOUNT_INFORMATION_API_KEY}    ${TEST_DATA_FULL_VERIFIED_NO_EDIT_ACCOUNT_INFORMATION_API_SECRET}    Production
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Verification
    Verify Label Displays    Require 'Edit account information' permission to upload or manage KYC documents
    Verify Label Displays    Verification

no_edit_account_information_affilate
    Tap On Back Button
    Tap On Account Menu Item    Affiliate
    Verify Label Displays    Require 'Edit account information' permission to generate new affiliate code
    Verify Label Displays    Overview
    
no_edit_account_information_reports
    Tap On Back Button
    Tap On Account Menu Item    Reports
    Verify Label Displays    Account Summary