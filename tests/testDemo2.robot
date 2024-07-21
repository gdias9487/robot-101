*** Settings ***
Documentation    Login form validation
Library    SeleniumLibrary
Library    Collections
Test Setup    open the browser with the Mortgage payment url
Test Teardown    Close Browser
Resource    resource.robot


*** Test Cases ***
#Validate Unsuccessful Login
#    Fill the login Form    ${user_name}    ${invalid_password}
#    Wait Until Element Is Visible    ${errorMessageLocator}
#    verify error message is correct
#
#
#Validate Cards display in Shopping page
#    Fill the login Form    ${user_name}    ${valid_password}
#    Wait Until Element Is Visible    ${shopButtonLocator}
#    Verify Card titles in the Shop page
#    Select The Card    ${blackberry}

Login with custom user option
    Fill The Login Details And Select The User Option    ${user_name}    ${valid_password}    ${user}    ${teacher}


*** Keywords ***
Fill the login Form
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    id:signInBtn
    
Fill the Login Details and select the User option
    [Arguments]    ${username}    ${password}    ${userType}    ${userSelectOption}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Run Keyword If    '${userType}' == 'user'    Run Keywords    Click Element    ${userOptionLocator}    AND    Wait Until Element Is Visible    css:.modal-body    AND    Set Focus To Element    ${okayButton}    AND    Click Button    ${okayButton}    AND    Click Button    ${okayButton}    AND    Click Button    ${okayButton}
#    Run Keyword If    '${userType}' == 'admin'    Click Element    ${adminOptionLocator}
#    Run Keyword If    '${userSelectOption}' == 'teacher'    Select From List By Value    ${userTypeSelect}    teach
#    Run Keyword If    '${userSelectOption}' == 'student'    Select From List By Value    ${userTypeSelect}    stud
#    Run Keyword If    '${userSelectOption}' == 'consultant'    Select From List By Value    ${userTypeSelect}    consult
    Wait Until Element Is Not Visible    css:.modal-body
    Select Checkbox    ${termsCheckbox}
    Checkbox Should Be Selected    ${termsCheckbox}
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