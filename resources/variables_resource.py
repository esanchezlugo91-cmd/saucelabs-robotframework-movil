import os

CAPABILITIES ={
"android_automation_name": "UIAutomator2",
"android_platform_name": "Android",
"android_platform_version": "17",
"emulator_name": "Pixel_7_Pro",
"android_app": os.path.join(os.getcwd(), "app", "android", "mda-2.2.0-25.apk")
}

USER_NAME ="bod@example.com"
PASSWORD = "10203040"
INVALID_USER_NAME = "alice@example.com"
INVALID_PASSWORD = "10203041"

NAVIGATION = {
    "menu_hamburguesa": "id=com.saucelabs.mydemoapp.android:id/menuIV",
    "menu_login": "xpath=//android.widget.TextView[@content-desc=\"Login Menu Item\"]"
}

LOGIN_INPUTS = {
    "text_box_username": "id=com.saucelabs.mydemoapp.android:id/nameET",
    "text_box_password": "id=com.saucelabs.mydemoapp.android:id/passwordET",
    "boton_login": "id=com.saucelabs.mydemoapp.android:id/loginBtn"
}