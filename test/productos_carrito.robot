*** Settings ***
Documentation    Agregar y eliminar productos del carrito de compras
Library          AppiumLibrary
Resource         ${EXECDIR}/resources/resource.robot
Test Setup       Abrir la aplicacion

*** Test Cases ***
Agregar productos al carrito de compras
    [Documentation]    Prueba agregar productos al carrito
    Logueo exitoso
    Seleccionar producto    3    Sauce Labs Backpack (violet)
    Verificar nombre y precio del producto   Sauce Labs Backpack (violet)


