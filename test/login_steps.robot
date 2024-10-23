*** Settings ***
Resource    ../resources/login_keywords.resource
Suite Setup    Open Browser    browser=chrome


*** Test Cases ***
Successful Login
    I navegate to the login page
    I input correct credentials
    I click on the login button
    I am able view the home page

Unsuccessful Login - No credentials
    I navegate to the login page
    I click on the login button 
    I am able to see the expected error message for no credentials

Unsuccessful Login - No username
    I navegate to the login page
    I input only the Password
    I click on the login button 
    I am able to see the expected error message for no username

Unsuccessful Login - No password
    I navegate to the login page
    I input only the Username
    I click on the login button 
    I am able to see the expected error message for no password

Unsuccessful Login - Wrong credentials
    I navegate to the login page
    I input wrong credentials
    I click on the login button 
    I am able to see the expected error message for wrong credentials