*** Settings ***
Documentation       This resource open the mozilla firefox

Library             SeleniumLibrary
Variables           ./web-elements/extract-web-elements.yaml


*** Variables ***
${FIREFOX_BROWSER}      firefox
${FIREFOX_HEADLESS}     headlessfirefox


*** Keywords ***
Close My Current Browser
    [Documentation]    Code to close the brownser
    SeleniumLibrary.Close All Browsers

Open The Local Browser
    [Documentation]    Code to OPEN the brownser
    SeleniumLibrary.Open Browser    ${xboxpage.allgmes}    ${FIREFOX_HEADLESS}
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Wait Until Element Is Visible    ${xboxpage.ctpmenu}
    SeleniumLibrary.Title Should Be    ${xboxpage.cttitle}
