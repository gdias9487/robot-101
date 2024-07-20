*** Settings ***
Documentation    Login form validation
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${errorMessageLocator}    css:.alert.alert-danger


*** Test Cases ***
Validate Unsuccessful Login
    open the browser with the Mortgage payment url
    Fill the login Form
    wait until it checks and display error message
    verify error message is correct
    
*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise

    
Fill the login Form
    Input Text    id:username    rahulshettyacademy
    Input Password    id:password    12345678
    Click Button    id:signInBtn
    
wait until it checks and display error message
    Wait Until Element Is Visible    ${errorMessageLocator}
    
verify error message is correct
    Element Text Should Be    ${errorMessageLocator}    Incorrect username/password.
