*** Settings ***
Documentation     Create a Project using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:8069/
${PROJECT URL}    http://localhost:8069/web#cids=1&menu_id=211&action=327&model=project.project&view_type=kanban
${BROWSER}        Chrome

*** Test Cases ***
My create project test case
    I want to open odoo login page
    Sleep    3s
    Input my email    odoo
    Sleep    3s
    Input my password    odoo
    Sleep    3s
    Submit my credentials
    Sleep    3s
    I should see this page  
    Sleep    3s
    I want to see project
    Sleep    3s
    Click create
    Sleep    3s
    Input Project name    ProjectTesting4
    Sleep    3s
    Click create again
    Sleep    5s
    [Teardown]    Close Browser

*** Keywords ***
I want to open odoo login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Odoo

Input my email
    [Arguments]    ${email}
    Input Text    login    ${email}

Input my password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit my credentials
    Click Element       //*[contains(text(),'Log in')]

I should see this page
    Title Should Be    Odoo - Discuss
    
I want to see project
    Go To    ${PROJECT URL}

Click create
    Click Element	//*[contains(text(),'Create')]
    
Input Project name
    [Arguments]    ${name}
    Input Text    name    ${name}

Click create again
    Click Element	xpath://html/body/div[2]/div[5]/div/div/div/div/footer/div/footer/button[1]

