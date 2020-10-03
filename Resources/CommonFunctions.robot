*** Settings ***
Library  SeleniumLibrary
Resource  ../2C2PBankAdmin/ConfigData.robot

*** Variables ***

*** Keywords ***
Start TestCase
    Open Browser  ${url}  ${browser}
    Maximize Browser Window

Finish TestCase
    Close Browser

Enter Input Data
    [arguments]  ${_input_element}  ${_input_locator}  ${_input_text}
    ${target_element}  get_input_element  ${_input_element}
    Run Keyword If  '${target_element}'=='text'  Enter Input Data - text  ${_input_locator}  ${_input_text}
    ...  ELSE IF  '${target_element}'=='link'  Enter Input Data - link
    ...  ELSE IF  '${target_element}'=='button'  Enter Input Data - button  ${_input_locator}
    ...  ELSE IF  '${target_element}'=='mouseover'  Enter Input Data - mouseover
    ...  ELSE IF  '${target_element}'=='option'  Enter Input Data - selectoption

Enter Input Data - text
    [arguments]  ${_input_locator}  ${_input_text}
    #Log to console  ${_input_locator}
    ${loc_inputText} =  get_loc_inputText  ${_input_locator}
    #${aaa} =  Find text data  ${col_name}[1]
    #Input Text  ${col_name}[0]  ${aaa}
    Input Text  ${loc_inputText}  ${_input_text}
    #Log to Console  ${_input_text}

Enter Input Data - link
    Log  input link

Enter Input Data - button
    [arguments]  ${_input_locator}
    Click Button  ${_input_locator}
    #Log  input button

Enter Input Data - mouseover
    Log  input mouseover

Enter Input Data - selectoption
    Log  input selectoption

Verify Result
    [arguments]  ${_verifying_element}  ${_verifying_locator}  ${_verifying_text}
    ${tailor_verifying_element}  get_verifying_element  ${_verifying_element}
    Run Keyword If  '${tailor_verifying_element}'=='textdisplay'  Verify Result - text display  ${_verifying_text}
    ...  ELSE IF  '${tailor_verifying_element}'=='buttonstatus'  Verify Result - button enable or disable  ${_verifying_locator}

Verify Result - text display
    [arguments]  ${_verifying_text}
    Wait Until Page Contains    ${_verifying_text}

Verify Result - button enable or disable
    [arguments]  ${_verifying_locator}
    Element Should Be Disabled  ${_verifying_locator}

##############################
# Below are helper functions #
##############################
#Find text data
#    [arguments]  ${_col_name}
#    ${what_is_input}=  Set Variable If
#    ...  '${_col_name}'=='username'  ${USERNAME}
#    ...  '${_col_name}'=='password'  ${PASSWORD}
#    ...  '${_col_name}'=='email'  ${EMAIL}
#    [return]  ${what_is_input}