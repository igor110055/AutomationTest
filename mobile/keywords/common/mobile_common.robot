*** Settings ***
Library    String
Library    AppiumLibrary    run_on_failure=Capture Page Screenshot      timeout=10s
Library    Collections
Library    Process
Library    ../../python_library/common.py
Resource    ../../../utility/common/images_common.robot

*** Keywords ***
Open Apps
    [Arguments]     ${app}    ${no_reset}=${True}
    ${app_path}=    Get Canonical Path      ${CURDIR}/../../../app-path/${app}
    ${OS}    Convert To Lowercase        ${OS}
    ${app_path}    Set Variable If    '${ENV}' == 'production'    ${app_path}-prod    ${app_path}
    ${app_path}    Set Variable If    '${OS}' == 'android'    ${app_path}.apk    ${app_path}.app
    Set To Dictionary    ${${DEVICE}}    noReset=${no_reset}    app=${app_path}
    Open Application    ${REMOTE_URL}    &{${DEVICE}}

Open App On Browser Stack
    Set To Dictionary    ${${DEVICE}}    project=Bitfinex    build=4.4.0    name=mobile
    Open Application    http://hub-cloud.browserstack.com/wd/hub    &{${DEVICE}}
        
Close Test Application
    Close All Applications
        
Swipe To Left
     ${width}=    Get Window Width
     ${height}=   Get Window Height
     ${start_x}=      Evaluate    0.67 * ${width}
     ${start_y}=      Evaluate    0.90 * ${height}
     ${offset_x}=     Evaluate    0 * ${width}
     ${offset_y}=     Evaluate    0.30 * ${height}
     Swipe    ${start_x}    ${start_y}    ${offset_x}    ${offset_y}    1000

Swipe Up
    [Arguments]    ${start_x}=${None}    ${ratio}=0.7
    ${width}=    Get Window Width
    ${height}=   Get Window Height
    ${start_x}    Run Keyword If    '${start_x}'=='${None}'    Evaluate    0.5 * ${width}
    ...    ELSE    Set Variable    ${start_x}
    ${start_y}=      Evaluate    0.5 * ${height}
    ${offset_y}=     Evaluate    ${ratio} * ${height}
    Swipe    ${start_x}    ${start_y}    ${start_x}    ${offset_y}    1000

Swipe Down
    [Arguments]    ${start_x}=${None}    ${ratio}=0.1
    ${width}=    Get Window Width
    ${height}=   Get Window Height
    ${start_x}    Run Keyword If    '${start_x}'=='${None}'    Evaluate    0.5 * ${width}
    ...    ELSE    Set Variable    ${start_x}
    ${start_y}=      Evaluate    0.5 * ${height}    
    ${offset_y}=     Evaluate    ${ratio} * ${height}
    Swipe    ${start_x}    ${start_y}    ${start_x}    ${offset_y}    1000

Select Item On List View
     [Arguments]     ${tbl_list}     ${item}
     @{elements}     Get Webelements    ${tbl_list}
     Click Element    @{elements}[${item}]

Switch To Webview Context
    ${default_context}=    Get Current Context
    @{all_context}=    Get Contexts
    ${count_list}=    Get Length    ${all_context}
    ${webview_context}=    Get From List    ${all_context}    ${count_list-1}
    Switch To Context    ${webview_context}

Switch To Native Context
     ${default_context}=    Get Current Context
     @{all_context}=    Get Contexts
     ${count_list}=    Get Length    ${all_context}
     ${native_context}=    Get From List    ${all_context}    0
     Switch To Context    ${native_context}

Swipe Up To Element
    [Arguments]    ${expected_locator}    ${start_x}=${None}    ${ratio}=0.7
    ${is_visible}    Is Element Visible    ${expected_locator}
    Run Keyword If    ${is_visible}==${False}    Run Keyword And Continue On Failure
    ...    Wait Until Keyword Succeeds    10x    0.5s
    ...    Run Keywords    Swipe Up    ${start_x}    ${ratio}
    ...    AND    Wait Element Is Visible    ${expected_locator}      0.5s

Swipe Down To Element
     [Arguments]    ${expected_locator}    ${start_x}=${None}    ${ratio}=0.1
     ${is_visible}    Is Element Visible    ${expected_locator}
     Run Keyword If    ${is_visible}==${False}    Run Keyword And Continue On Failure
     ...    Wait Until Keyword Succeeds    10x    0.5s
     ...    Run Keywords    Swipe Down    ${start_x}    ${ratio}
     ...    AND    Wait Element Is Visible    ${expected_locator}      0.5s

Swipe To Element
    [Arguments]    ${element}    ${ratio}    ${swipe}=${None}    ${start_x}=${None}
    Run Keyword If    '${swipe}'=='DOWN'    Swipe Down To Element    ${element}    start_x=${start_x}    ratio=${ratio}
    ...    ELSE IF    '${swipe}'=='UP'    Swipe Up To Element    ${element}    start_x=${start_x}    ratio=${ratio}

Is Element Visible
    [Arguments]    ${element}    ${timeout}=3s
    ${is_visible}    Run Keyword And Return Status    Wait Element Is Visible    ${element}    ${timeout}
    [Return]    ${is_visible}

Is Element Disappear
    [Arguments]    ${element}    ${timeout}=3s
    ${is_disappear}    Run Keyword And Return Status    Wait Element Disappear    ${element}    ${timeout}
    [Return]    ${is_disappear}

Scroll Element To Middle
     [Arguments]    ${element}
     Wait Until Keyword Succeeds    10x    1s    Run Keywords    Swipe Down
     ...    AND    Element Is In Middle Of Screen    ${element}

Swipe Left From Element To Element
     [Arguments]    ${from_element}    ${expected_element}    
     Wait Until Element Is Visible    ${from_element}
     ${element_location}=    Get Element Location    ${from_element}
     ${element_location}=    Convert To String    ${element_location}
     @{list_coordinates}=    Get Regexp Matches    ${element_location}    \\d+
     Wait Until Keyword Succeeds    10x    2s    Run Keywords    Swipe    ${list_coordinates}[0]    ${list_coordinates}[1]    0    ${list_coordinates}[1]  
     ...    AND    Wait Until Element Is Visible    ${expected_element}      timeout=1s

Wait Element Is Visible
    [Arguments]    ${locator}    ${timeout}=${None}    ${repeat}=1    ${delay}=${None}
    Run Keyword If    '${delay}'!='${None}'    Sleep    ${delay}
    # work around: StaleElementReferenceException: Message: Cached elements 'By.accessibilityId: tickers_table_BTCEUR' do not exist in DOM anymore
    FOR    ${index}    IN RANGE    0    ${repeat}
        Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${locator}    ${timeout}
        Sleep    0.5s
    END
        
Element Is In Middle Of Screen
    [Arguments]    ${element}    ${variance}=300
    ${screen_height}=    Get Window Height
    ${element_location}=    Get Element Location    ${element}
    ${element_location}=    Convert To String    ${element_location}
    @{list_coordinates}=    Get Regexp Matches    ${element_location}    \\d+
    ${middle_point}=    Evaluate    ${screen_height} * 0.5
    ${element_position}=    Evaluate    abs(${list_coordinates}[1] - ${middle_point})
    Should Be True    ${element_position} < 300               

Wait Until Element Is Enabled
    [Arguments]    ${element}    ${timeout}=30
    ${interval}=    Evaluate    ${timeout} / 10    
    Wait Until Keyword Succeeds    10x    ${${interval}}s    Element Should Be Enabled    ${element}
    Element Should Be Enabled    ${element}

Click Visible Element
    [Arguments]    ${element}    ${delay}=${None}    ${repeat}=1    ${swipe}=${None}    ${start_x}=${None}
    Run Keyword If    '${delay}'!='${None}'    Sleep    ${delay}
    Run Keyword If    '${swipe}'=='DOWN'    Swipe Down To Element    ${element}    start_x=${start_x}
    ...    ELSE IF    '${swipe}'=='UP'    Swipe Up To Element    ${element}    start_x=${start_x}
    Wait Element Is Visible    ${element}
    FOR    ${index}    IN RANGE    0    ${repeat}
        Click Element    ${element}
    END
# GET    
Get Element Text
    [Arguments]    ${element}
    Wait Element Is Visible    ${element}
    ${return_text}    Get Text    ${element}
    [Return]    ${return_text}

Get Elements Text
    [Arguments]    ${elements_locator}
    ${list_return}    Create List    
    ${elements}    Get Webelements    ${elements_locator}
    FOR    ${element}    IN    @{elements}
        ${element_text}    Get Element Text    ${element}
        Append To List    ${list_return}    ${element_text}
    END  
    [Return]    ${list_return}

Get Elements Property
    [Arguments]    ${elements_locator}    ${attribute}
    ${list_return}    Create List    
    ${elements}    Get Webelements    ${elements_locator}
    FOR    ${element}    IN    @{elements}
        ${element_text}    Get Element Attribute    ${element}    ${attribute}
        Append To List    ${list_return}    ${element_text}
    END  
    [Return]    ${list_return}

Get Element Property
    [Arguments]    ${element}    ${property}
    Wait Element Is Visible    ${element}
    ${return_value}    Get Element Attribute    ${element}    ${property}
    [Return]    ${return_value}

Get Element Boundary Values
    [Arguments]    ${element}
    ${element_bound}    Get Element Attribute    ${element}    bounds
    ${element_bound_string}    Replace String    ${element_bound}    ][    ,
    ${element_bound_string}    Remove String    ${element_bound_string}    [
    ${element_bound_string}    Remove String    ${element_bound_string}    ]
    @{return_values}    Split String    ${element_bound_string}    ,
    [Return]    @{return_values}
            
Clear Element Text
    [Arguments]    ${element}
    Clear Text    ${element}
    
Input Text Into Element
    [Arguments]    ${element}    ${text}    ${hide_keyboard}=${False}    ${clear_text}=${False}    ${swipe}=${None}    ${delay}=${None}
    Run Keyword If    '${swipe}'=='DOWN'    Swipe Down To Element    ${element}
    ...    ELSE IF    '${swipe}'=='UP'    Swipe Up To Element    ${element}
    Wait Element Is Visible    ${element}
    Run Keyword If    '${clear_text}'=='${True}'    Clear Text    ${element}
    Input Text    ${element}    ${text}
    Run Keyword If    '${hide_keyboard}'=='${True}'    Hide Keyboard
    Run Keyword If    '${delay}'!='${None}'    Sleep    ${delay}
    
Wait Element Disappear
    [Arguments]    ${element}    ${timeout}=${None}    ${delay}=${None}
    Run Keyword And Continue On Failure    Wait Until Page Does Not Contain Element    ${element}    ${timeout}
    Run Keyword If    '${delay}'!='${None}'    Sleep    ${delay}

Capture Screen And Compare
    [Arguments]    ${file_name}    ${compared_file_name}
    ${abs_path}    Get Canonical Path    ${CURDIR}/../../resources/testdata/screenshot
    Capture Page Screenshot    ${abs_path}/${file_name}.png
    Compare Images    ${abs_path}/${file_name}.png    ${abs_path}/base/${compared_file_name}.png    0.15
    
Put App In Background
    [Arguments]    ${duration}=5
    Background App    ${duration}

Tap Device Back Button
    [Arguments]    ${repeat}=${1}
    FOR    ${index}    IN RANGE    0    ${repeat}
        Send Key    4
    END
    Sleep    1s

Tap On Coordinates
    [Arguments]    ${x}    ${y}    ${delay}=${None}
    Run Keyword If    "${delay}"!="${None}"    Sleep    ${delay}        
    Click Element At Coordinates    ${x}    ${y}

Send Key
    [Arguments]    ${keycode}    ${delay}=1s
    Sleep    ${delay}
    Press Keycode    ${keycode}

Toggle Switch
    [Arguments]    ${toggle_element}    ${toggle}=ON
    ${element_text}    Get Element Text    ${toggle_element}
    Run Keyword If    "${element_text}"!="${toggle}"    Click Visible Element    ${toggle_element}

Verify Element Text Should Be
    [Arguments]    ${element}    ${text}    ${delay}=${None}
    Run Keyword If    '${delay}'!='${None}'    Sleep    ${delay}
    Wait Element Is Visible    ${element}
    Run Keyword And Continue On Failure    Element Text Should Be    ${element}    ${text}
    
Verify Element Text Contains
    [Arguments]    ${element}    ${text}    ${delay}=${None}
    Run Keyword If    '${delay}'!='${None}'    Sleep    ${delay}
    Wait Element Is Visible    ${element}
    Run Keyword And Continue On Failure    Element Should Contain Text    ${element}    ${text}
    
Verify Element Text Shoud Not Be
    [Arguments]    ${element}    ${text}
    ${element_text}    Get Text    ${element}
    Should Not Be Equal    ${element_text}    ${text}
    
Verify Element Is Disabled
    [Arguments]    ${element}
    Run Keyword And Continue On Failure    Element Should Be Disabled    ${element}
    
Verify Element Property
    [Arguments]    ${element}    ${property}    ${expected_value}
    ${element_property_state}    Get Element Attribute    ${element}    ${property}
    Run Keyword And Continue On Failure    Should Be Equal    ${element_property_state}    ${expected_value}
    
Verify Checkbox State
    [Arguments]    ${element}    ${checked}
    ${element_checked_state}    Get Element Attribute    ${element}    checked
    ${element_checked_state}    Convert To Boolean    ${element_checked_state}
    Run Keyword And Continue On Failure    Should Be Equal    ${element_checked_state}    ${checked}