*** Settings ***
Resource    ../../resources/locators/android/bitfinex/sub_account_details_locators.robot

*** Keywords ***
Verify Sub Account Details Screen
    @{sub_account_details_fields}    Create List    Username    Email    Merchant Account    Paper Trading    Competition Trading    Email Confirmed?    Has Two-Factor Auth?    Withdrawal    Verification    Switching Disableable
    FOR    ${element}    IN    @{sub_account_details_fields}
        ${field_element}    Generate Element From Dynamic Locator    ${lbl_account_sub_accounts_by_username}    ${element}
        Wait Element Is Visible    ${field_element}
    END
    