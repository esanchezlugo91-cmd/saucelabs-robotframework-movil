*** Settings ***
Documentation
Library          AppiumLibrary
Resource         ${EXECDIR}/resources/resource.robot
Variables        ${EXECDIR}/resources/variables_login.py
Test Setup       Abrir la aplicacion


*** Test Cases ***
Login Username correcto y password correcto
    [Documentation]     Caso de prueba para validar que el usuario ingresa correctamente a la aplicacion.
    Ir a la pantalla de Login
    Rellenar el formulario de acceso    ${USER_NAME}    ${PASSWORD}
    Verificar titulo de productos en el home


Login Username incorrecto y password correcto
    [Documentation]     Caso de prueba para validar el bloqueo de usuario con credenciales incorrectas.
    Ir a la pantalla de Login
    Rellenar el formulario de acceso    ${INVALID_USER_NAME}    ${INVALID_PASSWORD}
    Verificar mensaje de error de acceso


*** Keywords ***
Verificar mensaje de error de acceso
    Wait Until Element Is Visible    ${LOGIN_SCREEN}[id_message]    timeout=10s
    Element Text Should Be    ${LOGIN_SCREEN}[id_message]   ${TEXT_MESSSAGE}

Verificar titulo de productos en el home
    Wait Until Element Is Visible    ${HOME_SCREEN}[id_products]    timeout=10s
    Element Text Should Be    ${HOME_SCREEN}[id_products]   ${TEXT_PRODUCTS}



    