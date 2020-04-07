*** Settings ***
Documentation  These are some XML tests

Resource  ../Resources/XML/food.robot

# Many ways to run:
# robot -d results/xml tests/XML_Tests.robot
# robot -d results/xml -i XML tests
# robot -d results tests

*** Variables ***


*** Test Cases ***
Verify Menu Count
    [Tags]  XML
    food.Should be one menu in the file

Verify Root
    [Tags]  XML
    food.Verify Menu Name

Verify Food Count
    [Tags]  XML
    food.Verify Food Count

Verify First Food
    [Tags]  XML
    food.Verify First Food Name
    food.Verify First Food Price
    food.Verify First Food Calories

Add a Food
    [Tags]  XML
    food.Add New Food

Verify New Food Was Added
    [Tags]  XML
    food.Verify New Food Exists