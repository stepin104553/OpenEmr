*** Settings ***
Documentation    this file contains invalid test cases

Library   DataDriver    file=../TestData/OpenEmrdata.xlsx    sheet_name=Verify_InValid_Credentials_Test

Resource    ../Resource/common_functionality.resource
Resource    ../Resource/Pages/LoginPage.resource

Test Setup    launch browser
Test Teardown    End browser

Test Template    Verify_InValid_Credentials_Test

*** Test Cases ***
Verify_InValid_Credentials_Tests_${username} 
   

*** Keywords ***
Verify_InValid_Credentials_Test
    [Arguments]    ${username}  ${password}    ${language}   ${expectedvalue}
    #Launch Browser
    #Input Text    id=authUser    admin1232
    Enter Username    ${username}
    #Input Password    clearPass    pass
    Enter Password    ${password}
    #Select From List By Label    languageChoice    English (Indian)
    Select Language    ${language}
    #Click Element    //button[@type='submit']
    Click Login
    #Element Should Contain    //*[contains(text(),'Invalid')]     Invalid username or password 
        
    Verify Error Message   Invalid username or password 
    #End Browser
    
 