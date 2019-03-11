!define MUI_PRODUCT "Frietec Google Service"
!define MUI_VERSION "1.0.0"
!define MUI_BRANDINGTEXT "Frietec Google Service v 1.0"
!define AUTHOR "paudekri@frietec.com"

Name "${MUI_PRODUCT}"
OutFile "FE-Google.exe"
InstallDir "C:\Frietec\${MUI_PRODUCT}"

!include MUI2.nsh
!define MUI_ICON "Resources\installer.ico"
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_LANGUAGE "German"
 

Section "install" Installation
  # Copy scripts 
  SetOutPath $INSTDIR
  #File Scripts\Calendar.bat
  #File Scripts\Drive.bat
  #File Scripts\Email.bat
  File /r Scripts scripts
  SetOutPath $INSTDIR\resources
  File Resources\email.ico
  File Resources\drive.ico
  File Resources\calendar.ico
  File Resources\installer.ico  
  WriteUninstaller $INSTDIR\uninstall.exe
SectionEnd

Section "Shortcuts"
  CreateDirectory "$Desktop\${MUI_PRODUCT}"
  CreateShortCut "$Desktop\${MUI_PRODUCT}\Uninstall.lnk" "$INSTDIR\Uninstall.exe"
  CreateShortCut "$Desktop\${MUI_PRODUCT}\Shortcut to Email.lnk" $INSTDIR\scripts\"Email.bat" Icon $INSTDIR\resources\"email.ico"
  CreateShortCut "$Desktop\${MUI_PRODUCT}\Shortcut to Drive.lnk" $INSTDIR\scripts\"Drive.bat" Icon $INSTDIR\resources\"drive.ico"
  CreateShortCut "$Desktop\${MUI_PRODUCT}\Shortcut to Kalendar.lnk" $INSTDIR\scripts\"Calendar.bat" Icon $INSTDIR\resources\"calendar.ico"  

  CreateDirectory "$SMPROGRAMS\${MUI_PRODUCT}"
  CreateShortCut "$SMPROGRAMS\${MUI_PRODUCT}\Uninstall.lnk" "$INSTDIR\Uninstall.exe"
  CreateShortCut "$SMPROGRAMS\${MUI_PRODUCT}\Email.lnk" "$INSTDIR\scripts\Email.bat" Icon $INSTDIR\resources\"email.ico"
  CreateShortCut "$SMPROGRAMS\${MUI_PRODUCT}\Drive.lnk" "$INSTDIR\scripts\Drive.bat" Icon $INSTDIR\resources\"drive.ico"
  CreateShortCut "$SMPROGRAMS\${MUI_PRODUCT}\Kalendar.lnk" "$INSTDIR\scripts\Calendar.bat" Icon $INSTDIR\resources\"calendar.ico"
SectionEnd

Section "Uninstall"
  Delete $INSTDIR\uninstall.exe
  RMDir /r "$INSTDIR\*.*"
  #Delete $INSTDIR\*.*
  RMDir $INSTDIR
  
  Delete "$Desktop\${MUI_PRODUCT}\*.*"
  RMDir "$Desktop\${MUI_PRODUCT}"
  Delete "$SMPROGRAMS\${MUI_PRODUCT}\*.*"
  RMDir "$SMPROGRAMS\${MUI_PRODUCT}"
  #Delete "$Desktop\FE-Google\Shortcut to Kalendar.lnk"
SectionEnd

;Function that calls a messagebox when installation finished correctly
#Function .onInstSuccess
#  MessageBox MB_OK "You have successfully installed ${MUI_PRODUCT}. Use the desktop icon to start the program."
#FunctionEnd
 
 
Function un.onUninstSuccess 
  MessageBox MB_OK "Sie haben erfolgereich deinstalliert=> ${MUI_PRODUCT}."
FunctionEnd