*** Settings *** 
Library    SeleniumLibrary

*** Variables ***
${browser}          Chrome
${website}          https://www.oamk.fi/en/

${navigation}       //*[@id="nav1"]
${search_bar}       //*[@id="kielivalikko"]/ul/li[5]/a
${search_input}     //*[@id="hakusana"]
${search_button}    //*[@id="ela_haku_widget"]/button
${accept_cookies_btn}            //*[@id="cookie-bar"]/div[1]/button[1]
${search_result_link}            //*[@id="ela_hakutulokset"]/div[5]/div[1]/a
${degree_programme_link}         //a[contains(text(),"Bachelor of Engineering, Information Technology")]
${degree_programme_tab_title}    //h1[contains(@id,"title1") and contains(text(), "Bachelor of Engineering, Information Technology")]

*** Test Cases ***
Search "Bachelor of Engineering, Information Technology" at oamk.fi
    Open Website
    Accept Cookies
    Open Search
    Input "Information Technology" To Search
    Press "Search" Button
    Open "Information Technology" Tab
    Open Degree Programme Page

*** Keywords *** 
Open Website
    Open Browser    ${website}       ${browser} 
    Wait Until Element Is Visible    ${navigation}

Accept Cookies
    Wait Until Element Is Visible    ${accept_cookies_btn} 
    Click Button     ${accept_cookies_btn}   

Open Search
    Click Element   ${search_bar}

Input "Information Technology" To Search
    Input Text      ${search_input}   Information Technology

Press "Search" Button
    Click Button    ${search_button}

Open "Information Technology" Tab
    Wait Until Element Is Visible    ${search_result_link}
    Click Element    ${search_result_link} 

Open Degree Programme Page
    Wait Until Element Is Visible    ${degree_programme_link}
    Click Element    ${degree_programme_link}

Validate Degree Programme Page Is Open
    Element Should Be Visible    ${degree_programme_tab_title}