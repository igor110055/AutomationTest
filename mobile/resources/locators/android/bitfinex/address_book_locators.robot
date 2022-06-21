*** Variables ***
${btn_add_address_address_book}    xpath=//android.widget.TextView[@text="Add Address"]
${drd_select_cryptocurrency}    accessibility_id=address_book_select
${txt_label_address_book}    accessibility_id=address_book_label
${txt_address_address_book}    accessibility_id=address_book_address
${btn_submit_address_book}    accessibility_id=address_book_submit
${btn_paste_address_address_book}    xpath=//android.widget.EditText[@content-desc="address_book_address"]/following-sibling::android.view.ViewGroup

# DYNAMIC
${btn_delete_address_icon_by_address}    xpath=//android.widget.TextView[@text="Address: _DYNAMIC_0"]/following-sibling::android.view.ViewGroup/android.view.ViewGroup