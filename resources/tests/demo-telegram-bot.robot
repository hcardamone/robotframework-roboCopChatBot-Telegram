*** Settings ***
Library     Collections
Resource    ../python-telegram-bot/robocoptele.robot


*** Test Cases ***
RocoCop TelegramBot Get Token
    Get You Token    ${HOST_GET_UPDATES}    ${getMeHeaders}

RocoCop TelegramBot Get Messages
    Get Message Updates    ${HOST_GET_UPDATES}    ${getUpdtHeaders}    ${getUpdtPayload}

RocoCop TelegramBot Send Message
    Send message to group    ${HOST_SEND_MESSAGE}    ${postHeaders}    ${sendMpayload}
