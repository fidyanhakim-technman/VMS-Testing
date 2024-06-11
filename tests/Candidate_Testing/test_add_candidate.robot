*** Settings ***
Documentation   To check candidate table functionalities
Library     SeleniumLibrary


*** Variables ***


*** Test Cases ***
Validate all Global Dashboard Functionalities
    open the browser with the VMS url
    Fill the login Form
    page redirect
    add candidate



*** Keywords ***
open the browser with the VMS url
    Create Webdriver    Chrome
    Go To   http://localhost:3000/

Fill the login Form
    Input Text          id:username     admin@gmail.com
    Input Password      id:password     abcd@1234
    Click Button        //button[@type='submit']
    Sleep    2 seconds

page redirect
    Sleep    2 seconds
    Click Element    //a[normalize-space()='Candidate']
    Wait Until Element Is Visible    //a[normalize-space()='Add Candidate']
    Click Element    //a[normalize-space()='Add Candidate']
    Sleep    3 seconds

add candidate
    Input Text    //input[@id='name']    Test Name
    Sleep    2 seconds
    Input Text    //input[@id='email']    testemail@gmail.com
    Sleep    2 seconds
    Input Text    //input[@id='phone_no']    1234567890
    Sleep    2 seconds
    Input Text    //input[@id='dob']    20-02-2001
    Sleep    2 seconds
    Select From List By Index    //select[@id='gender']     1
    Sleep    2 seconds
    Input Text    //textarea[@id='address']    Test Address
    Sleep    2 seconds
    Input Text    //textarea[@id='education']    Test Education Details
    Sleep    2 seconds
    Select From List By Index    //select[@id='visa']   5
    Sleep    2 seconds
    Input Text    //input[@id='visa_start']    20-02-2023
    Sleep    2 seconds
    Input Text    //input[@id='visa_end']    20-02-2024
    Sleep    2 seconds
    Input Text    //input[@id='location']    Test Location
    Sleep    2 seconds
    Input Text    //input[@id='preferred_location']    Test Preferred Location
    Sleep    2 seconds
    Select From List By Index    //select[@id='rtg']  1
    Sleep    2 seconds
    Input Text    //input[@id='ssn']    4444
    Sleep    2 seconds
    Input Text    //input[@id='job_domain']    Test Job Domain
    Sleep    2 seconds
    Input Text    //input[@id='skills']    Test Preferred Techstack
    Sleep    2 seconds
    Select From List By Index    //select[@id='primary_marketer']   2
    Sleep    2 seconds
    Select From List By Index    //select[@id='in_pool']    1
    Sleep    2 seconds
    Input Text    //input[@id='marketing_start']    20-02-2024
    Sleep    2 seconds
    Input Text    //input[@id='marketing_end']    20-10-2024
    Sleep    2 seconds
    Select From List By Index    //select[@id='recruiter']  1
    Sleep    2 seconds
    Select From List By Index    //select[@id='rateType']   1
    Sleep    2 seconds
    Input Text    //input[@id='rate']    50
    Sleep    2 seconds
    Select From List By Index    //select[@id='status']   1
    Sleep    2 seconds
    Select From List By Index    //select[@id='bench_status']   1
    Sleep    2 seconds
    Click Button    //button[@type='submit']
    Sleep    2 seconds
    Wait Until Element Is Visible    //div[@class='flash-message']
    ${message}=  Get Text    //div[@class='flash-message']
    Should Contain    ${message}    Successfully
    Should Not Contain    ${message}    Error

    