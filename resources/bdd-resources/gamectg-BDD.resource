*** Settings ***
Documentation       This resource provide the BDD framework instructions

Resource            ../common/selenium-resources/firefoxbrowser.resource
Resource            ../common/selenium-resources/displayinfo.resource
Resource            ../common/python-telegram-bot/robocopchatbot.resource



*** Keywords ***
That Local Firefox Brownser Was Open
    [Documentation]    This KW open the brownser we can choose in handlsess or not
    Open The Local Browser
That Get The Token 
    
    [Documentation]    Instruction to get token
    RocoCop TelegramBot Get Token
    Get You Token    ${HOST_GET_UPDATES}    ${GETMEHEADERS}

    
Get The Received Messages    
    [Documentation]    Instruction to get messages
    Request RocoCop TelegramBot Get Messages
    Get Message Updates    ${HOST_GET_UPDATES}    ${GETUPDHEADERS}    ${GETUPDPAYLOAD}

Send The Message
    [Documentation]    Instruction to send messages
    Request RocoCop TelegramBot Send Message
    Send Message To Group    ${HOST_SEND_MESSAGE}    ${POSTHEADERS}    ${SENDMSGPAY}

