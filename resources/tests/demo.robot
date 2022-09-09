*** Settings ***
Resource    ../bdd-resources/gamectg-BDD.resource

*** Test Cases ***
Selenium RPA - Extract data information details
    [Tags]    extract_transform_game_info
    Given that local firefox brownser was open
    When extract the game data information on xbox game catalog title
    Then transform the game data information
    And test was finished
    Given Request TelegramBot Get Token
    When Request RocoCop TelegramBot Get Messages
    Then Request RocoCop TelegramBot Send Message
