*** Settings ***
Documentation     A resource file with reusable keywords and variables
Library    SeleniumLibrary
Library    OperatingSystem


*** Variables ***
# Variables
${user_name}    rahulshettyacademy
${invalid_password}    12345678
${valid_password}    learning
${loginPageUrl}    https://rahulshettyacademy.com/loginpagePractise
${blackberry}    Blackberry

# Locators
${errorMessageLocator}    css:.alert.alert-danger
${shopButtonLocator}    css:a[href="/angularpractice/shop"]
${cardTitlesLocator}    css:.card-title
${addButton}    css:.card-footer button

*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Chrome
    Go To    ${loginPageUrl}