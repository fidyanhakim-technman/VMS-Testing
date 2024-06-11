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


