*** Settings ***
Resource    ../common/selenium-resources/firefoxbrowser.resource
Resource    ../common/python-telegram-bot/robocoptele.robot
Resource    ../extract-data/web-gamectg-extract.resource
Resource    ../transform-data/xml-json-data-gamectg-transform.resource


*** Keywords ***
Extract the game data information on xbox game catalog title
    Get the game data detail information on xbox game catalog

Transform the game data information
    Get the game data information to create the xml/json file

That the transform game data extraction was successfully
    Get the game data information to create the xml/json file

Test Was Finished
    Close my current browser

Request TelegramBot Get Token
    Get You Token    ${HOST_GET_UPDATES}    ${getMeHeaders}

Request RocoCop TelegramBot Get Messages
    Get Message Updates    ${HOST_GET_UPDATES}    ${getUpdtHeaders}    ${getUpdtPayload}

Request RocoCop TelegramBot Send Message
    Send message to group    ${HOST_SEND_MESSAGE}    ${postHeaders}    ${sendMpayload}
