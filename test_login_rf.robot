*** Settings ***
Library    SeleniumLibrary
Documentation    Suite secription #automated tests for scout website


*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${REMINDPASSWORD URL}       https://scouts-test.futbolkolektyw.pl/en/remind
${BROWSER}      Chrome
${SIGNINBUTTON}     xpath=//*[(text()= 'Sign in')]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${PAGELOGO}     xpath=//*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]
${REMINDPASSWORD}       xpath=//*[@id="__next"]/form/div/div[1]/a
${EMAILFIELD}       xpath=//*[@id="__next"]/div[1]/div/div[1]/div/div/input
${SENDBUTTON}       xpath=//*[@id='__next']/div[1]/div/div[2]/button/span[1]
${LANGUAGEBUTTON}       xpath=//*[@id='__next']/form/div/div[2]/div/div
${POLSKIBUTTON}     xpath=//*[@id='menu-']/div[3]/ul/li[1]
${blank}

*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    [Teardown]  Close Browser

Login to the system fail
    Open Login Page
    Type In Email
    Set The Wrong Password Field
    Click On The Submit Button
    Assert Dashboard
    [Teardown]    Close Browser

Remind password functionality
    Open Login Page
    Click On The Remind Password
    Type In Remindemail
    Click On The Send Button
    [Teardown]  Close Browser

Login to the system fail blank fields
    Open Login Page
    Set Empty Email Field
    Set Empty Password Field
    Click On The Submit Button
    [Teardown]    Close Browser

Changing language
    Open Login Page
    Click On The Language Button
    Click On The Polski Button
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser        ${LOGIN URL}        ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}   user01@getnada.com
Type in password
    Input Text      ${PASSWORDINPUT}    Test-1234
Click on the Submit button
    Click Element       xpath=//*[(text()= 'Sign in')]
Click on the remind password
    Click Element       xpath=//*[@id="__next"]/form/div/div[1]/a
Type in remindemail
    Input Text      ${EMAILFIELD}       ${blank}
Click on the send button
    Click Element       xpath=//*[@id='__next']/div[1]/div/div[2]/button/span[1]
Click on the language button
    Click Element       xpath=//*[@id='__next']/form/div/div[2]/div/div
Click on the Polski button
    Click Element        xpath=//*[@id='menu-']/div[3]/ul/li[1]
Set the wrong password field
    Input Text      ${PASSWORDINPUT}
Assert dashboard
    Wait Until Element Is Visible       ${PAGELOGO}
    Title Should Be     Scouts panel
    Capture Page Screenshot     alert.png
Set empty email field
    Input Text      ${EMAILINPUT}
Set empty password field
    Input Text    ${PASSWORDINPUT}

