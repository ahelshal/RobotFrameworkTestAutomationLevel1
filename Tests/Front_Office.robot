*** Settings ***
Documentation  This Test Automation using Robot Framework
Resource  ../Resources/Common.robot  # for Setup & Teardown
Resource  ../Resources/FrontOfficeApp.robot  # for lower level keywords in test cases
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test
# robot -d results/front-office --reporttitle "My Cool Report" --logtitle "My Cool Log" tests/Front_Office.robot
# robot -d results/front-office --critical test1 tests/Front_Office.robot
# robot -d results/front-office -c test1 tests/Front_Office.robot
# robot -d results/front-office --noncritical test1 tests/Front_Office.robot
# robot -d results/front-office -n test1 tests/Front_Office.robot
# robot -d results/front-office --timestampoutputs tests/Front_Office.robot
#robot -d results/front-office tests/Front_Office.robot
*** Variables ***
${BROWSER} =  chrome
${URL} =  http://www.robotframeworktutorial.com/front-office/

*** Test Cases ***
Should be able to access "Team" Page
    [Documentation]  This is test 1
    [Tags]  test1
    FrontOfficeApp.Go to Landing Page
    FrontOfficeApp.Go to "Team" Page
    FrontOfficeApp.Do Some Custom Thing

"Team" page should math requirements
    [Documentation]  This is test 2
    [Tags]  test2
    FrontOfficeApp.Go to Landing Page
    FrontOfficeApp.Go to "Team" Page
    FrontOfficeApp.Validate "Team"Page
