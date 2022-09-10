*** Settings ***
Documentation       This resource provide code to generete the .json obj.

Library             OperatingSystem
Library             String
Variables           ../common/selenium-resources/web-elements/extract-web-elements.yaml
Variables           ../robot-variables/robot_variables.py


*** Keywords ***
Generate Json File
    [Documentation]    This KW create the json file that contain game data information
    [Arguments]    @{args}
    ${GNAMECNT}    String.Get Substring    ${xboxpage.gelmock}    -77    -42
    Set Global Variable    ${GNAMECNT}
    ${GVALCNT}    String.Get Substring    ${xboxpage.gelmock}    92    -3
    Set Global Variable    ${GVALCNT}
    ${GGNRCNT}    String.Get Substring    ${xboxpage.acadelm}    16    -3
    Set Global Variable    ${GGNRCNT}
    ${GJSONOBJ}    OperatingSystem.Get Binary File
    ...    ${GET_DATA_ECTDIR}/data-gamectg-extract.json
    ${GJSONCRT}    OperatingSystem.Create Binary File
    ...    ${GET_DATA_TRFDIR}/data-gamectg-LOAD.json
    ...    ${GJSONOBJ}
