*** Settings ***
Documentation   To check global dashboard functionalities
Library     SeleniumLibrary
Test Teardown   Close Browser


*** Variables ***


*** Test Cases ***
Validate all Global Dashboard Functionalities
    open the browser with the VMS url
    Fill the login Form
    verify page redirect
    verify submission redirect
    verify interview redirect
    check calendar functionality


*** Keywords ***
open the browser with the VMS url
    Create Webdriver    Chrome
    Go To   http://3.7.28.22:3000

Fill the login Form
    Input Text          id:username     aakarshak.s@technmanconsulting.com
    Input Password      id:password     password
    Click Button        //button[@type='submit']

verify page redirect
    Sleep    5 seconds
    ${current_url}=  Get Location
    Log  The current URL is: ${current_url}
    Should Be Equal    ${current_url}    http://3.7.28.22:3000/dashboard?search_profile=global

verify submission redirect
    Click Element    (//div[@class='cardofmain-cards globalDashboard'])[1]
    Sleep    2 seconds
    ${current_url}=  Get Location
    Log  The current URL is: ${current_url}
    Should Be Equal    ${current_url}    http://3.7.28.22:3000/submissions
    Go Back

verify interview redirect
    Click Element    (//div[@class='cardofmain-cards globalDashboard'])[2]
    Sleep    2 seconds
    ${current_url}=  Get Location
    Log  The current URL is: ${current_url}
    Should Be Equal    ${current_url}    http://3.7.28.22:3000/interviews
    Go Back

check calendar functionality
    Sleep    2 seconds
    ${submission_count}=    Get Text    (//div[@class='cardofmain-cards globalDashboard'])[1]
    ${interview_count}=    Get Text    (//div[@class='cardofmain-cards globalDashboard'])[2]
    Click Element    //button[@class='rdrDay'][1]
#    Click Element    //button[@class='rdrDay'][10]
    ${filtered_submission_count} =    Get Text    (//div[@class='cardofmain-cards globalDashboard'])[1]
    ${filtered_interview_count} =    Get Text    (//div[@class='cardofmain-cards globalDashboard'])[2]
    Should Not Be Equal    ${submission_count}    ${filtered_submission_count}
    Should Not Be Equal    ${interview_count}    ${filtered_interview_count}
    Sleep    2 seconds
    Execute JavaScript    document.querySelector(".dashboard-button.w-100.mb-2").click()
    Sleep    2 seconds
    ${unfiltered_submission_count} =    Get Text    (//div[@class='cardofmain-cards globalDashboard'])[1]
    ${unfiltered_interview_count} =    Get Text    (//div[@class='cardofmain-cards globalDashboard'])[2]
    Should Be Equal    ${submission_count}    ${unfiltered_submission_count}
    Should Be Equal    ${interview_count}    ${unfiltered_interview_count}
    Log    Dashboard Testing Completed Successfully



