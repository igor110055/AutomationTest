*** Variables ***
${btn_continue_to_borrow}    xpath=//android.widget.TextView[@text='Continue to Borrow']
${btn_wallet_icon}    accessibility_id=borrow_calc_header_balance_btn
${drd_i_want_to_borrow}    accessibility_id=borrow_calc_borrow_ccy_input
${drd_collateral_amount}    accessibility_id=borrow_calc_collateral_ccy_input
${txt_borrow_amount}    accessibility_id=borrow_calc_borrow_amount_input
${txt_collateral_amount}    accessibility_id=borrow_calc_collateral_amount_input
${btn_use_available_fund}    accessibility_id=borrow_calc_use_avaiable_fund_icon
${txt_period_days}    accessibility_id=borrow_calc_period_step_input
${lbl_period_days_limitation_error}    xpath=//android.widget.TextView[@text='Enter a number between 2 and 120']
${btn_how_it_works}    accessibility_id=borrow_calc_how_it_works_btn
${btn_okay_on_how_it_works_popup}    xpath=//android.widget.TextView[@text='Okay']
${btn_confirm_borrowing_on_borrow_confirmation_popup}    xpath=//android.widget.TextView[@text='Confirm Borrowing']
${chk_i_have_read_and_agree_on_borrow_confirmation_popup}    xpath=//android.widget.TextView[@text='I HAVE READ AND AGREE']
${chk_fixed_rate}    xpath=//android.view.ViewGroup[@content-desc="borrow_calc_fixed_rate"]/android.widget.TextView
${btn_borrow}    accessibility_id=borrow_calculator_submit_btn
${btn_okay_on_borrow_completed_popup}    xpath=//android.widget.TextView[@text='Okay']
${lbl_bitfinex_borrow}    xpath=//android.widget.TextView[@text='BITFINEX BORROW']
${lnk_add_funds}    xpath=//android.widget.TextView[@text='Add Funds']
${lbl_verified_at_basic_level_verified_warning_popup}    xpath=//android.widget.TextView[@text="Verified at Basic level"]
${btn_upgrade_verified_warning_popup}    xpath=//android.widget.TextView[@text="Upgrade"]
${btn_back_verified_warning_popup}    xpath=//android.widget.TextView[@text="Back"]
${lbl_you_can_borrow_currency}    xpath=//android.widget.TextView[@text="BTC, USDT, IOTA"]
${lbl_accepted_collateral_currency}    xpath=//android.widget.TextView[@text="BTC, USD, USDT, EUR, JPY, ETH"]

# DYNAMIC
${drd_currency_on_collateral_dropdown_by_text}    xpath=//android.widget.TextView[@text='_DYNAMIC_0']
${lnk_you_have_by_text}    xpath=//android.widget.TextView[contains(@text,'You can use ')][contains(@text,'_DYNAMIC_0')]