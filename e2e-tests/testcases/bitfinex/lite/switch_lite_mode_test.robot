*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_BASIC_VERIFIED_API_KEY}    ${TEST_DATA_BASIC_VERIFIED_API_SECRET}    Production    lite_mode=${True}
Suite Teardown    Close Test Application

*** Test Cases ***
russia
    Tap On Navigation Tab By Name    Account
    Change Language    en    Русский
    Tap On Back Button
    Verify Pro Lite Mode Switching    Облегченная версия (Lite)    Облегченная версия приложения (Lite) будет отображать баланс только вашего обменного кошелька. Вы всегда сможете вернуться к полной версии (Pro), чтобы просмотреть другие кошельки, открытые ордера и открытые позиции.    Я понимаю
    
chinese_simplified
    Change Language    ru    中文 (简化)
    Tap On Back Button
    Verify Pro Lite Mode Switching    简易版    简易版移动应用程式仅显示现货钱包的余额。转换至专业版即可查看到其他钱包、待执行订单和持有的仓位。    我了解
    
chinese_traditional
    Change Language    cn    中文 (繁體)
    Tap On Back Button
    Verify Pro Lite Mode Switching    精簡模式    精簡版APP僅顯示兌換錢包的餘額。欲查看其他錢包的餘額、待執行訂單以及未平倉位，請切回至專業版APP。    我了解
    
spain
    Change Language    tw    Español
    Tap On Back Button
    Verify Pro Lite Mode Switching    Modo Lite    La versión Lite de la aplicación solo reflejará los balances en tu cartera de exchange. Puedes volver a la versión Pro para ver tus otras carteras, órdenes abiertas y posiciones abiertas.    Entiendo

turkey
    Change Language    es    Türkçe
    Tap On Back Button
    Verify Pro Lite Mode Switching    Lite Modu    Uygulamanın Lite sürümü yalnızca spot cüzdanınızdaki bakiyeleri yansıtacaktır. Diğer cüzdanlarınızı, açık emirlerinizi ve açık pozisyonlarınızı görüntülemek için Pro sürümüne geri dönebilirsiniz.    Anladım
    Change Language    tr    English
    
*** Keywords ***
Verify Pro Lite Mode Switching
    [Arguments]    ${menu_text}    ${lite_description}    ${i_understand_text}
    Tap Lite Pro Mode Switch    ${menu_text}
    Tap Lite Pro Mode Switch    ${menu_text}
    Verify Label Displays    ${lite_description}
    Tap Element By Label    ${i_understand_text}