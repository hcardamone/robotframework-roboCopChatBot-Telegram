*** Settings ***
Documentation       This resource provide code to load and evalue the .json obj.

Library             OperatingSystem
Library             Collections
Library             String
Library             json
Library             JSONLibrary
Library             ../customlib/JSONLibraryExtended/JSONLibraryExtended.py
Variables           ../common/selenium-resources/web-elements/extract-web-elements.yaml
Resource            ../transform-data/evaluate-json-obj.resource


*** Variables ***
${EVALJSONOBJ}      ${EMPTY}


*** Keywords ***
Load Json OBJ File
    [Documentation]    This KW load new the json file that contain game data information
    [Arguments]    @{args}
    OperatingSystem.Create File    ${GET_DATA_TRFDIR}/data-gamectg-new.json    ${EVALJSONOBJ}
    OperatingSystem.Move File    ${GET_DATA_TRFDIR}/data-gamectg-new.json    ${GET_DATA_MOCKDIR}
    ${RSPSJSONOBJ}    OperatingSystem.Get Binary File    ${GET_DATA_MOCKDIR}/data-gamectg-new.json
    ${EXPECTED_RESPONSE}    OperatingSystem.Get Binary File
    ...    ${GET_DATA_MOCKDIR}/data-gamectg-mock.json
    &{EVLRSPJSONOBJ}    BuiltIn.Evaluate    json.loads('''${RSPSJSONOBJ}''')    json
    &{EVLEXPJSONOBJ}    BuiltIn.Evaluate    json.loads('''${EXPECTED_RESPONSE}''')    json
    Collections.Dictionaries Should Be Equal    ${EVLRSPJSONOBJ}
    ...    ${EVLEXPJSONOBJ}
    Collections.Log Dictionary    ${EVLRSPJSONOBJ}
    Collections.Log Dictionary    ${EVLEXPJSONOBJ}
    BuiltIn.Set Global Variable    ${EVLRSPJSONOBJ}
    RETURN    ${EVALJSONOBJ}
