*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/signup_keywords.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Logout And Select Server    Staging
Suite Teardown    Close Test Application

*** Test Cases ***
sign_up_username_less_than_6_chars
    Tap Sign Up Button
    Submit Sign Up    vuong    vuongvvv+0410@gmail.com    Logi@1234    Logi@1234    country=Vietnam    confirm_password_check=${True}    referrer_code=PUB_ktE_3NzuW
    Verify Invalid Username Error Message    Please enter at least 6 characters.

sign_up_username_with_space
    Submit Sign Up    v uong
    Verify Invalid Username Error Message    Allowed characters: letters, numbers, and .-_@
    
sign_up_username_with_number
    Submit Sign Up    vuong1    invalidemail@@gmail.com
    Verify Label Not Display    Allowed characters: letters, numbers, and .-_@
    
sign_up_username_with_special_chars
    Submit Sign Up    vuong.
    Verify Label Not Display    Allowed characters: letters, numbers, and .-_@
    Submit Sign Up    vuong-
    Verify Label Not Display    Allowed characters: letters, numbers, and .-_@
    Submit Sign Up    vuong_
    Verify Label Not Display    Allowed characters: letters, numbers, and .-_@
    Submit Sign Up    vuong@
    Verify Label Not Display    Allowed characters: letters, numbers, and .-_@
    
sign_up_with_invalid_email
    Submit Sign Up    vuongvvv    invalidemail@@gmail.com
    Verify Invalid Username Error Message    Please enter a valid email address
    
sign_up_with_password_less_than_8_chars
    Submit Sign Up    email=invalidemail@gmail.com    password=Logi@12    confirm_password=Logi@12
    Verify Invalid Username Error Message    Password must be at least 8 characters with both upper and lowercase, 1 number and 1 special character

sign_up_with_password_no_uppercase
    Submit Sign Up    password=logi@1234    confirm_password=logi@1234
    Verify Invalid Username Error Message    Password must be at least 8 characters with both upper and lowercase, 1 number and 1 special character

sign_up_with_password_no_number
    Submit Sign Up    password=Logi@vuong    confirm_password=Logi@vuong
    Verify Invalid Username Error Message    Password must be at least 8 characters with both upper and lowercase, 1 number and 1 special character
    
sign_up_with_password_no_special_char
    Submit Sign Up    password=Logivuong    confirm_password=Logivuong
    Verify Invalid Username Error Message    Password must be at least 8 characters with both upper and lowercase, 1 number and 1 special character

sign_up_with_password_no_lowercase
    Submit Sign Up    password=LOGI@1234    confirm_password=LOGI@1234
    Verify Invalid Username Error Message    Password must be at least 8 characters with both upper and lowercase, 1 number and 1 special character

# sign_up_with_confirm_password_not_match
    # Submit Sign Up    password=Logi@1234    confirm_password=Logi@12345
    # Verify Invalid Username Error Message    Please enter the same value again.
    
sign_up_with_canada_ontario
    Submit Sign Up    password=Logi@1234    confirm_password=Logi@1234    country=Canada    region=Ontario
    Verify Registration Closed Error Message    We are sorry, new registrations for Ontario residents are now closed.

sign_up_with_prohibited_countries
    Verify Prohibited Country    United States
    Verify Prohibited Country    Crimea
    Verify Prohibited Country    Iran
    Verify Prohibited Country    Korea
    Verify Prohibited Country    Cuba
    Verify Prohibited Country    Syria
    Verify Prohibited Country    American Samoa
    Verify Prohibited Country    Donetsk People
    Verify Prohibited Country    Luhansk People
    Verify Prohibited Country    Virgin Islands, U.S.
    Verify Prohibited Country    Puerto Rico
    Verify Prohibited Country    Guam
    Verify Prohibited Country    Northern Mariana Islands
    
sign_up_with_japan
    Submit Sign Up    country=Japan
    Verify Element Contains Text    お客様は日本に居住されているようです。Bitfinexでは、日本居住者による新規登録の受付を停止しておりますため、日本居住者によるBitfinexの新規アカウントの登録ならびにサービスのお申し込みは行えません。
    Verify Element Contains Text    It appears you are a resident of Japan. Bitfinex is not permitting Japanese residents to sign-up for new Accounts. As a result, you may not create a Bitfinex Account or otherwise use Bitfinex Services.
    
*** Keywords ***
Verify Prohibited Country
    [Arguments]    ${country}
    Submit Sign Up    country=${country}
    Verify Registration Closed Error Message    Because of your country of residency, you are a Prohibited Person under our Terms of Service. You are not permitted to use the Services.