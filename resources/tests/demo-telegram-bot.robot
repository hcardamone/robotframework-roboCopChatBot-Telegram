*** Settings ***
Documentation       This demo get the user telegram token
...                 get the recent messages
...                 and send messages to chat id

Library             Collections
Resource            ../common/python-telegram-bot/robocopchatbot.resource


*** Test Cases ***
RocoCop TelegramBot Get Token
    [Documentation]    Instruction to get token
    Get You Token    ${HOST_GET_UPDATES}    ${GETMEHEADERS}

Request RocoCop TelegramBot Get Messages
    [Documentation]    Instruction to get messages
    Get Message Updates    ${HOST_GET_UPDATES}    ${GETUPDHEADERS}    ${GETUPDPAYLOAD}

Request RocoCop TelegramBot Send Message
    [Documentation]    Instruction to send messages
    Send Message To Group    ${HOST_SEND_MESSAGE}    ${POSTHEADERS}    ${SENDMSGPAY}
