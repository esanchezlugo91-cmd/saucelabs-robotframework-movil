*** Settings ***
Documentation    Suite de Pruebas de Fin a Fin: Gestión del Carrito de Compras (Agregar, Verificar y Eliminar Productos)
Library          AppiumLibrary
Resource         ${EXECDIR}/resources/resource.robot
Variables        ${EXECDIR}/resources/variables_productos.py
Test Setup       Abrir la aplicacion


*** Test Cases ***
Verificar ciclo completo de agregar producto al carrito
    [Documentation]    Valida el flujo completo desde el login, búsqueda, agregar el producto y consistencia de datos en el carrito.
    Logueo exitoso
    Flujo Completo Agregar Producto Al Carrito    ${ID_BACKPACK_VIOLET}    ${NAME_BACKPACK_VIOLET}    ${PRICE_GENERAL}
    Clic en Imagen Carrito de Compras
    Verificar Nombre y Precio del Producto Dentro del Carrito de Compras    ${ID_FIRST_PRODUCT}    ${NAME_BACKPACK_VIOLET}    ${PRICE_GENERAL}
    Verificar Numero de Items y Precio Total    ${ITEMS_FIRST_PRODUCT}    ${PRICE_GENERAL}
    


Verificar ciclo completo de agregar productos al carrito
    [Documentation]    Valida el flujo completo desde el login, búsqueda, agregar los productos y consistencia de datos en el carrito.
    Logueo exitoso
    Flujo Completo Agregar Producto Al Carrito    ${ID_BACKPACK_VIOLET}    ${NAME_BACKPACK_VIOLET}    ${PRICE_GENERAL}
    Regresar al catalogo de productos
    Flujo Completo Agregar Producto Al Carrito    ${ID_BACKPACK_ORANGE}    ${NAME_BACKPACK_ORANGE}    ${PRICE_GENERAL}
    Regresar al catalogo de productos
    Flujo Completo Agregar Producto Al Carrito    ${ID_BACKPACK_YELLOW}    ${NAME_BACKPACK_YELLOW}    ${PRICE_GENERAL}
    Clic en Imagen Carrito de Compras
    Verificar Nombre y Precio del Producto Dentro del Carrito de Compras    ${ID_FIRST_PRODUCT}    ${NAME_BACKPACK_VIOLET}    ${PRICE_GENERAL}
    Verificar Nombre y Precio del Producto Dentro del Carrito de Compras    ${ID_SECOND_PRODUCT}    ${NAME_BACKPACK_ORANGE}    ${PRICE_GENERAL}
    Verificar Nombre y Precio del Producto Dentro del Carrito de Compras    ${ID_THIRD_PRODUCT}    ${NAME_BACKPACK_YELLOW}     ${PRICE_GENERAL}
    Verificar Numero de Items y Precio Total    ${ITEMS_THIRD_PRODUCT}    ${PRICE_THIRD_PRODUCT}


*** Keywords ***
Clic en Imagen Carrito de Compras
    Click Element    ${PRODUCTS}[id_image_cart]