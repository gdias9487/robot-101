*** Settings ***
Documentation    Login form validation
Library    SeleniumLibrary
Library    Collections
Test Setup    open the browser with the Mortgage payment url
Test Teardown    Close Browser
Resource    resource.robot


*** Test Cases ***
Validate Unsuccessful Login
    Fill the login Form    ${user_name}    ${invalid_password}
    Wait Until Element Is Visible    ${errorMessageLocator}
    verify error message is correct


Validate Cards display in Shopping page
    Fill the login Form    ${user_name}    ${valid_password}
    Wait Until Element Is Visible    ${shopButtonLocator}
    Verify Card titles in the Shop page
    Select The Card    ${blackberry}


*** Keywords ***
Fill the login Form
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    id:signInBtn

verify error message is correct
    Element Text Should Be    ${errorMessageLocator}    Incorrect username/password.
    
Verify Card titles in the Shop page
    @{expectedList} =    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${cardTitlesElements} =    Get Webelements    ${cardTitlesLocator}
    @{actualList} =    Create List    
    
    FOR    ${element}    IN    @{cardTitlesElements}
        Log    ${element.text}
        Append To List    ${actualList}    ${element.text}
    END

    Lists Should Be Equal    ${actualList}    ${expectedList}
    
Select the Card
    [Arguments]    ${cardName}
    ${cardTitlesElements} =    Get Webelements    ${cardTitlesLocator}
    ${index} =    Set Variable    1
    FOR    ${element}    IN    @{cardTitlesElements}
        Exit For Loop If        '${element.text}' == '${cardName}'
        
        ${index} =    Evaluate    ${index} + 1

    END

    Click Button    (//*[@class='card-footer'])[${index}]/button