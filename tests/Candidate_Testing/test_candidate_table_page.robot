*** Settings ***
Documentation   To check candidate table functionalities
Library     SeleniumLibrary
Test Teardown   Close Browser


*** Variables ***


*** Test Cases ***
Validate all Candidate Functionalities
    open the browser with the VMS url
    Fill the login Form
    page redirect
    check functionalities
    


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
    Wait Until Element Is Visible    //a[normalize-space()='Candidate Table']
    Click Element    //a[normalize-space()='Candidate Table']
    Sleep    3 seconds

check functionalities
    Sleep    1 seconds
    Input Text    //input[@placeholder='Search Candidate']    Aakarshak
    Sleep    2 seconds
    ${filtered_candidate}=  Get Text    //span[@class='candidate-details-page-consultant-box']
    Should Contain    ${filtered_candidate}    Aak
    Log    Search functionality working
    Sleep    2 seconds
    Click Button    //button[@class='button-in-container']
    Sleep    2 seconds
#    Input Text    //input[@placeholder='Status']    In Marketing
#    Sleep    2 seconds
#    ${elements}=    Get WebElements    //span[@class='candidate-details-page-consultant-box']
#    Sleep    2 seconds
#    Select From List By Index    //input[@placeholder='Status']     2
#    Sleep    2 seconds
#    ${elements2}=    Get WebElements    //span[@class='candidate-details-page-consultant-box']
#    Sleep    2 seconds
#    Should Not Be Equal    ${elements}    ${elements2}
    Click Element    //div[@class='candidate-details-page-container']//li[1]
    Sleep    2 seconds
#    Click Element    (//div//*[name()='svg'])[12]
#    Sleep    2 seconds
#    Choose File    //input[@id='formFile']    C:\Users\Dell\PycharmProjects\VMS-Testing\resources\Screenshot 2024-06-11 092305.png
#    Sleep    2 seconds
#    Click Button    //button[@type='button']
#    ${element}=     Get Text    //div[@class='flash-message']
#    Should Contain    ${element}    successfully
    Click Element    //div[@class='card-details-container']//div[@class='content-details-container']//div//*[name()='svg']
    Sleep    2 seconds
    Input Text    //input[@id='comments']    Some3
    Sleep    2 seconds
    Execute Javascript  document.querySelector("button[type='submit']").click()
    Sleep    1 seconds

    ${message}=     Get Text    //div[@class='flash-message success']
    Should Contain    ${message}    Successfully



