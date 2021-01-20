*** Settings ***
Documentation    This file deals with finding the details of patient

Resource      ../common_functionality.resource

*** Variables ***
${PAT_LOCATOR}    pat
${FIRSTNAME_LOCATOR}    //input[@name='form_fname']
${MIDDLENAME_LOCATOR}    //input[@name='form_mname']
${LASTNAME_LOCATOR}    //input[@name='form_lname']
${DOB_LOCATOR}    //input[@name='form_DOB']
${GENDER_LOCATOR}    form_sex 
${CREATEPATIENTS_LOCATOR}        //button[@name='create']
${CREATEPATIENT_LOCATOR}    //button[@name='create']
${MODAL_LOCATOR}    id=modalframe
${CONFIRMCREATENEWPATIENT_LOCATOR}    //input[@value='Confirm Create New Patient']
${CLOSEHBD_LOCATOR}    //div[@class='closeDlgIframe']
${VERIFYADDPATIENTDETAIL_LOCATOR}    //h2[contains(text(),'Record Dashboard')]
*** Keywords ***
Switch To Pat Frame    
    Select Frame    ${PAT_LOCATOR}
    
Enter Firstname
    [Arguments]    ${fname}
    Input Text    ${FIRSTNAME_LOCATOR}    ${fname}
    
Enter Middlename
    [Arguments]    ${mname}
    Input Text     ${MIDDLENAME_LOCATOR}      ${mname}

Enter Lastname
    [Arguments]    ${lname}
    Input Text    ${LASTNAME_LOCATOR}    ${lname}
    
Enter DOB
    [Arguments]    ${dob}
    Input Text    ${DOB_LOCATOR}    ${dob}     
    
Enter Gender
    [Arguments]    ${gender}
    Select From List By Label    ${GENDER_LOCATOR}     ${gender}
Click Create Patients
     Click Element    ${CREATEPATIENTS_LOCATOR}
Switch Out From Pat Frame
     Unselect Frame
Click Create patient
    Click Element      ${CREATEPATIENT_LOCATOR}  
        
Switch To Modal Frame
    Select Frame    ${MODAL_LOCATOR}
    
Click Confirm Create New Patient
    Click Button    ${CONFIRMCREATENEWPATIENT_LOCATOR} 
    
Switch Out From Modal Frame
    Unselect Frame
    
Validate and Handle Alert Message
    [Arguments]    ${alerttext}
    ${actualtext}    Handle Alert   timeout=30s
    #Alert Should Be Present    ${alertext}     timeout=30s
    Should Contain    ${actualtext}    ${alerttext}   
Handle Happy Birthday Message
    Click Element   //div[@class='closeDlgIframe']
    
Switch To Pat Frames
    Select Frame    ${PAT_LOCATOR}
    
Verify Add Patient Detail
    [Arguments]    ${details}
    Element Should Contain     ${VERIFYADDPATIENTDETAIL_LOCATOR}       ${details}
 