*** Settings ***
Documentation   To check Requirements Page functionalities
Library     SeleniumLibrary
Test Teardown   Close Browser


*** Variables ***


*** Test Cases ***
Validate all Global Dashboard Functionalities
    open the browser with the VMS url
    Fill the login Form
    page redirect
    check functionalities



*** Keywords ***
open the browser with the VMS url
    Create Webdriver    Chrome
    Go To   https://vms.technmanconsulting.com/

Fill the login Form
    Input Text          id:username     aakarshak.s@technmanconsulting.com
    Input Password      id:password     password
    Click Button        //button[@type='submit']
    Sleep    2 seconds

page redirect
    Sleep    2 seconds
    Click Element    //a[normalize-space()='Marketing']
    Wait Until Element Is Visible    //a[normalize-space()='Requirements']
    Click Element    //a[normalize-space()='Requirements']
    Sleep    3 seconds

check functionalities
    Sleep    2 seconds
