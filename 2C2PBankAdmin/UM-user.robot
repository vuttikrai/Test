*** Settings ***
Library  SeleniumLibrary
Library  DataDriver  ../Resources/TestData/2C2PBankAdmin/DataModel.xlsx  sheet_name=UM-User
Library  ../Resources/DataManager.py
Resource  ../Resources/CommonFunctions.robot
Test Template  UM-user Scenarios

*** Variables ***
#Set Global Variable

*** Test Cases ***
Start testing...

*** Keywords ***
UM-user Scenarios
    [Arguments]  ${login_username}  ${login_password}  ${level}  ${cetagory}  ${input_element}  ${input_locator}  ${verifying_element}  ${verifying_locator}  ${verifying_text}
    ${columName}=  get_column_for_inputText  ${input_locator}   #extract value only for input text locator

    Run Keyword If  '${cetagory}'=='Create User'  Run Keywords  Log  processing Create user...
    ...     AND  Run Keyword If  '${level}'=='Main'  Go To The Page - create user  ${login_username}  ${login_password}  ${ ${columName} }
    ...     AND  Run Keyword If  '${input_element}'!='${empty}'  Enter Input Data  ${input_element}  ${input_locator}
    ...     AND  Run Keyword If  '${verifying_element}'!='${empty}'  Verify result  ${verifying_element}  ${verifying_locator}  ${verifying_text}

    Run Keyword If  '${cetagory}'=='Select User'  Run Keywords  Log  processing Edit user...
    ...     AND  Run Keyword If  '${level}'=='Main'  Go To The Page - select user  ${login_username}  ${login_password}  ${ ${columName} }
    ...     AND  Run Keyword If  '${input_element}'!='${empty}'  Enter Input Data  ${input_element}  ${input_locator}
    ...     AND  Run Keyword If  '${verifying_element}'!='${empty}'  Verify result  ${verifying_element}  ${verifying_locator}  ${verifying_text}

    Run Keyword If  '${cetagory}'=='Advance Search'  Run Keywords  Log to console  processing Advance Search...
    ...     AND  Run Keyword If  '${level}'=='Main'  Go To The Page - Advance search for user  ${login_username}  ${login_password}  ${ ${columName} }
    ...     AND  Run Keyword If  '${input_element}'!='${empty}'  Enter Input Data  ${input_element}  ${input_locator}
    ...     AND  Run Keyword If  '${verifying_element}'!='${empty}'  Verify result  ${verifying_element}  ${verifying_locator}  ${verifying_text}

Go To The Page - create user
    [Arguments]  ${_login_username}  ${_login_password}
    Start TestCase
    Input Text  ${username_login_txtbox}  ${_login_username}
    Input Text  ${password_login_txtbox}  ${_login_password}
    Click Button  ${login_btn}
    Wait Until Page Contains Element  ${UM_menu}
    Click Element  ${UM_menu}
    Click Element  ${UM_users_submenu}
    Wait Until Page Contains Element  ${UM_createUser_btn}
    Click Element  ${UM_createUser_btn}
    #Click Link  ${UM_advanceSearchUser_btn}

Go To The Page - select user
    [Arguments]  ${_login_username}  ${_login_password}
    Start TestCase
    Input Text  ${username_login_txtbox}  ${_login_username}
    Input Text  ${password_login_txtbox}  ${_login_password}
    Click Button  ${login_btn}
    Wait Until Page Contains Element  ${UM_menu}
    Click Element  ${UM_menu}
    Click Element  ${UM_users_submenu}

    Wait Until Element Is Visible   ${UM_user_select_link}
    Set Focus To Element  ${UM_user_select_link}
    sleep  1s
    Click element  ${UM_user_select_link}

    # testing ######################

    Wait Until Element Is Visible  //button[contains(@class,"btn emv-btn-user-edit") and contains(.,"Edit")]
    sleep  1s
    Click element  //button[contains(@class,"btn emv-btn-user-edit") and contains(.,"Edit")]

    #Wait Until Element Is Visible  xpath=//emv-user-management/emv-user-setting-edit//div[1]/div[7]/div[2]/input

    #DATE PICKUP
    Wait Until Element Is Visible    //emv-user-management/emv-user-setting-edit//div[1]/div[7]/div[2]//input     10s
    #Execute Javascript          document.querySelector("html body#welcome-theme emv-root emv-welcome div.emv-welcome-page div.content div.emv-container-fluid emv-user-management emv-user-setting-edit.ng-star-inserted div.emv-page-wrapper.emv-user-settings-edit form.needs-validation.emv-form.ng-touched.ng-pristine.ng-valid.ng-star-inserted div.emv-summary-list.user-settings-edit-list div.form-group.row.emv-summary-list-item.align-items-center.emv-form-group div.col-sm-6 div.input-date-picker input#from-date-input.form-control.ng-touched.ng-pristine.ng-valid").removeAttribute("readonly");
    Execute Javascript          document.querySelector("#from-date-input").removeAttribute("readonly");
    Clear Element Text    //emv-user-management/emv-user-setting-edit//div[1]/div[7]/div[2]//input
    Input Text    //emv-user-management/emv-user-setting-edit//div[1]/div[7]/div[2]//input    01/10/2018


    Wait Until Element Is Visible  //*[@id="welcome-theme"]/emv-root/emv-welcome/div/div/div[2]/emv-user-management/emv-user-setting-edit/div/form/div[1]/div[6]/div[2]/ngx-select/div/div[2]/div/span[1]/span
    Click Element  //*[@id="welcome-theme"]/emv-root/emv-welcome/div/div/div[2]/emv-user-management/emv-user-setting-edit/div/form/div[1]/div[6]/div[2]/ngx-select/div/div[2]/div/span[1]/span
    sleep  1s
    Click Element  //*[@id="welcome-theme"]/emv-root/emv-welcome/div/div/div[2]/emv-user-management/emv-user-setting-edit/div/form/div[1]/div[6]/div[2]/ngx-select/div/ul/li[2]/a
    #Wait Until Element Is Visible  //span[contains(@class,"ngx-select__selected-single pull-left float-left ngx-select__allow-clear ng-star-inserted")]/span
    #Select From List By 2C2PBankAdmin  //span[contains(@class,"ngx-select__selected-single pull-left float-left ngx-select__allow-clear ng-star-inserted")]/span  1


Go To The Page - Advance search for user
    [Arguments]  ${_login_username}  ${_login_password}
    Start TestCase
    Input Text  ${username_login_txtbox}  ${_login_username}
    Input Text  ${password_login_txtbox}  ${_login_password}
    Click Button  ${login_btn}
    Wait Until Page Contains Element  ${UM_menu}
    Click Element  ${UM_menu}
    Click Element  ${UM_users_submenu}
    Wait Until Element Is Visible  ${UM_advanceSearchUser_link}
    sleep  1s
    Click element  ${UM_advanceSearchUser_link}

    #Selection dropdown Select status / Deleted
    Wait Until Element Is Visible  //div[@class='ngx-select__toggle btn form-control']/span[contains(.,'Select Status')]
    Click element   //div[@class='ngx-select__toggle btn form-control']/span[contains(.,'Select Status')]
    sleep  1s
    Click element  //*[@id="welcome-theme"]/modal-container/div/div/emv-user-management-search/emv-modal/form/div/div/div[2]/div[1]/div[2]/ngx-select/div/ul/li[2]/a/span


    #Click element   //a[@class="ngx-select__item dropdown-item ng-star-inserted ngx-select__item_active active"]/span[contains(.,'Active')]
    #//*[@id="welcome-theme"]/modal-container/div/div/emv-user-management-search/emv-modal/form/div/div/div[2]/div[1]/div[2]/ngx-select/div/ul/li[1]/a
    #//*[@id="welcome-theme"]/modal-container/div/div/emv-user-management-search/emv-modal/form/div/div/div[2]/div[2]/div[2]/ngx-select/div/ul/li[1]/a
    #click element  //li[@class="ngx-select__item-group ng-star-inserted"]//span[contains(.,'Active')]
    #good one click element  //*[@id="welcome-theme"]/modal-container/div/div/emv-user-management-search/emv-modal/form/div/div/div[2]/div[1]/div[2]/ngx-select/div/ul/li[3]/a/span
    #click element  //*[@id="welcome-theme"]/modal-container/div/div/emv-user-management-search/emv-modal/form/div/div/div[2]/div[1]/div[2]/ngx-select/div/ul/li[3]/a/span
    #good one Click element  xpath=/html/body/modal-container/div/div/emv-user-management-search/emv-modal/form/div/div/div[2]/div[1]/div[2]/ngx-select/div/ul/li[1]/a
    #Click element  xpath=/html/body/modal-container/div/div/emv-user-management-search/emv-modal/form/div/div/div[2]/div[1]/div[2]/ngx-select/div/ul/li[2]/a
    #Click element  xpath=/html/body/modal-container/div/div/emv-user-management-search/emv-modal/form/div/div/div[2]/div[1]/div[2]/ngx-select/div/div[2]/div
    Input Text  //input[@placeholder="Enter User Name"]  aaaaa
    #Wait Until Element Is Visible  //span[@class='ngx-select__placeholder text-muted ng-star-inserted']
    #Select From List By 2C2PBankAdmin  //span[@class='ngx-select__placeholder text-muted ng-star-inserted']/span[contains(text(),'Select Status')]  1