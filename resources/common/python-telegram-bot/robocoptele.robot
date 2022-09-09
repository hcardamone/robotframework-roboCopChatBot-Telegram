*** Settings ***
Library         RequestsLibrary
Library         Collections
Library         OperatingSystem
Library         json
Library         JSONLibrary
Library         ./customlib/RoboCopTelegramBotLibrary/RoboCopTelegramBotLibrary.py
Variables       ./telegram-variables/telegram_variables.py


*** Variables ***
${getMeHeaders}         ./resources/common/python-telegram-bot/getMeHeaders/headers.json
${getUpdtHeaders}       ./resources/common/python-telegram-bot/getUpdtHeaders/headers.json
${getUpdtPayload}       ./resources/common/python-telegram-bot/getMessagePayLoad/payload.json
${postHeaders}          ./resources/common/python-telegram-bot/postHeaders/headers.json
${sendMpayload}         ./resources/common/python-telegram-bot/sendMessagePayLoad/sendmsgpayload.json


*** Keywords ***
Get You Token
    [Arguments]    ${HOST_GET_UPDATES}    ${getMeHeaders}
    ${loadgetMeHeaders}    JSONLibrary.Load Json From File    ${getMeHeaders}
    RoboCopTelegramBotLibrary.Post Get You Token
    ...    ${HOST_GET_UPDATES}
    ...    ${loadgetMeHeaders}

Get Message Updates
    [Arguments]    ${HOST_GET_UPDATES}    ${getUpdtHeaders}    ${getUpdtPayload}
    ${loadgetUpdtHeaders}    JSONLibrary.Load Json From File    ${getUpdtHeaders}
    ${loadgetUpdtPayload}    JSONLibrary.Load Json From File    ${getUpdtPayload}
    RoboCopTelegramBotLibrary.Post Get Message Updates
    ...    ${HOST_GET_UPDATES}
    ...    ${loadgetUpdtHeaders}
    ...    ${loadgetUpdtPayload}

Send message to group
    [Arguments]    ${HOST_SEND_MESSAGE}    ${postHeaders}    ${sendMpayload}
    ${loadHeaders}    JSONLibrary.Load Json From File    ${postHeaders}
    ${getpayloadtoSend}    JSONLibrary.Load Json From File    ${sendMpayload}
    RoboCopTelegramBotLibrary.Post Send Message
    ...    ${HOST_SEND_MESSAGE}
    ...    ${getpayloadtoSend}
    ...    ${postHeaders}
