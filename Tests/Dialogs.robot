*** Settings ***
Documentation  These are some web tests
Library  Dialogs
Resource  ../Resources/Common.robot
Resource  ../Resources/FrontOfficeApp.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

*** Variables ***
${BROWSER} =  chrome
${URL} =  http://www.robotframeworktutorial.com/front-office/

*** Test Cases ***
Should be able to access "Landing" Page
    [Tags]  Web
    ${new_browser} =  Get Selection From User  Which browser?  chrome  ie  edge
    Set Global Variable  ${BROWSER}  ${new_browser}
    FrontOfficeApp.Go to Landing Page

Should be able to access "Team" Page
    [Tags]  Web
    FrontOfficeApp.Go to Landing Page
    Execute Manual Step  Do something manually!  It failed!
    FrontOfficeApp.Go to "Team" Page
    Pause Execution
    FrontOfficeApp.Validate "Team"Page


