*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${TEAM_HEADER_LABEL} =  xpath=//*[@id="team"]/div/div[1]/div/h2
*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains Element  ${TEAM_HEADER_LABEL}

Validate Page Contents
    Element Text Should Be  ${TEAM_HEADER_LABEL}  Our Amazing Team  ignore_case=True
    #Element Text Should Not Be  ${TEAM_HEADER_LABEL}  Our Amazing Team  ignore_case=True
