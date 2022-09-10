*** Settings ***
Documentation       This resource provide code to get data game information on xbox.com.

Resource            ../bdd-resources/gamectg-BDD.resource
Library             Screenshot    screenshot_directory${DEXTDIR}


*** Variables ***
${DEXTDIR}      C:\\Users\\henri\\OneDrive\\Documentos\\GitHub\\sap-process-automation-lab\\resources\\extract-data


*** Keywords ***
Get The Game Data
    [Documentation]    KW to get game data information
    SeleniumLibrary.Page Should Contain    ${xboxpage.cttitle}
    SeleniumLibrary.Set Focus To Element    ${xboxpage.ftgenre}
    SeleniumLibrary.Click Element    ${xboxpage.ftgenre}
    SeleniumLibrary.Click Element    ${xboxpage.acadvid}
    SeleniumLibrary.Page Should Contain    ${xboxpage.acaddsp}    30
    SeleniumLibrary.Execute Javascript    window.scrollTo(0,559)
    SeleniumLibrary.Set Selenium Implicit Wait    ${EXPLICIT_WAIT}
    SeleniumLibrary.Set Focus To Element    ${xboxpage.gmimgid}
    ${GAMEELMOCK}    SeleniumLibrary.Element Should Be Visible    ${xboxpage.gelmock}
