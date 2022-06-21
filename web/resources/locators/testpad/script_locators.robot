*** Variables ***
${btn_create_new_test_run}    xpath://b[normalize-space()='+']
${drd_test_can_run_by}    xpath://div[@class='current_choice']//li[@class='anyone selected']
${btn_compose_and_send_email}    xpath://a[normalize-space()='compose and send email']
${btn_i_really_do_want_a_new_test}    xpath://a[normalize-space()='I really do want a New Test Run']
${txt_tester_alias}    xpath:(//textarea[@value='example'])[2]
${txt_build}    xpath:(//textarea[@value='example'])[6]
${txt_email_to}    xpath://div[@id='emailTo']//input[@class='value']
${btn_send_email}    id:sendEmail
${btn_save_test_run_details}    xpath://div[@id='run_edit_dialog']//span[@class='releaseUnlocked'][normalize-space()='save']

# DYNAMIC
${drd_test_can_run_by_item}    xpath://span[normalize-space()="_DYNAMIC_0"]