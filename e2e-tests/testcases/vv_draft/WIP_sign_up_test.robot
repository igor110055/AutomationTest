*** Settings ***
Documentation    sign_up_test
...    https://bitfinex.ontestpad.com/script/750#//

Resource    ../../../mobile/resources/init.robot
Resource    ../../../mobile/keywords/bitfinex/common_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/create_account_keywords.robot
Resource    ../../../mobile/keywords/bitfinex/login_keywords.robot
Resource    ../../../utility/common/google_authenticator_common.robot

# Test Setup    Open Apps    Bitfinex
# Test Teardown    Close Test Application

*** Test Cases ***
sign_up_test
    [Documentation]    sign_up_test
    [Tags]    smoke     staging
    Tap Sign Up Button
    Fill Account Information    automation2307    automation2307@yopmail.com    Logi@1234    Logi@1234    ${True}
    
    Create Account    username=autom
    Verify Username Validation Message    Please enter at least 6 characters.
    Create Account    username=automation test
    Verify Username Validation Message    Allowed characters: letters, numbers, and .-_@
    Create Account    username=vuongvvv
    Verify Username Validation Message    Username already taken

    Create Account    username=automation2307    email=invalidemail@@yopmail.com
    Verify Email Validation Message    Please enter a valid email address
    Create Account    email=vuongvvv@gmail.com
    Verify Email Validation Message    Email already taken
    
    Create Account    email=automation2307@yopmail.com    password=Logi@12
    Verify Password Validation Message    Passwords must be at least 8 characters with one uppercase letter, one number, and one special character
    Verify Confirm Password Validation Message    Please enter the same value again.
    Create Account    password=logi@1234
    Verify Password Validation Message    Passwords must be at least 8 characters with one uppercase letter, one number, and one special character
    Verify Confirm Password Validation Message    Please enter the same value again.
    Create Account    password=automation@password
    Verify Password Validation Message    Passwords must be at least 8 characters with one uppercase letter, one number, and one special character
    Verify Confirm Password Validation Message    Please enter the same value again.
    Create Account    password=Logi1234
    Verify Password Validation Message    Passwords must be at least 8 characters with one uppercase letter, one number, and one special character
    Verify Confirm Password Validation Message    Please enter the same value again.
    
    Create Account    password=Logi@1234    confirm_password=Logi@12345
    Verify Confirm Password Validation Message    Please enter the same value again.
    
    Create Account    confirm_password=Logi@1234    tap_password_acknowledge=${True}
    Verify Sign Up Button Is Disabled
    
    Create Account    tap_password_acknowledge=${True}
    Enter Pin Code    8
    Enter Pin Code    9
    Enter Pin Code    8
    
    Tap Close Icon
    Tap Back On Cancel Signup Popup
    
    Tap View QR And Secret Code
    Copy Secret Code    TEST_DATA_SECRET_CODE
    
    Get Google Authenticator Code    ${TEST_DATA_SECRET_CODE}    TEST_DATA_OTP_CODE