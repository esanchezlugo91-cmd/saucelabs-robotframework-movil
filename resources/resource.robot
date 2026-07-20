
*** Settings ***
Documentation   Este archivo contiene palabras claves y variables reutilizables.
Library        AppiumLibrary
Library      String
Variables    ${EXECDIR}/resources/variables_resource.py
Variables        ${EXECDIR}/resources/variables_productos.py


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


Logueo exitoso
    [Documentation]     Caso de prueba para validar que el usuario ingresa correctamente a la aplicacion.
    Ir a la pantalla de Login
    Rellenar el formulario de acceso    ${USER_NAME}    ${PASSWORD}

Seleccionar producto
    [Documentation]    Selecciona un producto validando su índice y texto de forma segura.
    [Arguments]    ${index_product}    ${text_product}

    ${product_list}       Format String    ${PRODUCTS}[id_products]    ${index_product}
    ${text_products}      Format String    ${PRODUCTS}[text_product]    ${index_product}


    Wait Until Page Contains Element    ${product_list}     timeout=5s

    FOR    ${intento}    IN RANGE    1    6

        ${visible}    Run Keyword And Return Status    Page Should Contain Element    ${text_products}

        IF    ${visible}

            ${texto_actual}    Get Text    ${text_products}
            ${coincide}    Run Keyword And Return Status    Should Be Equal As Strings    ${texto_actual}    ${text_product}

            IF    ${coincide}
                BREAK
            END
        END

        IF    ${intento} == 5
            Fail    El producto '${text_product}' no se encontró tras realizar scroll.
        END

        Swipe    start_x=500    start_y=800    end_x=500    end_y=300    duration=1000
        Sleep    1s
    END

    Click Element    ${product_list}


Verificar nombre y precio del producto
    [Documentation]    Verifica el nombre del producto y precio en la pantalla de detalle.
    [Arguments]    ${nombre_producto}

    ${locator_titulo}    Set Variable    ${PRODUCTS}[principal_text]
    Wait Until Page Contains Element    ${locator_titulo}     timeout=10s
    Element Text Should Be    ${locator_titulo}    ${nombre_producto}
