*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser

*** Test Cases ***
At start the counter is zero
    Go To  ${HOME_URL}
    Title Should Be  Laskuri
    Page Should Contain  nappia painettu 0 kertaa

When button pressed twice the counter is two
    Go To  ${HOME_URL}
    Click Button  Paina
    Click Button  Paina
    Page Should Contain  nappia painettu 2 kertaa

When counter has a nonzero value and it is reset the value becomes zero
    Go To  ${HOME_URL}
    Click Button  Paina
    Click Button  Nollaa
    Page Should Contain  nappia painettu 0 kertaa

When value is manually set it changes the counter
    Go To  ${HOME_URL}
    Input Text  name:value  7
    Click Button  Aseta
    Page Should Contain  nappia painettu 7 kertaa

Setting value again overwrites the previous one
    Go To  ${HOME_URL}
    Input Text  name:value  5
    Click Button  Aseta
    Page Should Contain  nappia painettu 5 kertaa
    Input Text  name:value  12
    Click Button  Aseta
    Page Should Contain  nappia painettu 12 kertaa

Setting value to zero resets the counter effectively
    Go To  ${HOME_URL}
    Input Text  name:value  9
    Click Button  Aseta
    Page Should Contain  nappia painettu 9 kertaa
    Input Text  name:value  0
    Click Button  Aseta
    Page Should Contain  nappia painettu 0 kertaa
