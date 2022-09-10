*** Settings ***
Documentation       This demo get game data information on xbox website
...                 transform the game data to .json
...                 and when the test finish
...                 will send a chatbot telegram notification

Resource            ../bdd-resources/gamectg-BDD.resource

Suite Setup         Open The Local Browser


*** Test Cases ***
Selenium RPA - Extract data information details
    [Documentation]    This test case is in BDD framework instructions
    [Tags]    smoke_test
    Given That Local Firefox Brownser Was Open
    When Extract The Game Data Information On Xbox Game Catalog Title
    Then Transform The Game Data Information
    And Test Was Finished
    Given Request TelegramBot Get Token
    When Request RocoCop TelegramBot Get Messages
    Then Request RocoCop TelegramBot Send Message
