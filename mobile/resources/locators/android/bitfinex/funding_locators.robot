*** Variables ***
${txt_search_tickers_on_funding}    accessibility_id=Tickers-Search-Input
${btn_clear_search_tickers_on_funding}    accessibility_id=Tickers-Search-Clear-Button

# DYNAMIC
${tbl_cell_ticker_on_funding_by_name}    accessibility_id=tickers_table_f_DYNAMIC_0
${col_header_tickers_table_on_funding_by_name}    xpath=(//android.widget.TextView[@text='_DYNAMIC_0'])[1]
#BIDS & OFFERS
${cel_currency_on_bids_and_offers}    xpath=//android.view.ViewGroup[@content-desc="bids_offers_collapsible"]//following-sibling::android.widget.HorizontalScrollView//android.widget.TextView[@text='_DYNAMIC_0']
# TODAY' EARNINGS
${cel_today_earnings_earnings_by_currency}    xpath=//android.widget.TextView[@text="_DYNAMIC_0"]/following-sibling::android.widget.TextView[1]
${cel_today_earnings_value_by_currency}    xpath=//android.widget.TextView[@text="_DYNAMIC_0"]/following-sibling::android.widget.TextView[2]

# ELEMENTS
${tbl_name_cells_on_funding}    xpath=//android.view.ViewGroup[contains(@content-desc,"tickers_table")]//android.widget.TextView[1]
${tbl_last_cells_on_funding}    xpath=//android.view.ViewGroup[contains(@content-desc,"tickers_table")]//android.widget.TextView[2]