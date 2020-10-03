*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}  https://uat3ds.2c2p.com/emv3ds/3dsportal/#/login
${browser}  firefox
${username_login_txtbox}  //input[@placeholder='Enter User Email ID']
${password_login_txtbox}  //input[@placeholder='Enter Password']
${login_btn}  //button[contains(.,'Log In')]

#dashboard page
${product_dashboard_menu}  //emv-navbar-item//div//div//span[text()='Products']
${dashboard_dashboard_submenu}  //emv-product-menu//div//div//div[2]//li//a[contains(.,'Dashboard')]

#UM page
${UM_menu}  //emv-navbar//li[4]//span[text()='User Management']
${UM_users_submenu}  //div[@class="sub-welcome-item" and contains(., " Users ")]
${UM_createUser_btn}  //button[contains(@class,"btn emv-btn-accent emv-w-100-md") and contains(.," Create User ")]
${UM_advanceSearchUser_link}  //a[contains(.,"Advanced Search")]
#${UM_userID_link}  //span[@class="router-link ng-star-inserted" and contains(., "508")]
${UM_user_select_link}  //emv-user-management/emv-users-management/div//tr[1]/td[12]//span
${UM_usergroup_submenu}  //div[@class="sub-welcome-item" and contains(., " User Groups ")]
${UM_createUsergroup_btn}  //button[contains(@class,"btn emv-btn-accent emv-w-100-md") and contains(.," Create User Group ")]
${UM_usergroup_select_link}  //div/div/table/tbody/tr[1]/td[7]/span[text()=' Edit ']

${username_login_txtbox}  //input[@placeholder='Enter User Email ID']
${password_login_txtbox}  //input[@placeholder='Enter Password']
${btn_login}  //button[contains(.,'Log In')]
${error_message}  System error
#${FirstPage}  //*[@id="bank-admin-theme"]/emv-root/emv-acs/div/emv-acs-navbar/nav
${FirstPage}  https://uat3ds.2c2p.com/emv3ds/3dsportal/#/bank-admin/dashboard
${login_btn_locator}   //button[contains(.,'Log In')]
${ForgotPWD_link_locator}  //div/a[contains(.,'Forgot Password')]
${ForgotPWD_email_locator}  //input[@placeholder='Enter email']
${ForgotPWD_send_btn_locator}  //button[contains(.,'Send')]
${errorLogin}    User is already logged in.
#&{page}  First_Page=key1
&{page_DICT}  First_Page=//*[@id="bank-admin-theme"]/emv-root/emv-acs/div/emv-acs-navbar/nav  Login_Page=//button[contains(.,'Log In')]
&{clickAt_DICT}  Login_Button=//button[contains(.,'Log In')]  login_sso_button=//button[contains(.,'Login with SSO')]   forget_password_link=//a[contains(.,'Forgot Password')]  forgot_password_send_btn=//button[contains(.,'Send')]