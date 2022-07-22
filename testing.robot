*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Open Page 
    ${chromeOptions}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chromeOptions}    add_argument    headless
    Call Method    ${chromeOptions}    add_argument    no-sandbox
    Call Method    ${chromeOptions}    add_argument    disable-dev-shm-usage
    Create Webdriver    Chrome    chrome_options=${chromeOptions}
    Go To   https://automationintesting.com/selenium/testpage/   
    Set Window Size    1920  1080

Some Action
    Wait Until Element Is Visible    //input[@id="firstname"]
    Input Text    //input[@id="firstname"]    Test
    Press Keys    //input[@id="firstname"]    RETURN

*** Test Cases ***
Testing a Generic case
    Open Page
    Some Action
    [Teardown]    Close Browser
