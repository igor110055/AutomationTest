*** Variables ***
${txt_search_tickers_on_derivatives}    accessibility_id=Tickers-Search-Input
${btn_clear_search_tickers_on_derivatives}    accessibility_id=Tickers-Search-Clear-Button
${btn_collapse_tickers_on_derivatives}    accessibility_id=Tickers-Collapsible

# DYNAMIC
${tbl_cell_ticker_on_derivatives_by_name}    accessibility_id=tickers_table_t_DYNAMIC_0
${col_header_tickers_table_on_derivatives_by_name}    xpath=(//android.widget.TextView[@text='_DYNAMIC_0'])[1]
${tbl_name_cells_on_derivatives}    xpath=//android.view.ViewGroup[contains(@content-desc,"tickers_table")]//android.widget.TextView[1]
${tbl_last_cells_on_derivatives}    xpath=//android.view.ViewGroup[contains(@content-desc,"tickers_table")]//android.widget.TextView[2]

# ELEMENTS
${tbl_cells_pair_name_on_derivatives}    xpath=//android.view.ViewGroup[contains(@content-desc,'tickers_table_')]