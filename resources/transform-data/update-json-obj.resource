*** Settings ***
Documentation       This resource provide code to update the .json obj.

Library             OperatingSystem
Library             Collections
Library             String
Library             json
Library             JSONLibrary
Library             ../customlib/JSONLibraryExtended/JSONLibraryExtended.py
Variables           ../common/selenium-resources/web-elements/extract-web-elements.yaml
Resource            ../transform-data/create-json-obj.resource


*** Variables ***
${GNAMECNT}     ${EMPTY}
${GVALCNT}      ${EMPTY}
${GGNRCNT}      ${EMPTY}


*** Keywords ***
Update Json OBJ File
    [Documentation]    This KW update the json file that contain game data information
    [Arguments]    @{args}
    ${GTNEWJSON}    OperatingSystem.Get Binary File    ${GET_DATA_TRFDIR}/data-gamectg-LOAD.json
    &{LDJSNOBJ}    JSONLibrary.Load JSON From File    ${GET_DATA_TRFDIR}/data-gamectg-LOAD.json
    &{DCTJSONOBJ}    BuiltIn.Create Dictionary    &{LDJSNOBJ}
    ${UPDJSONOBJ}    JSONLibrary.Update Value To Json
    ...    ${DCTJSONOBJ}
    ...    $..xboxctnt.gamname
    ...    ${GNAMECNT}
    ${UPDJSONOBJ}    JSONLibrary.Update Value To Json
    ...    ${DCTJSONOBJ}
    ...    $..xboxctnt.gvalue
    ...    ${GVALCNT}
    ${UPDJSONOBJ}    JSONLibrary.Update Value To Json
    ...    ${DCTJSONOBJ}
    ...    $..xboxctnt.ggender
    ...    ${GGNRCNT}
    Set Global Variable    &{UPDJSONOBJ}
