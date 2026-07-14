*** Settings ***
Documentation    Caso de prueba nativo para abrir la app de forma automatica e interactuar
Library          AppiumLibrary
Resource         ${EXECDIR}/resources/resource.robot
Test Setup       Abrir la aplicacion

*** Test Cases ***
Mi Primer Inicio De Aplicacion
    [Documentation]    Prueba la apertura y navegación básica en la app de Sauce Labs
    Seleccionar Producto Y Ver Carrito

*** Keywords ***
Seleccionar Producto Y Ver Carrito
    Click Element    xpath=(//android.widget.ImageView[@content-desc="Product Image"])[1]
    Click Element    id=com.saucelabs.mydemoapp.android:id/cartBt
    Click Element    id=com.saucelabs.mydemoapp.android:id/cartIV
