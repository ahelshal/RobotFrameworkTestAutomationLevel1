*** Settings ***
Library  ../Libraries/MyCustomLibrary.py
Resource  ./PO/Landing.robot
Resource  ./PO/Team.robot
Resource  ./PO/TopNav.robot
*** Keywords ***
Do Some Custom Thing
    Do Something Special
Go to Landing Page
    Landing.Navigate To
    Landing.Verify Page Loaded

Go to "Team" Page
    TopNav.Select "Team" Page
    Team.Verify Page Loaded

Validate "Team"Page
    Team.Validate Page Contents