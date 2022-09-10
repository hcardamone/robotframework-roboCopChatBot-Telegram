*** Settings ***
Documentation       This resource provide code to evaluate the .json obj.

Library             OperatingSystem
Library             Collections
Library             String
Library             json
Library             JSONLibrary
Library             ../customlib/JSONLibraryExtended/JSONLibraryExtended.py
Variables           ../common/selenium-resources/web-elements/extract-web-elements.yaml
Resource            ../transform-data/update-json-obj.resource


*** Variables ***
${UPDJSONOBJ}       ${EMPTY}


*** Keywords ***
Evaluate Json OBJ File
    [Documentation]    This KW evaluate the json file that contain game data information
    [Arguments]    @{args}
    ${DCTNEWJSON}    BuiltIn.Create Dictionary    &{UPDJSONOBJ}
    ${EVALJSONOBJ}    BuiltIn.Evaluate    json.dumps(&{DCTNEWJSON})    json
    ${LNTHJSONOBJ}    BuiltIn.Get Length    ${EVALJSONOBJ}
    BuiltIn.Log To Console    ${EVALJSONOBJ}
    FOR    ${LNTHJSONOBJ}    IN    ${EVALJSONOBJ}
    ...    ${UPDJSONOBJ}    Split String    ${LNTHJSONOBJ}    =
    ...    Set To Dictionary    ${DCTNEWJSON}    ${UPDJSONOBJ}
        ${EVALJSONOBJ}    Json.Dumps    ${DCTNEWJSON}
    END
    Set Global Variable    ${EVALJSONOBJ}
