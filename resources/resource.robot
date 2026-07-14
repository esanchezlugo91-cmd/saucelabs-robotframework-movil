
*** Settings ***
Documentation   Este archivo contiene palabras claves y variables reutilizables.
Library        AppiumLibrary
Variables    ${EXECDIR}/resources/variables_resource.py


*** Keywords ***
Abrir la aplicacion
  Open Application    http://127.0.0.1:4723  automationName=${CAPABILITIES}[android_automation_name]
  ...  platformName=${CAPABILITIES}[android_platform_name]  platformVersion=${CAPABILITIES}[android_platform_version]
  ...  app=${CAPABILITIES}[android_app]
  ...  avd=${CAPABILITIES}[emulator_name]
  ...  appPackage=com.saucelabs.mydemoapp.android
  ...  appActivity=com.saucelabs.mydemoapp.android.view.activities.SplashActivity
  ...  appWaitActivity=com.saucelabs.mydemoapp.android.view.activities.SplashActivity,com.saucelabs.mydemoapp.android.view.activities.MainActivity
  ...  appWaitDuration=30000


Ir a la pantalla de Login
    Wait Until Element Is Visible    ${NAVIGATION}[menu_hamburguesa]    timeout=15s
    Click Element    ${NAVIGATION}[menu_hamburguesa]
    Click Element    ${NAVIGATION}[menu_login]


Rellenar el formulario de acceso
    [Arguments]    ${user_name}    ${password}
    Wait Until Element Is Visible    ${LOGIN_INPUTS}[text_box_username]    timeout=10s
    Input Text    ${LOGIN_INPUTS}[text_box_username]    ${user_name}
    Input Text    ${LOGIN_INPUTS}[text_box_password]    ${password}
    Click Element    ${LOGIN_INPUTS}[boton_login]

