*** Settings ***
Documentation    Login form validation
Library    SeleniumLibrary
Resource    resource.robot
Test Teardown    Close Browser
Test Template    Validate Unsuccessful Login

*** Variables ***
${errorMessageLocator}    css:.alert.alert-danger


*** Test Cases ***    username    password
Invalid username    ${invalid_user_name}    ${valid_password}
Invalid password    ${user_name}    ${invalid_password}
Special characters    ${invalid_string}    ${valid_password}


*** Keywords ***
Validate Unsuccessful Login
    [Arguments]    ${username}    ${password}
    open the browser with the Mortgage payment url
    Fill the login Form    ${username}    ${password}
    Wait Until Element Is Visible    ${errorMessageLocator}
    verify error message is correct

open the browser with the Mortgage payment url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise

Fill the login Form
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    id:signInBtn

    
verify error message is correct
    Element Text Should Be    ${errorMessageLocator}    Incorrect username/password.
