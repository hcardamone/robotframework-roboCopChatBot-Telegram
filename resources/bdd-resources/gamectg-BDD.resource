*** Settings ***
Documentation       This resource provide the BDD framework instructions

Resource            ../common/selenium-resources/firefoxbrowser.resource
Resource            ../common/selenium-resources/displayinfo.resource
Resource            ../common/python-telegram-bot/robocopchatbot.resource
Resource            ../transform-data/create-json-obj.resource
Resource            ../transform-data/update-json-obj.resource
Resource            ../transform-data/evaluate-json-obj.resource
Resource            ../transform-data/load-json-obj.resource


*** Keywords ***
That Local Firefox Brownser Was Open
    [Documentation]    This KW open the brownser we can choose in handlsess or not
    Open The Local Browser

Extract The Game Data Information On Xbox Game Catalog Title
    [Documentation]    This KW get the game data information from xbox.com catalog
    Get The Game Data

Request RocoCop TelegramBot Get Messages
    [Documentation]    This KW get the last messages
    Get Message Updates    ${HOST_GET_UPDATES}    ${GETUPDHEADERS}    ${GETUPDPAYLOAD}

Request RocoCop TelegramBot Send Message
    [Documentation]    This KW send messages notification
    Send Message To Group    ${HOST_SEND_MESSAGE}    ${POSTHEADERS}    ${SENDMSGPAY}

Request TelegramBot Get Token
    [Documentation]    This KW get the token
    Get You Token    ${HOST_GET_UPDATES}    ${GETMEHEADERS}

Test Was Finished
    [Documentation]    This KW close the brownser
    Display Game Data Info
    Close My Current Browser

Transform The Game Data Information
    [Documentation]    This KW create the json file that contain game data information
    create-json-obj.Generate Json File
    update-json-obj.Update Json OBJ File
    evaluate-json-obj.Evaluate Json OBJ File
    load-json-obj.Load Json OBJ File
