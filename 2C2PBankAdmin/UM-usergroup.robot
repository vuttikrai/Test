*** Settings ***
Library  SeleniumLibrary
Library  DataDriver  ../Resources/TestData/2C2PBankAdmin/DataModel.xlsx  sheet_name=UM-UserGroup
Library  ../Resources/DataManager.py
Resource  ../Resources/CommonFunctions.robot
Test Template  Login Scenarios

*** Variables ***
#Set Global Variable

*** Test Cases ***
Start testing...

*** Keywords ***
Login Scenarios
    [Arguments]  ${login_username}  ${login_password}  ${level}  ${cetagory}  ${input_element}  ${input_locator}  ${verifying_element}  ${verifying_locator}  ${verifying_text}
    ${columName}=  get_column_for_inputText  ${input_locator}   #extract value only for input text locator

    Run Keyword If  '${cetagory}'=='Create User Group'  Run Keywords  Log  processing Create user...
    ...     AND  Run Keyword If  '${level}'=='Main'  Go To The Page - create user group  ${login_username}  ${login_password}  ${ ${columName} }
    ...     AND  Run Keyword If  '${input_element}'!='${empty}'  Enter Input Data  ${input_element}  ${input_locator}
    ...     AND  Run Keyword If  '${verifying_element}'!='${empty}'  Verify result  ${verifying_element}  ${verifying_locator}  ${verifying_text}

    Run Keyword If  '${cetagory}'=='Select User Group'  Run Keywords  Log  processing Edit user...
    ...     AND  Run Keyword If  '${level}'=='Main'  Go To The Page - select user group  ${login_username}  ${login_password}  ${ ${columName} }
    ...     AND  Run Keyword If  '${input_element}'!='${empty}'  Enter Input Data  ${input_element}  ${input_locator}
    ...     AND  Run Keyword If  '${verifying_element}'!='${empty}'  Verify result  ${verifying_element}  ${verifying_locator}  ${verifying_text}


Go To The Page - create user group
    [Arguments]  ${_login_username}  ${_login_password}
    Start TestCase
    Input Text  ${username_login_txtbox}  ${_login_username}
    Input Text  ${password_login_txtbox}  ${_login_password}
    Click Button  ${login_btn}
    Wait Until Page Contains Element  ${UM_menu}
    Click Element  ${UM_menu}
    Click Element  ${UM_usergroup_submenu}
    Wait Until Page Contains Element  ${UM_createUsergroup_btn}
    Click Element  ${UM_createUsergroup_btn}

    # Do Not Delete - example how to select an item from a dropdown
    Wait Until Page Contains Element  //span[contains(@class,"ngx-select__placeholder text-muted") and contains(.,"Department")]
    Click element  //span[contains(@class,"ngx-select__placeholder text-muted") and contains(.,"Department")]

    Wait Until Page Contains Element  //input[@placeholder="Department"]
    Sleep  1s
    #Execute Javascript  document.querySelector(".ngx-select__search").removeAttribute("tabindex");
    input text  //input[@placeholder="Department"]  Projects
    Click element   //*[@id="welcome-theme"]/emv-root/emv-welcome/div/div/div[2]/emv-user-management/emv-user-group-create-edit/div/div/form/div[1]/div[1]/div/div/div/div[3]/span/ngx-select/div/ul/li/a
    #click element  //*[@id="welcome-theme"]/emv-root/emv-welcome/div/div/div[2]/emv-user-management/emv-user-group-create-edit/div/div/form/div[1]/div[1]/div/div/div/div[3]/span/ngx-select/div/ul/li[1]
    Sleep  1s
    #Select from List by value  //input[@placeholder="Department"]  Projects
    ################

    Set Focus to Element  //input[@ng-reflect-name="isCreator"]
    Wait Until Page Contains Element  //input[@ng-reflect-name="isCreator"]
    Sleep  1s
    Select Checkbox  //input[@ng-reflect-name="isCreator"]

Go To The Page - select user group
    [Arguments]  ${_login_username}  ${_login_password}
    Start TestCase
    Input Text  ${username_login_txtbox}  ${_login_username}
    Input Text  ${password_login_txtbox}  ${_login_password}
    Click Button  ${login_btn}
    Wait Until Page Contains Element  ${UM_menu}
    Click Element  ${UM_menu}
    Click Element  ${UM_usergroup_submenu}

    Wait Until Element Is Visible   ${UM_usergroup_select_link}
    #Set Focus To Element  ${UM_usergroup_select_link}
    sleep  1s
    Click element  ${UM_usergroup_select_link}