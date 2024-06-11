*** Settings ***
Documentation   To check Admin dashboard functionalities
Library     SeleniumLibrary
Test Teardown   Close Browser


*** Variables ***


*** Test Cases ***
Validate all Admin Dashboard Functionalities
    open the browser with the VMS url
    Fill the login Form
    verify pages redirect
    check calendar functionality

*** Keywords ***
open the browser with the VMS url
    Create Webdriver    Chrome
    Go To   https://vms.technmanconsulting.com/login

Fill the login Form
    Input Text          id:username     aakarshak.s@technmanconsulting.com
    Input Password      id:password     password
    Click Button        //button[@type='submit']
    Sleep    2 seconds

verify pages redirect
    Sleep    5 seconds
    Select From List By Index    //select[@name='dashboard']    1
    Sleep    2 seconds
    Click Element    //div[@class='main-cards']/div[1]
    Go Back
    Select From List By Index    //select[@name='dashboard']    1
    Sleep    2 seconds
    Click Element    //div[@class='main-cards']/div[2]
    Go Back
    Select From List By Index    //select[@name='dashboard']    1
    Sleep    2 seconds
    Click Element    //div[@class='main-cards']/div[3]
    Go Back
    Select From List By Index    //select[@name='dashboard']    1
    Sleep    2 seconds
    Click Element    //div[@class='main-cards']/div[4]
    Go Back
    Sleep    2 seconds
    Select From List By Index    //select[@name='dashboard']    1


    
    
    
check calendar functionality
    Sleep    2 seconds
    ${submission_count}=    Get Text    //div[@class='main-cards']/div[1]
    ${interview_count}=    Get Text    //div[@class='main-cards']/div[2]
    Click Element    //button[@class='rdrDay'][1]
#    Click Element    //button[@class='rdrDay'][10]
    Sleep    2 seconds
    ${filtered_submission_count} =    Get Text    //div[@class='main-cards']/div[1]
    ${filtered_interview_count} =    Get Text    //div[@class='main-cards']/div[2]
    Should Not Be Equal    ${submission_count}    ${filtered_submission_count}
    Should Not Be Equal    ${interview_count}    ${filtered_interview_count}
    Sleep    2 seconds
    Execute JavaScript    document.querySelector(".dashboard-button.w-100.mb-2").click()
    Sleep    2 seconds
    ${unfiltered_submission_count} =    Get Text    //div[@class='main-cards']/div[1]
    ${unfiltered_interview_count} =    Get Text    //div[@class='main-cards']/div[2]
    Should Be Equal    ${submission_count}    ${unfiltered_submission_count}
    Should Be Equal    ${interview_count}    ${unfiltered_interview_count}
    Log    Dashboard Testing Completed Successfully



