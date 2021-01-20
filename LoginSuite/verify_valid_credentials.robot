*** Settings ***
Documentation    This file test the valid credential
#Resource    ../Resource/common_functionality.resource
Resource   ../Resource/common_functionality.resource
Resource    ../Resource/Pages/LoginPage.resource
Resource    ../Resource/Pages/DashboardPage.resource

Test Setup    launch browser
Test Teardown    End browser
Test Template    Verify_Valid_Credentials_Test
*** Test Cases ***

TC1     admin    pass    English (Indian)    Flow Board
TC2    physician    physician    English (Indian)    Flow Board
*** Keywords ***

Verify_Valid_Credentials_Test  
    [Arguments]    ${username}  ${password}    ${language}   ${expectedvalue}
    Enter Username    ${username}  
    Enter Password    ${password}    
    Select Language   ${language}
    Click Login      
    Dashboard Page Should Contain    ${expectedvalue}
    
    #MouseOver On Name    
    #Click Element    //li[text()='Logout']   
    #Click Logout
    #End Browser  