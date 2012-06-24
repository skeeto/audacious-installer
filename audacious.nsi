!include "MUI2.nsh"

Name "Audacious - An Advanced Audio Player"
Outfile "audacious-${VERSION}-installer.exe"
XPStyle on

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

InstallDir "$PROGRAMFILES\Audacious"

!insertmacro MUI_LANGUAGE "English"

!define ADDREM "Software\Microsoft\Windows\CurrentVersion\Uninstall"

section
  SetShellVarContext all
  setOutPath $INSTDIR
  File /r bin
  File /r etc
  File /r lib
  File /r share
  File README.txt
  writeUninstaller $INSTDIR\uninstall.exe
  WriteRegStr HKLM "${ADDREM}\Audacious" \
                   "DisplayName" "Audacious"
  WriteRegStr HKLM "${ADDREM}\Audacious" \
                   "UninstallString" "$\"$INSTDIR\uninstall.exe$\""
  WriteRegStr HKLM "${ADDREM}\Audacious" \
                   "QuietUninstallString" "$\"$INSTDIR\uninstall.exe$\" /S"
sectionEnd

section "Start Menu shortcut" StartMenuLnk
  createShortCut "$SMPROGRAMS\Audacious.lnk" "$INSTDIR\bin\audacious.exe"
sectionEnd

section "Desktop shortcut" DesktopLnk
  createShortCut "$DESKTOP\Audacious.lnk" "$INSTDIR\bin\audacious.exe"
sectionEnd

section "Uninstall"
  SetShellVarContext all
  delete $INSTDIR\uninstall.exe
  RMDir /r $INSTDIR
  delete "$SMPROGRAMS\Audacious.lnk"
  delete "$DESKTOP\Audacious.lnk"
  DeleteRegKey HKLM "${ADDREM}\Audacious"
sectionEnd


; Section descriptions

LangString DESC_DesktopLnk ${LANG_ENGLISH} \
           "Create a shortcut on your desktop."
LangString DESC_StartMenuLnk ${LANG_ENGLISH} \
           "Add a root Start Menu shortcut."

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${DesktopLnk} $(DESC_DesktopLnk)
  !insertmacro MUI_DESCRIPTION_TEXT ${StartMenuLnk} $(DESC_StartMenuLnk)
!insertmacro MUI_FUNCTION_DESCRIPTION_END
