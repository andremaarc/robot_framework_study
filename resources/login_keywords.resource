*** Settings ***
Library    SeleniumLibrary
Variables    ../variables/variables.py 

*** Keywords ***
I navegate to the login page
    Go To    ${URL_DATA["baseUrl"]}
    Wait Until Element Is Visible    id=user-name

I input correct credentials
    Input Text    id=user-name    ${LOGIN_DATA["correctData"]["username"]}
    Input Text    id=password    ${LOGIN_DATA["correctData"]["password"]}
    
I input wrong credentials
    Input Text    id=user-name    ${LOGIN_DATA["wrongData"]["username"]}    
    Input Text    id=password    ${LOGIN_DATA["wrongData"]["password"]}

I click on the login button
    Click Button    id=login-button

I am able view the home page
    ${location}    Get Location
    ${fullUrl}    Catenate    SEPARATOR=    ${URL_DATA["baseUrl"]}    ${URL_DATA["inventoryUrl"]}
    Should Be Equal    ${location}    ${fullUrl}

I input only the Username
    Input Text    id=user-name    ${LOGIN_DATA["correctData"]["username"]}

I input only the Password
    Input Text    id=password    ${LOGIN_DATA["correctData"]["password"]}

I am able to see the expected error message for no credentials
    Wait Until Element Contains    class=error-message-container    ${ERROR_MESSAGES["noCredentials"]}
 
I am able to see the expected error message for no username
    Wait Until Element Contains    class=error-message-container    ${ERROR_MESSAGES["noUsername"]}
 
I am able to see the expected error message for no password
    Wait Until Element Contains    class=error-message-container    ${ERROR_MESSAGES["noPassword"]}
 
I am able to see the expected error message for wrong credentials
    Wait Until Element Contains    class=error-message-container    ${ERROR_MESSAGES["wrongCredentials"]}
