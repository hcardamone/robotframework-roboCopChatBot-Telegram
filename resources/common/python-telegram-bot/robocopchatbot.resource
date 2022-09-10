*** Settings ***
Documentation       This resource we can get messages, get the token and send messages

Library             RequestsLibrary
Library             json
Library             JSONLibrary
Library             ./customlib/RoboCopTelegramBotLibrary/RoboCopTelegramBotLibrary.py
Variables           ./telegram-variables/telegram_variables.py


*** Variables ***
${GETMEHEADERS}     ./resources/common/python-telegram-bot/getMeHeaders/headers.json
${GETUPDHEADERS}    ./resources/common/python-telegram-bot/getUpdtHeaders/headers.json
${GETUPDPAYLOAD}    ./resources/common/python-telegram-bot/getMessagePayLoad/payload.json
${POSTHEADERS}      ./resources/common/python-telegram-bot/postHeaders/headers.json
${SENDMSGPAY}       ./resources/common/python-telegram-bot/sendMessagePayLoad/sendmsgpayload.json


*** Keywords ***
Get Message Updates
    [Documentation]    KW to get messages
    [Arguments]    ${HOST_GET_UPDATES}    ${GETUPDHEADERS}    ${GETUPDPAYLOAD}
    ${LOADGETUPDHEADERS}    JSONLibrary.Load Json From File    ${GETUPDHEADERS}
    ${LOADGETUPDPAYLOAD}    JSONLibrary.Load Json From File    ${GETUPDPAYLOAD}
    RoboCopTelegramBotLibrary.Post Get Message Updates
    ...    ${HOST_GET_UPDATES}
    ...    ${LOADGETUPDHEADERS}
    ...    ${LOADGETUPDPAYLOAD}

Get You Token
    [Documentation]    KW to get token
    [Arguments]    ${HOST_GET_UPDATES}    ${GETMEHEADERS}
    ${loadGETMEHEADERS}    JSONLibrary.Load Json From File    ${GETMEHEADERS}
    RoboCopTelegramBotLibrary.Post Get You Token
    ...    ${HOST_GET_UPDATES}
    ...    ${loadGETMEHEADERS}

Send Message To Group
    [Documentation]    KW to send messages
    [Arguments]    ${HOST_SEND_MESSAGE}    ${POSTHEADERS}    ${SENDMSGPAY}
    ${LOADHEADERS}    JSONLibrary.Load Json From File    ${POSTHEADERS}
    ${GETPAYLOADSEND}    JSONLibrary.Load Json From File    ${SENDMSGPAY}
    RoboCopTelegramBotLibrary.Post Send Message
    ...    ${HOST_SEND_MESSAGE}
    ...    ${GETPAYLOADSEND}
    ...    ${POSTHEADERS}
