REM Author: David Herrmann
REM 

REM set environment variable for EGit to find the user's home directory
setx HOME %CD%\misc

REM set environment variable for Android Development Tools to find the .android folder in android-sdk
setx ANDROID_SDK_HOME %CD%\android-sdk

REM execute eclipse in the eclipse folder
cd eclipse
.\eclipse.exe