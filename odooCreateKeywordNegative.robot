*** Settings ***
Documentation     Create a Project using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:8069/
${PROJECT URL}    http://localhost:8069/web#cids=1&menu_id=211&action=327&model=project.project&view_type=kanban
${BROWSER}        Chrome

*** Test Cases ***
My create task test case (Negative)
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
    Click My Tasks
    Sleep    3s
    Click create on tasks
    Sleep    3s
    Input my title    SameTaskAgain2
    Sleep    3s
    Save my task
    Sleep    3s
    Click my tasks 2
    Sleep    3s
    Click create task 2
    Sleep    3s
    Input same title again    SameTaskAgain2
    Sleep    3s
    Save my task 2
    Sleep    3s
    Click my task 3
    Sleep    8s
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


Click My Tasks
    Click Element      xpath://html/body/header/nav/div[2]/a[2]

Click create on tasks
    Click Element      xpath://html/body/div[1]/div/div[1]/div[2]/div[1]/div/div/button

Input my title
    [Arguments]    ${name}
    Input Text    xpath://html/body/div[1]/div/div[2]/div/div[1]/div[3]/div[3]/h1/input    ${name}

Save my task
    Click Element    //*[contains(text(),'Save')]
    
Click my tasks 2
    Click Element    xpath://html/body/header/nav/div[2]/a[2]

Click create task 2
    Click Element    xpath://html/body/div[1]/div/div[1]/div[2]/div[1]/div/div/button

Input same title again
    [Arguments]    ${name}
    Input Text    xpath://html/body/div[1]/div/div[2]/div/div[1]/div[3]/div[3]/h1/input    ${name}

Save my task 2
    Click Element    //*[contains(text(),'Save')]

Click my task 3
    Click Element    xpath://html/body/header/nav/div[2]/a[2]
    
