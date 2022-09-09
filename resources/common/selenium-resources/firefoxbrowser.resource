*** Settings ***
Library         SeleniumLibrary
Variables       ./web-elements/extract-web-elements.yaml


*** Variables ***
${FIREFOX_BROWSER}      firefox
${firefox_headless}     headlessfirefox


*** Keywords ***
That local firefox brownser was open
    SeleniumLibrary.Open browser    ${xboxpage.allgmes}    ${firefox_headless}
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Wait Until Element Is Visible    ${xboxpage.ctpmenu}
    SeleniumLibrary.Title Should Be    ${xboxpage.cttitle}

Close my current browser
    SeleniumLibrary.Close All Browsers
