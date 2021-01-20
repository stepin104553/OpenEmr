*** Settings ***
Documentation    This file deals with finding the details of patient

Resource      ../common_functionality.resource

*** Variables ***
${FIN_LOCATOR}    fin
${FINDER_LOCATOR}    create_patient_btn1
${PAT_LOCATOR}    pat
*** Keywords ***
Select To Fin Frame
    Select Frame    ${FIN_LOCATOR}
Click Patient Finder
    Click Element    ${FINDER_LOCATOR}
Select Out Fin Frame
    Unselect Frame   
Select To Pat Frame    
    Select Frame    ${PAT_LOCATOR}

    

    
    

    