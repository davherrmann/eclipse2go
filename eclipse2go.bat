@echo off & setlocal
REM Author: David Herrmann
REM startup script for eclipse2go with ADT
echo Author: David Herrmann
echo startup script for eclipse2go with ADT

REM path of ADT preferences file
set adtPrefsPath=".\workspace\.metadata\.plugins\org.eclipse.core.runtime\.settings\com.android.ide.eclipse.adt.prefs"
REM path of the SDK home folder
set sdkPath=%CD%\android-sdk

REM escape characters (\ and :) in the path
set sdkPath=%sdkPath:\=\\%
set sdkPath=%sdkPath::=\:%
set sdkPath=com.android.ide.eclipse.adt.sdk=%sdkPath%

REM read last line of the ADT preferences file
set "lastLine="
for /f "tokens=1* delims=:" %%i in ('findstr /n "^" %adtPrefsPath%') do set "lastLine=%%j"

REM check if setting the right path is already done
IF "%lastLine%"=="%sdkPath%" (
	echo Android SDK home already set.
) ELSE (
	echo "Setting Android SDK home in ADT..."
	(echo. && echo %sdkPath%) >> %adtPrefsPath%
	echo "Android SDK home set."
)

REM set environment variable for Android Development Tools to find the .android folder in android-sdk
setx ANDROID_SDK_HOME %CD%\android-sdk

REM execute eclipse in the eclipse folder
cd eclipse
.\eclipse.exe