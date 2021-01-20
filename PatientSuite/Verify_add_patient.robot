*** Settings ***
Documentation    this file contain patient details

Resource    ../Resource/common_functionality.resource
Resource    ../Resource/Pages/DashboardPage.resource
Resource    ../Resource/Pages/LoginPage.resource
Resource    ../Resource/Pages/PatientFinderPage.resource
Resource    ../Resource/Pages/SerachOrAddPAtientPage.resource

Test Setup    launch browser
Test Teardown    End browser
*** Test Cases ***
TC1_Valid

    Enter Username    admin
    Enter Password    pass
    Select Language   English (Indian)
    Click Login
    Click Patient Or Clients
    #Click Element    //div[text()='New/Search']
    #Click Element    //div[text()='Patients']
    Click Patient
    #Select Frame    fin
    Select To Fin Frame    
    #Click Element    create_patient_btn1   
    Click Patient Finder
    Unselect Frame
    #Select Frame    name=pat
    Sleep    3s    
    Select To Pat Frame
    Select From List By Label    form_title    Mrs.    
    Enter Firstname    valli
    Enter Middlename    aaaa  
    Enter Lastname    pss
    Enter DOB    2021-01-19
    Enter Gender    Female
    Click Create Patient
    Switch Out From Pat Frame
    Switch To Modal Frame
    Click Confirm Create New Patient 
    Switch Out From Modal Frame
    Validate and Handle Alert Message    New Due Clinical Reminders
    Handle Happy Birthday Message
    Switch To Pat Frames
    Verify Add Patient Detail    Medical Record Dashboard - Valli Pss
    Switch Out From Pat Frame
    #MouseOver On Name
    #Click Logout
    