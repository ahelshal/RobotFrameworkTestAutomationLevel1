*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${TOP_NAV_TEAM_LINK} =  Team
#${TOP_NAVw_TEAM_LINK} =  xpath=//*[@id="bs-example-navbar-collapse-1"]/ul/li[5]/a
*** Keywords ***
Select "Team" Page
    # TODO Move this keyword
    Click Link  ${TOP_NAV_TEAM_LINK}
    #Click Link  ${TOP_NAVw_TEAM_LINK}
    Sleep  1s