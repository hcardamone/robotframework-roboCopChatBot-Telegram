*** Settings ***
Documentation       This resource provide code to log console the game information
...                 And move the screenshot to extract-data dir.

Library             OperatingSystem
Library             SeleniumLibrary
Resource            ../../extract-data/web-gamectg-extract.resource


*** Keywords ***
Display Game Data Info
    [Documentation]    This KW log to console the game data information
    Log
    ...    ON SALE Grand Theft Auto V: Premium EditionFull price was $29.99 New price is $14.99
    ...    console=True
    Log    Test Suite Static: PASS, for more details check the log    console=True
    ${CPTPAGESCHT}    SeleniumLibrary.Capture Page Screenshot    ${SCHTNAME}
    OperatingSystem.Move File    ${CPTPAGESCHT}    ${DEXTDIR}
