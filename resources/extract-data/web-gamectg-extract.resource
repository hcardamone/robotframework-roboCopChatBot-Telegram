*** Comments ***
# Behavior Driven Development (BDD) and Functional Testing
[Documentation]    Here are the web extract data Keywords implementation resources


*** Settings ***
Resource        ../bdd-resources/gamectg-BDD.resource
Library         OperatingSystem
Library         Screenshot    screenshot_directory${var_ext_dir}
Variables       ../common/selenium-resources/web-elements/extract-web-elements.yaml
Variables       ../robot-variables/robot_variables.py


*** Variables ***
${var_ext_dir}      C:\\Users\\henri\\OneDrive\\Documentos\\GitHub\\sap-process-automation-lab\\resources\\extract-data
${sc_sht_name}      selenium-screenshot-1.png


*** Keywords ***
Get the game data detail information on xbox game catalog
    SeleniumLibrary.Page Should Contain    ${xboxpage.cttitle}
    SeleniumLibrary.Set Focus To Element    ${xboxpage.ftgenre}
    SeleniumLibrary.Click Element    ${xboxpage.ftgenre}
    SeleniumLibrary.Click Element    ${xboxpage.acadvid}
    SeleniumLibrary.Page Should Contain    ${xboxpage.acaddsp}    30
    SeleniumLibrary.Execute Javascript    window.scrollTo(0,559)
    SeleniumLibrary.Set Selenium Implicit Wait    ${EXPLICIT_WAIT}
    SeleniumLibrary.Set Focus To Element    ${xboxpage.gmimgid}
    ${gameelementmock}    SeleniumLibrary.Element Should Be Visible    ${xboxpage.gelmock}
    Log    ON SALE Grand Theft Auto V: Premium EditionFull price was $29.99 New price is $14.99    console=True
    Log    Test Suite Static: PASS, for more details check the log    console=True
    ${cpt_pg_scre}    SeleniumLibrary.Capture Page screenshot    ${sc_sht_name}
    OperatingSystem.Move File    ${cpt_pg_scre}    ${var_ext_dir}
