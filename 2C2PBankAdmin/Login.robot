*** Settings ***
Library  SeleniumLibrary
Library  String
Library  DataDriver  ../Resources/TestData/2C2PBankAdmin/DataModel.xlsx  sheet_name=Login
Library  ../Resources/DataManager.py
Resource  ../Resources/CommonFunctions.robot
Test Template  Login Scenarios

*** Variables ***
#Set Global Variable
#${notinputtext}=  ${empty}


*** Test Cases ***
Start testing...

*** Keywords ***
Login Scenarios
    [Arguments]  ${level}  ${cetagory}  ${username}  ${password}  ${email}  ${input_element}  ${input_locator}  ${verifying_element}  ${verifying_locator}  ${verifying_text}

    #Set Global Variable      ${USERNAME}  ${username}
    #Set Global Variable      ${PASSWORD}  ${password}
    #Set Global Variable      ${EMAIL}  ${email}
    #Set Global Variable      ${TXT_TO_VERIFY}  ${verifying_text}

    ${columName}=  get_column_for_inputText  ${input_locator}   #extract value only for input text locator
    #${notinputtext}=  Set Variable  ${empty}            #Set to None if not input text locator


    Run Keyword If  '${cetagory}'=='Login'  Run Keywords  Log  processing Login
    ...     AND  Run Keyword If  '${level}'=='Main'  Go To The Login Page
    ...     AND  Run Keyword If  '${input_element}'!='${empty}'  Enter Input Data  ${input_element}  ${input_locator}  ${ ${columName} }
    ...     AND  Run Keyword If  '${verifying_element}'!='${empty}'  Verify result  ${verifying_element}  ${verifying_locator}  ${verifying_text}

    Run Keyword If  '${cetagory}'=='Forgot Password'  Run Keywords  Log to console  processing Forget password
    ...     AND  Run Keyword If  '${level}'=='Main'  Go To The Forget Password Page
    ...     AND  Run Keyword If  '${input_element}'!='${empty}'  Enter Input Data  ${input_element}  ${input_locator}  ${ ${columName} }
    ...     AND  Run Keyword If  '${verifying_element}'!='${empty}'  Verify result  ${verifying_element}  ${verifying_locator}  ${verifying_text}

    Run Keyword If  '${cetagory}'=='First Time Login'  Run Keywords  Log  processing First time login
    ...     AND  Start TestCase
    ...     AND  Click Link   ${ForgotPWD_link_locator}
    ...     AND  Enter Input Textbox  ${ForgotPWD_email_locator}  ${username}

Go To The Login Page
    Start TestCase

Go To The Forget Password Page
    Start TestCase
    Click Link   ${ForgotPWD_link_locator}