*** Settings ***
Documentation     A resource file with reusable keywords and variables
Library    SeleniumLibrary
Library    OperatingSystem


*** Variables ***
# Page URLs
${loginPageUrl}    https://rahulshettyacademy.com/loginpagePractise

# Login credentials
${user_name}    rahulshettyacademy
${invalid_password}    12345678
${valid_password}    learning

## Constants
${blackberry}    Blackberry
${admin}    admin
${user}    user
${teacher}    teacher
${student}    student
${consultant}    consultant

# Locators
${errorMessageLocator}    css:.alert.alert-danger
${shopButtonLocator}    css:a[href="/angularpractice/shop"]
${cardTitlesLocator}    css:.card-title
${addButton}    css:.card-footer button
${userOptionLocator}    css:input[value="user"]
${adminOptionLocator}    css:input[value="admin"]
${userTypeSelect}    css:.form-group select
${okayButton}    id:okayBtn
${termsCheckbox}    id:terms

*** Keywords ***
open the browser with the Mortgage payment url
    Open Browser    browser=Chrome    options=add_experimental_option("detach",True)
    Go To    ${loginPageUrl}