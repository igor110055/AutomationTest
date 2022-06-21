*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/verification_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/reports_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/borrow_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/leaderboard_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/affiliate_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/bitrefill_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/staking_rewards_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/appearance_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/themes_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/language_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/zoom_fonts_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/changelog_updates_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/price_alerts_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/notification_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/support_center_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/live_chat_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/permissions_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/address_book_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/sub_account_details_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/login_settings_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/change_pin_code_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/fast_pay_keywords.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production    lite_mode=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
verification
    Tap On Navigation Tab By Name    Account
    Tap On Account Menu Item    Verification
    Verify Verification Screen Displays
    Tap Manage Documents
    Verify Verification Documents

reports    
    Tap On Back Button     2
    Tap On Account Menu Item    Reports
    Verify Reports Screen Displays
    
affiliate_program
    Tap On Back Button
    Tap On Account Menu Item    Affiliate
    Verify Affiliate Screen Displays

shopping_bitrefill
    Tap On Back Button
    Tap On Account Menu Item    Shopping
    Verify Bitrefill Screen Displays
    Tap I Icon
    Tap Okay On Bitrefill Popup
    
settings_login_appearance_not_shown
    Tap On Back Button
    Tap On Account Menu Item    Settings
    Verify Label Not Display    Appearance
    
settings_login_settings
    Tap On Account Menu Item    Login Settings
    Verify Login Settings Displays

settings_login_settings_update_timeout
    Update Timeout    600
    
settings_login_settingschange_pin_code
    Tap On Account Menu Item    Change PIN Code
    Update Pin Code    8888    9999
        
settings_themes    
    Tap On Back Button
    Tap On Account Menu Item    Themes
    Verify Themes Screen Displays
    Verify Changing Theme
    
settings_language
    Tap On Back Button
    Tap On Account Menu Item    Language
    Verify Language Screen Displays
    Select Language    Русский
    Tap On Account Menu Item    Язык
    Select Language    English

settings_price_alert    
    Tap On Account Menu Item    Price Alerts
    Create Price Alert    1INCH/USD    USD    default
    Close Price Alert    1INCH/USD
    Create Price Alert    BTC/USD    USD    35000
    Close Price Alert    BTC/USD

settings_notifications    
    Tap On Back Button
    Tap On Account Menu Item    Notifications
    Verify Notifications Screen Displays
    Verify Label Displays    Orders
    Verify Label Displays    Price Alerts
    Verify Label Not Display    Price Change with Trailing Stop Order
    Verify Label Not Display    Funding Offer
    Verify Label Displays    Sound alerts - Order fully executed
    
settings_zoom_fonts
    Tap On Back Button
    Tap On Account Menu Item    Zoom Fonts
    Verify Zoom Fonts Screen Displays
    
settings_changelog
    Tap On Back Button
    Tap On Account Menu Item    Changelog Updates
    Verify Changelog Updates Screen Displays

contact_support_create_ticket
    Tap On Back Button    2
    Tap On Account Menu Item    Contact Support
    Tap On Account Menu Item    Create Ticket
    Verify Support Center Screen Displays
    
contact_support_live_chat
    Tap On Back Button
    Tap On Account Menu Item    Live Chat
    Send Message    Hello There
    Verify Message In Live Chat Panel    What can I do for you?
    
others
    Tap Device Back Button
    Tap On Back Button
    Tap On Account Menu Item    Others
    Verify Others Screen Displays

others_announcement
    Tap On Account Menu Item    Announcements
#    Verify Page Opens In Browser    Bitfinex will support the Streamr (DATA) Migration
    Verify Label Displays   Announcements
    Tap Device Back Button

others_knowledge_base
    Tap On Account Menu Item    Knowledge Base
    Verify Page Opens In Browser    Welcome to the Bitfinex Help Center
    Tap Device Back Button

others_security_policies
    Tap On Account Menu Item    Security Policies
    Verify Page Opens In Browser    Your security is our priority
    Tap Device Back Button

others_community  
    Tap On Account Menu Item    Community
    Verify Community Screen Displays
    
others_community_telegram
    Tap On Account Menu Item    Telegram
    Verify Page Opens In Browser    The official Bitfinex telegram channel.
    Tap Device Back Button

others_community_twitter    
    Tap On Account Menu Item    Twitter
    Verify Page Opens In Browser    Bitfinex is the world's leading digital asset trading platform.
    Tap Device Back Button

others_community_reddit
    Tap On Account Menu Item    Reddit
    Verify Page Opens In Browser    Community Details
    Tap Device Back Button
    
others_community_medium
    Tap On Account Menu Item    Medium
    Verify Medium Opens In Browser
    Tap Device Back Button
    
others_legal
    Tap On Back Button
    Tap On Account Menu Item    Legal
    Verify Legal Screen Displays

others_legal_terms_of_service
    Tap On Account Menu Item    Terms of Service
    Verify Page Opens In Browser    IMPORTANT: By creating or funding an Account or accessing or using any of the Services (each as defined below)
    Tap Device Back Button

others_legal_api_terms_of_service
    Tap On Account Menu Item    API Terms of Service
    Verify Page Opens In Browser    Bitfinex API Terms of Service
    Tap Device Back Button

others_legal_rrt_token_term
    Tap On Account Menu Item    RRT Token Terms
    Verify Page Opens In Browser    Recovery Right Token (RRT) Terms
    Tap Device Back Button

others_legal_risk_disclosure_statement
    Tap On Account Menu Item    Risk Disclosure Statement
    Verify Page Opens In Browser    Risk Disclosure Statement
    Tap Device Back Button

others_legal_privacy_policy
    Tap On Account Menu Item    Privacy Policy
    Verify Page Opens In Browser    Bitfinex Privacy Statement
    Tap Device Back Button

others_legal_cookies_policy
    Tap On Account Menu Item    Cookies Policy
    Verify Page Opens In Browser    Cookies Policy
    Tap Device Back Button
        
others_legal_law_enforcement_request_policy
    Tap On Account Menu Item    Law Enforcement Request Policy
    Verify Page Opens In Browser    Bitfinex Law Enforcement Requests Policy
    Tap Device Back Button
        
others_legal_trademark_notices
    Tap On Account Menu Item    Trademark Notices
    Verify Page Opens In Browser    Trademarks Notices
    Tap Device Back Button
        
others_legal_anti_spam_policy
    Tap On Account Menu Item    Anti-Spam Policy
    Verify Page Opens In Browser    Anti-Spam Policy
    Tap Device Back Button
        
others_legal_affiliate_program_terms
    Tap On Account Menu Item    Affiliate Program Terms
    Verify Page Opens In Browser    Affiliate Program Terms
    Tap Device Back Button
        
others_derivatives
    Tap On Back Button
    Tap On Account Menu Item    Derivatives
    Verify Derivatives Screen Displays

others_derivatives_derivatives_terms_of_services
    Tap On Account Menu Item    Derivative Terms of Service
    Verify Page Opens In Browser    Derivative Terms of Service
    Tap Device Back Button
    
others_derivatives_derivatives_fee_and_margin_schedule
    Tap On Account Menu Item    Derivative Fee and Margin Schedule
    Verify Page Opens In Browser    Derivative Fee and Margin Schedule
    Tap Device Back Button

others_derivatives_derivatives_product_descriptions
    Tap On Account Menu Item    Product Descriptions
    Verify Page Opens In Browser    Derivative Product Description
    Tap Device Back Button

others_derivatives_perpetual_contract_funding_summary
    Tap On Account Menu Item    Perpetual Contract Funding Summary
    Verify Page Opens In Browser    Funding Payment Summary
    Tap Device Back Button

others_derivatives_derivative_products_risk_disclosure_statement
    Tap On Account Menu Item    Derivative Products Risk Disclosure Statement
    Verify Page Opens In Browser    Derivative Products Risk Disclosure Statement
    Tap Device Back Button

others_our_fees
    Tap On Back Button
    Tap On Account Menu Item    Our Fees
    Verify Page Opens In Browser    Fees Calculator
    Tap Device Back Button

account
    Tap On Back Button
    Tap On Account Menu Item    Account    down
    Verify Account Screen Displays
    
account_permissions
    Tap On Account Menu Item    Permissions    swipe_direction=up
    Verify Checkbox By Name    Get account fee information
    
account_address_book
    Tap On Back Button
    Tap On Account Menu Item    Address Book
    Tap Add Address Button
    
account_sub_account
    Tap On Back Button
    Tap Sub Account    vuongvvvsub
    Verify Sub Account Details Screen