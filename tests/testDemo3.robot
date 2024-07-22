*** Settings ***
Documentation    Login form validation
Library    SeleniumLibrary
Library    String
Library    Collections
Test Teardown    Close Browser
Resource    resource.robot

*** Variables ***
${documentsRequestTitle}    DOCUMENTS REQUEST


*** Test Cases ***
Validate Child window Login
    open the browser with the Mortgage payment url
    Select the Child window link
    Verify child window is opened
    Grab the email id from child window
    Switch back to parent window and type email

   
*** Keywords ***
Select the Child window link
    Click Element    ${documentRequestsLocator}
    Sleep    5

Verify child window is opened
    Switch Window    NEW
    Element Text Should Be    ${pageTitle}    ${documentsRequestTitle}


Grab the email id from child window
    ${pleaseEmailText}=    Get Text    ${pleaseEmailText}

    @{words}=    Split String    ${pleaseEmailText}    at
    ${split_text}=    Get From List    ${words}    1

    @{words_2}=    Split String    ${split_text}
    ${email}=    Get From List    ${words_2}    0

    Set Global Variable    ${email}



Switch back to parent window and type email
    Switch Window    MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    id:username    ${email}
    