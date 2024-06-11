*** Settings ***
Documentation   To check axe dashboard functionalities
Library     SeleniumLibrary
Test Teardown   Close Browser


*** Variables ***


*** Test Cases ***
Validate all Axe Dashboard Functionalities
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
    Select From List By Index    //select[@name='dashboard']    2
    Sleep    2 seconds
    Click Element    //div[@class='main-cards']/div[1]
    Go Back
    Select From List By Index    //select[@name='dashboard']    2
    Sleep    2 seconds
    Click Element    //div[@class='main-cards']/div[2]
    Go Back

check calendar functionality
    Sleep    4 seconds
    Select From List By Index    //select[@name='dashboard']    2
    Sleep    4 seconds
    ${submission_count}=    Get Text    //div[@class='main-cards']/div[1]
    Sleep    4 seconds
#    ${interview_count}=    Get Text    //div[@class='main-cards']/div[2]
    Sleep    4 seconds
    Click Element    //button[@class='rdrDay'][1]
    Sleep    4 seconds
#    Click Element    //button[@class='rdrDay'][10]
    ${filtered_submission_count} =    Get Text    //div[@class='main-cards']/div[1]
    Sleep    4 seconds

#    ${filtered_interview_count} =    Get Text    //div[@class='main-cards']/div[2]
    Should Not Be Equal    ${submission_count}    ${filtered_submission_count}
#    Should Not Be Equal    ${interview_count}    ${filtered_interview_count}
    Sleep    2 seconds
    Execute JavaScript    document.querySelector(".dashboard-button.w-100.mb-2").click()
    Sleep    4 seconds
    ${unfiltered_submission_count} =    Get Text    //div[@class='main-cards']/div[1]
    ${unfiltered_interview_count} =    Get Text    //div[@class='main-cards']/div[2]
    Should Be Equal    ${submission_count}    ${unfiltered_submission_count}
#    Should Be Equal    ${interview_count}    ${unfiltered_interview_count}
    Log    Dashboard Testing Completed Successfully



