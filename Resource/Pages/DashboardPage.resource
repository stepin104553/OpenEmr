*** Settings ***
Documentation    This file deals with all the operation on dashboard page

Resource      ../common_functionality.resource

*** Variables ***
#${NAME_LOCATOR}    //span[@data-bind="text:frame"]
${LOGOUT_LOCATOR}    //li[text()='Logout']
${PATIENTORCLIENTS_LOCATOR}    //div[text()='Patient/Client']
${PATIENT_LOCATOR}    //div[text()='Patients']
*** Keywords ***
Dashboard Page Should Contain
    [Arguments]    ${pagetext}
    Page Should Contain    ${pagetext}  
    
#MouseOver On Name
    #Mouse Over    ${NAME_LOCATOR}
    
Click Logout
    Click Element    ${LOGOUT_LOCATOR}
#mouseover on patirnt client    
Click Patient Or Clients
    Click Element    ${PATIENTORCLIENTS_LOCATOR}    
    
Click Patient
    Click Element    ${PATIENT_LOCATOR}  
      

    