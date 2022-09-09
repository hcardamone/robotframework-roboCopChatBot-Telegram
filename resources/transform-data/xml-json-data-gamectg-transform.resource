*** Comments ***
# Behavior Driven Development (BDD) and Functional Testing
[Documentation]    Here are the img transform data Keywords implementation resources


*** Settings ***
Library         OperatingSystem
Library         Collections
Library         json
Library         JSONLibrary
Library         XML
Library         String
Library         ../customlib/JSONLibraryExtended/JSONLibraryExtended.py
Variables       ../common/selenium-resources/web-elements/extract-web-elements.yaml
Variables       ../robot-variables/robot_variables.py


*** Keywords ***
Get the game data information to create the xml/json file
    [Arguments]    @{args}
    ${gname_gmcnt}    String.Get Substring    ${xboxpage.gelmock}    -77    -42
    ${value_gmcnt}    String.Get Substring    ${xboxpage.gelmock}    92    -3
    ${ggndr_gmcnt}    String.Get Substring    ${xboxpage.acadelm}    16    -3
    ${json_obj_gm}    OperatingSystem.Get Binary File    ${GET_DATA_ECTDIR}/data-gamectg-extract.json
    ${crt_jsn_obj}    OperatingSystem.Create Binary File
    ...    ${GET_DATA_TRFDIR}/data-gamectg-load.json
    ...    ${json_obj_gm}
    ${get_new_jsn}    OperatingSystem.Get Binary File    ${GET_DATA_TRFDIR}/data-gamectg-load.json
    &{load_jsn_ob}    JSONLibrary.Load JSON From File    ${GET_DATA_TRFDIR}/data-gamectg-load.json
    &{dct_jsn_obj}    BuiltIn.Create Dictionary    &{load_jsn_ob}
    ${jsn_obj_upd}    JSONLibrary.Update Value To Json    ${dct_jsn_obj}    $..xboxctnt.gamname    ${gname_gmcnt}
    ${jsn_obj_upd}    JSONLibrary.Update Value To Json    ${dct_jsn_obj}    $..xboxctnt.gvalue    ${value_gmcnt}
    ${jsn_obj_upd}    JSONLibrary.Update Value To Json    ${dct_jsn_obj}    $..xboxctnt.ggender    ${ggndr_gmcnt}
    ${dct_nw_json}    BuiltIn.Create Dictionary    &{jsn_obj_upd}
    ${eval_jsn_ob}    BuiltIn.Evaluate    json.dumps(&{dct_nw_json})    json
    ${lnth_jsn_ob}    BuiltIn.Get Length    ${eval_jsn_ob}
    BuiltIn.Log To Console    ${eval_jsn_ob}
    FOR    ${lnth_jsn_ob}    IN    ${eval_jsn_ob}
    ...    ${jsn_obj_upd}    Split String    ${lnth_jsn_ob}    =
    ...    Set To Dictionary    ${dct_nw_json}    ${jsn_obj_upd}
        ${eval_jsn_ob}    Json.Dumps    ${dct_nw_json}
    END
    OperatingSystem.Create File    ${GET_DATA_TRFDIR}/data-gamectg-new.json    ${eval_jsn_ob}
    OperatingSystem.Move File    ${GET_DATA_TRFDIR}/data-gamectg-new.json    ${GET_DATA_MOCKDIR}
    ${rspns_nw_js}    OperatingSystem.Get Binary File    ${GET_DATA_MOCKDIR}/data-gamectg-new.json
    ${EXPECTED_RESPONSE}    OperatingSystem.Get Binary File
    ...    ${GET_DATA_MOCKDIR}/data-gamectg-mock.json
    &{evl_rpns_js}    BuiltIn.Evaluate    json.loads('''${rspns_nw_js}''')    json
    &{evl_expc_js}    BuiltIn.Evaluate    json.loads('''${EXPECTED_RESPONSE}''')    json
    Collections.Dictionaries Should Be Equal    ${evl_rpns_js}
    ...    ${evl_expc_js}
    Collections.Log Dictionary    ${evl_rpns_js}
    Collections.Log Dictionary    ${evl_expc_js}
    BuiltIn.Set Global Variable    ${evl_rpns_js}
    RETURN    ${eval_jsn_ob}
