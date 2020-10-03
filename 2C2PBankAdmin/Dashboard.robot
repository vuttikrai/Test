*** Settings ***
Library  SeleniumLibrary
Library  DataDriver  ../Resources/TestData/2C2PBankAdmin/DataModel.xlsx  sheet_name=Dashboard
Library  ../Resources/DataManager.py
Resource  ../Resources/CommonFunctions.robot

#Suite Setup  Start TestCase
#Suite Teardown  Finish TestCase
Test Template  Dashboard Scenarios

*** Variables ***
#Set Global Variable      ${USERNAME}

*** Test Cases ***
Start testing...

*** Keywords ***
Dashboard Scenarios
    [Arguments]  ${login_username}  ${login_password}  ${cetagory}  ${level}  ${input_element}  ${verifying_element}  ${input_locator}  ${verifying_locator}  ${verifying_text}
    ${columName}=  get_column_for_inputText  ${input_locator}   #extract value only for input text locator

    Run Keyword If  '${cetagory}'=='Verify text'  Run Keywords  Log  processing Login
    ...     AND  Run Keyword If  '${level}'=='Main'  Go to the Dashboard page  ${login_username}  ${login_password}  ${ ${columName} }
    ...     AND  Run Keyword If  '${input_element}'!='${empty}'  Enter Input Data  ${input_element}  ${input_locator}
    ...     AND  Run Keyword If  '${verifying_element}'!='${empty}'  Verify result  ${verifying_element}  ${verifying_locator}  ${verifying_text}

Go to the Dashboard page
    [Arguments]  ${_login_username}  ${_login_password}
    Start TestCase
    Input Text  ${username_login_txtbox}  ${_login_username}
    Input Text  ${password_login_txtbox}  ${_login_password}
    Click Button  ${login_btn}
    wait until element is visible  ${product_dashboard_menu}
    Click Element  ${product_dashboard_menu}
    wait until element is visible  ${dashboard_dashboard_submenu}
    Click Element  ${dashboard_dashboard_submenu}