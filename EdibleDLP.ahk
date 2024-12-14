/*
EdibleDLP 0.0-241214 script by paphere/pap-git

THIS COMMENT-OUT MUST NOT BE EDITED/DELETED/REMOVED!

Before editing my code, you accept to this rules:
 - You must not remove this comment-out
 - You must write my @username and your username to "About" dialog
 - You need to credit to me
-----------------------------------------------------------------------------------------------
This project is licensed under the GNU General Public License v3.0.

| Permissions of this strong copyleft license are conditioned on making available complete
| source code of licensed works and modifications, which include larger works using a licensed
| work, under the same license. Copyright and license notices must be preserved. Contributors
| provide an express grant of patent rights. 

To see full license, Here is the link: https://github.com/pap-git/EdibleDLP/blob/main/LICENSE
-----------------------------------------------------------------------------------------------
*/

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#NoTrayIcon
#Persistent
#SingleInstance force

global ManualURL := ""
global MediaIs := "??"
global LVRow := "1"
global DefaultPath := "1"
global Language := "EN"

IfNotExist, lang.ini
{
    Msgbox 0x10, Language file doesn't exist, From EdibleDLP 0.0.241214, You need to download lang.ini from EdibleDLP repository.`nThis contains two languages, which applies to English.`nTo EdibleDLP works, You need to download lang.ini from GitHub.`n`nCurrent app will exit.
    ExitApp
}
IfNotExist, settings.ini
{
    Language := "EN"
    IniWrite, %Language%, settings.ini, EdibleDLPSettings, SelectedLanguage
}
IfExist, settings.ini
{
    IniRead, Language, settings.ini, EdibleDLPSettings, SelectedLanguage
}

IniRead, GUI_MAIN_CUSTOM, lang.ini, %Language%, GUI_MAIN_CUSTOM
IniRead, GUI_WIP, lang.ini, %Language%, GUI_WIP

IniRead, GUI_ERROR, lang.ini, %Language%, GUI_ERROR

IniRead, GUI_FIRSTTIME_CHECK, lang.ini, %Language%, GUI_FIRSTTIME_CHECK
IniRead, GUI_REDOWNLOAD, lang.ini, %Language%, GUI_REDOWNLOAD
IniRead, GUI_UPDATE_DLP, lang.ini, %Language%, GUI_UPDATE_DLP

IniRead, DIALOG_NOTFOUND_YTDLP_TITLE, lang.ini, %Language%, DIALOG_NOTFOUND_YTDLP_TITLE
IniRead, DIALOG_NOTFOUND_YTDLP_DESC1, lang.ini, %Language%, DIALOG_NOTFOUND_YTDLP_DESC1
IniRead, DIALOG_NOTFOUND_YTDLP_DESC2, lang.ini, %Language%, DIALOG_NOTFOUND_YTDLP_DESC2
IniRead, DIALOG_NOTFOUND_YTDLP_DESC3, lang.ini, %Language%, DIALOG_NOTFOUND_YTDLP_DESC3

IniRead, DIALOG_NOTFOUND_FFMPEG_TITLE, lang.ini, %Language%, DIALOG_NOTFOUND_FFMPEG_TITLE
IniRead, DIALOG_NOTFOUND_FFMPEG_DESC1, lang.ini, %Language%, DIALOG_NOTFOUND_FFMPEG_DESC1
IniRead, DIALOG_NOTFOUND_FFMPEG_DESC2, lang.ini, %Language%, DIALOG_NOTFOUND_FFMPEG_DESC2
IniRead, DIALOG_NOTFOUND_FFMPEG_DESC3, lang.ini, %Language%, DIALOG_NOTFOUND_FFMPEG_DESC3

IniRead, GUI_MAIN_APPDESC, lang.ini, %Language%, GUI_MAIN_APPDESC
IniRead, GUI_MAIN_URLLIST_TITLE, lang.ini, %Language%, GUI_MAIN_URLLIST_TITLE

IniRead, GUI_MAIN_HOWTO_TITLE, lang.ini, %Language%, GUI_MAIN_HOWTO_TITLE
IniRead, GUI_MAIN_HOWTO_SUBTITLE, lang.ini, %Language%, GUI_MAIN_HOWTO_SUBTITLE

IniRead, GUI_MAIN_ADDURL, lang.ini, %Language%, GUI_MAIN_ADDURL
IniRead, GUI_MAIN_REMOVEURL, lang.ini, %Language%, GUI_MAIN_REMOVEURL
IniRead, GUI_MAIN_CLEARLIST, lang.ini, %Language%, GUI_MAIN_CLEARLIST

IniRead, GUI_MAIN_PRESET_TITLE, lang.ini, %Language%, GUI_MAIN_PRESET_TITLE
IniRead, GUI_MAIN_PRESETS, lang.ini, %Language%, GUI_MAIN_PRESETS

IniRead, GUI_MAIN_LOCATION_TITLE, lang.ini, %Language%, GUI_MAIN_LOCATION_TITLE
IniRead, GUI_MAIN_LOCATION_DEFAULT, lang.ini, %Language%, GUI_MAIN_LOCATION_DEFAULT
IniRead, GUI_MAIN_LOCATION_CUSTOM_BROWSE, lang.ini, %Language%, GUI_MAIN_LOCATION_CUSTOM_BROWSE

IniRead, GUI_MAIN_DOWNLOAD, lang.ini, %Language%, GUI_MAIN_DOWNLOAD
IniRead, GUI_MAIN_UPDATE, lang.ini, %Language%, GUI_MAIN_UPDATE
IniRead, GUI_MAIN_ABOUT, lang.ini, %Language%, GUI_MAIN_ABOUT
IniRead, GUI_MAIN_CLOSE, lang.ini, %Language%, GUI_MAIN_CLOSE

IniRead, GUI_BROWSE_SAVELOCATION_TITLE, lang.ini, %Language%, GUI_BROWSE_SAVELOCATION_TITLE

IniRead, DIALOG_ERROR_EMPTYLIST_TITLE, lang.ini, %Language%, DIALOG_ERROR_EMPTYLIST_TITLE
IniRead, DIALOG_ERROR_EMPTYLIST_DESC1, lang.ini, %Language%, DIALOG_ERROR_EMPTYLIST_DESC1
IniRead, DIALOG_ERROR_EMPTYLIST_DESC2, lang.ini, %Language%, DIALOG_ERROR_EMPTYLIST_DESC2

IniRead, DIALOG_ERROR_WRONG_URL_TITLE, lang.ini, %Language%, DIALOG_ERROR_WRONG_URL_TITLE
IniRead, DIALOG_ERROR_WRONG_URL_DESC1, lang.ini, %Language%, DIALOG_ERROR_WRONG_URL_DESC1
IniRead, DIALOG_ERROR_WRONG_URL_DESC2, lang.ini, %Language%, DIALOG_ERROR_WRONG_URL_DESC2

IniRead, DIALOG_INFO_DOWNLOADED_TITLE, lang.ini, %Language%, DIALOG_INFO_DOWNLOADED_TITLE
IniRead, DIALOG_INFO_DOWNLOADED_DESC1, lang.ini, %Language%, DIALOG_INFO_DOWNLOADED_DESC1
IniRead, DIALOG_INFO_DOWNLOADED_DESC2, lang.ini, %Language%, DIALOG_INFO_DOWNLOADED_DESC2

IniRead, DIALOG_ERROR_YTDLP, lang.ini, %Language%, DIALOG_ERROR_YTDLP

IniRead, DIALOG_WARN_CLEARLIST_TITLE, lang.ini, %Language%, DIALOG_WARN_CLEARLIST_TITLE
IniRead, DIALOG_WARN_CLEARLIST_DESC, lang.ini, %Language%, DIALOG_WARN_CLEARLIST_DESC

Gui, Options:+LabelYTDLDLProgress
Gui, YTDLDLProgress:-SysMenu +OwnDialogs
Gui, YTDLDLProgress:Font,, Segoe UI
Gui, YTDLDLProgress:Add, Text, vFirstTex x10 y10, %GUI_FIRSTTIME_CHECK%
Gui, YTDLDLProgress:Show, , EdibleDLP

IfNotExist, yt-dlp.exe
{
Msgbox, 0x40, %DIALOG_NOTFOUND_YTDLP_TITLE%, %DIALOG_NOTFOUND_YTDLP_DESC1%`n`n%DIALOG_NOTFOUND_YTDLP_DESC2%`n`n%DIALOG_NOTFOUND_YTDLP_DESC3%
GuiControl,, FirstTex, Downloading yt-dlp...
URLDownloadToFile, https://github.com/yt-dlp/yt-dlp/releases/download/2024.10.22/yt-dlp.exe, yt-dlp.exe
}

IfNotExist, ffmpeg.exe
{
Msgbox, 0x40, %DIALOG_NOTFOUND_FFMPEG_TITLE%, %DIALOG_NOTFOUND_FFMPEG_DESC1%`n`n%DIALOG_NOTFOUND_FFMPEG_DESC2%`n`n%DIALOG_NOTFOUND_FFMPEG_DESC3%
GuiControl,, FirstTex, Downloading ffmpeg...
URLDownloadToFile, https://github.com/pap-git/EdibleDLP/raw/refs/heads/main/ff-binaries/ffmpeg.exe, ffmpeg.exe
}

Gui, YTDLDLProgress:Destroy
Goto, MainGUI
Return

MainGUI:

Gui, Font, s16 Bold, Segoe UI
Gui, Add, Text, , EdibleDLP
Gui, Font, s12 Norm Italic, Segoe UI
Gui, Add, Text, xp+108 yp+6 cGray, until cooking version (by paphere)
Gui, Font, s9 Norm, Segoe UI
Gui, Add, Text, x20 yp+24, %GUI_MAIN_APPDESC%
Gui, Add, GroupBox, x10 W380 H290, %GUI_MAIN_URLLIST_TITLE%
Gui, Add, ListView, gGetRow AltSubmit xp+10 yp+20 W360 H140, Site|URL

Gui, Font, s12 Norm Italic, Segoe UI
Gui, Add, Text, cGray xp+12 yp+150, %GUI_MAIN_HOWTO_TITLE%

Gui, Font, s9 Norm Italic, Segoe UI
Gui, Add, Text, cGray yp+20, %GUI_MAIN_HOWTO_SUBTITLE%

Gui, Font, s9 Norm, Segoe UI
Gui, Add, Edit, vManualURL x20 yp+28 W271 H25

Gui, Add, Button, gAddURL xp+281 W80, %GUI_MAIN_ADDURL%
Gui, Add, Button, gRemoveURL x20 yp+30 W180, %GUI_MAIN_REMOVEURL%
Gui, Add, Button, gClearList xp+181 W180, %GUI_MAIN_CLEARLIST%

Gui, Add, GroupBox, x10 yp+50 W380 H88, %GUI_MAIN_PRESET_TITLE%
Gui, Add, Text, x20 yp+24, %GUI_MAIN_PRESETS%
Gui, Add, DropDownList, xp+90 yp-3 gCustomPresetEnabled vPresets W270, 1080p (MP4)||720p (MP4)|480p (MP4)|360p (MP4)|240p (MP4)|144p (MP4)|Best Quality (No Options)|Best Quality (MP4)|Best Quality (Only MP3)|Best Quality (Only WAV)|Custom
Gui, Add, Text, +Disabled vCustomLabel x20 yp+32, %GUI_MAIN_CUSTOM%
Gui, Add, Edit, +Disabled vPrefix xp+90 yp-3 W271 H25

Gui, Add, GroupBox, x10 yp+50 W380 H88, %GUI_MAIN_LOCATION_TITLE%
Gui, Add, Radio, gRadio1 vDefaultPath Checked1 x20 yp+24, %GUI_MAIN_LOCATION_DEFAULT%
Gui, Add, Radio, gRadio2 x20 yp+32, %GUI_MAIN_CUSTOM%
Gui, Add, Edit, +Disabled vCustomLocation xp+90 yp-3 W210 H25
Gui, Add, Button, +Disabled gBrowse vBrowseButton xp+211 yp-1 W60 H27, %GUI_MAIN_LOCATION_CUSTOM_BROWSE%

Gui, Add, Button, gDownloadVideo x20 yp+50 W180 H53, %GUI_MAIN_DOWNLOAD%`n(Shift+Enter)
Gui, Add, Button, gUpdateDLP xp+181 W89, %GUI_MAIN_UPDATE%
Gui, Add, Button, gAboutEDLP xp+91 W89, %GUI_MAIN_ABOUT%
Gui, Add, Button, gAppClose xp-91 yp+27 W180, %GUI_MAIN_CLOSE%

Gui, Show, W400 H644, EdibleDLP

Return

AddURL:

Gui, Submit, NoHide

If (ManualURL=="") {
SoundPlay, *-1
Return
}

If RegExMatch(ManualURL, "^(https?://|www\.)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(/\S*)?$") {
SoundPlay, *64
MediaSearchIfManual()
LV_Add(Vis, MediaIs, ManualURL)
global MediaIs := "??"
GuiControl,, ManualURL, 
Return
}
Msgbox 0x10, %DIALOG_ERROR_WRONG_URL_TITLE%, %DIALOG_ERROR_WRONG_URL_DESC1%`n%DIALOG_ERROR_WRONG_URL_DESC2%
Return

RemoveURL:

If (RowNum == "0") {
SoundPlay, *-1
Return
} else {
LV_Delete(RowNum)
}

Return

ClearList:

CountList := LV_GetCount()

If CountList > 0
{
MsgBox 0x34, %DIALOG_WARN_CLEARLIST_TITLE%, %DIALOG_WARN_CLEARLIST_DESC%

IfMsgBox Yes, {
LV_Delete()
Return
} Else IfMsgBox No, {
Return
}
}

SoundPlay, *-1

Return

DownloadVideo:

GuiControlGet, PresetName,, Presets

LV_GetText(DLURL, LVRow, 2)
If (DLURL == "") {
Msgbox 0x10, %DIALOG_ERROR_EMPTYLIST_TITLE%, %DIALOG_ERROR_EMPTYLIST_DESC1%`n`n%DIALOG_ERROR_EMPTYLIST_DESC2%
global LVRow := "1"
Return
}

Gui, Options:+LabelProgress
Gui, Progress:-SysMenu
Gui, Progress:Font, s16 Bold, Segoe UI
Gui, Progress:Add, Text,, %GUI_WIP%
Gui, Progress:Show,,EdibleDLP
Gui, +Disabled
Gui, Submit, NoHide

If (DefaultPath==1) {
Path := "Downloaded"
} else {
Path := CustomLocation
}

If (PresetName=="1080p (MP4)") {
RunWait, yt-dlp.exe -P "%Path%" -f "bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]/best[height<=1080][ext=mp4]" %DLURL%
}
If (PresetName=="720p (MP4)") {
RunWait, yt-dlp.exe -P "%Path%" -f "bestvideo[height<=720][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" %DLURL%
}
If (PresetName=="480p (MP4)") {
RunWait, yt-dlp.exe -P "%Path%" -f "bestvideo[height<=480][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" %DLURL%
}
If (PresetName=="360p (MP4)") {
RunWait, yt-dlp.exe -P "%Path%" -f "bestvideo[height<=360][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" %DLURL%
}
If (PresetName=="240p (MP4)") {
RunWait, yt-dlp.exe -P "%Path%" -f "bestvideo[height<=240][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" %DLURL%
}
If (PresetName=="114p (MP4)") {
RunWait, yt-dlp.exe -P "%Path%" -f "bestvideo[height<=114][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" %DLURL%
}
If (PresetName=="Best Quality (No Options)") {
RunWait, yt-dlp.exe -P "%Path%" %DLURL%
}
If (PresetName=="Best Quality (MP4)") {
RunWait, yt-dlp.exe -P "%Path%" -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]" %DLURL%
}
If (PresetName=="Best Quality (Only MP3)") {
RunWait, yt-dlp.exe -P "%Path%" -x --audio-format mp3 %DLURL%
}
If (PresetName=="Best Quality (Only WAV)") {
RunWait, yt-dlp.exe -P "%Path%" -x --audio-format wav %DLURL%
}
If (PresetName=="Custom") {
RunWait, yt-dlp.exe -P "%Path%" %Prefix% %DLURL%
}

If (ErrorLevel == 0) {
LVRow++

DLURL := ""

LV_GetText(DLURL, LVRow, 2)
If (DLURL == "") {
LVRow -= 1
Msgbox 0x40, %DIALOG_INFO_DOWNLOADED_TITLE%, %LVRow% %DIALOG_INFO_DOWNLOADED_DESC1%`n`n%DIALOG_INFO_DOWNLOADED_DESC2%
global LVRow := "1"
} else {
Goto, DownloadVideo
}
} else {
Msgbox 0x10, %GUI_ERROR%, %DIALOG_ERROR_YTDLP% %ErrorLevel%
}

Gui, Progress:Destroy
Gui, -Disabled
Return

#IfWinActive EdibleDLP
^+v::
If (Clipboard=="") {
SoundPlay, *-1
Return
}

If RegExMatch(Clipboard, "^(https?://|www\.)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(/\S*)?$") {
SoundPlay, *64
MediaSearch()
LV_Add(Vis, MediaIs, Clipboard)
global MediaIs := "??"
Return
}
Msgbox 0x10, %DIALOG_ERROR_WRONG_URL_TITLE%, %DIALOG_ERROR_WRONG_URL_DESC1%`n%DIALOG_ERROR_WRONG_URL_DESC2%

Return

#IfWinActive EdibleDLP
+Enter::
Goto, DownloadVideo
Return

MediaSearch(){

;YT

If RegExMatch(Clipboard, "^(https?://|www\.)youtu.be(/\S*)?$") OR RegExMatch(ManualURL, "^(https?://|www\.)youtube.com(/\S*)?$") OR RegExMatch(ManualURL, "^(https?://|www\.)[a-zA-Z0-9\-\.]+youtu.be(/\S*)?$") OR RegExMatch(ManualURL, "^(https?://|www\.)[a-zA-Z0-9\-\.]+youtube.com(/\S*)?$"){
global MediaIs := "YT"
}

;nicovideo
If RegExMatch(Clipboard, "^(https?://|www\.)nico.ms(/\S*)?$") OR RegExMatch(ManualURL, "^(https?://|www\.)nicovideo.jp(/\S*)?$") OR RegExMatch(ManualURL, "^(https?://|www\.)[a-zA-Z0-9\-\.]+nico.ms(/\S*)?$") OR RegExMatch(ManualURL, "^(https?://|www\.)[a-zA-Z0-9\-\.]+nicovideo.jp(/\S*)?$"){
global MediaIs := "nico"
}

}

MediaSearchIfManual(){

global

;YT

If RegExMatch(ManualURL, "^(https?://|www\.)youtu.be(/\S*)?$") OR RegExMatch(ManualURL, "^(https?://|www\.)youtube.com(/\S*)?$") OR RegExMatch(ManualURL, "^(https?://|www\.)[a-zA-Z0-9\-\.]+youtu.be(/\S*)?$") OR RegExMatch(ManualURL, "^(https?://|www\.)[a-zA-Z0-9\-\.]+youtube.com(/\S*)?$"){
MediaIs := "YT"
}

;nicovideo
If RegExMatch(ManualURL, "^(https?://|www\.)nico.ms(/\S*)?$") OR RegExMatch(ManualURL, "^(https?://|www\.)nicovideo.jp(/\S*)?$") OR RegExMatch(ManualURL, "^(https?://|www\.)[a-zA-Z0-9\-\.]+nico.ms(/\S*)?$") OR RegExMatch(ManualURL, "^(https?://|www\.)[a-zA-Z0-9\-\.]+nicovideo.jp(/\S*)?$"){
MediaIs := "nico"
}

Return
}

Radio1:
Gui, Submit, NoHide

If (DefaultPath==1){
GuiControl, Disable, CustomLocation
GuiControl, Disable, BrowseButton
} else {
GuiControl, Enable, CustomLocation
GuiControl, Enable, BrowseButton
}

Return

Radio2:
Gui, Submit, NoHide

If (DefaultPath==1){
GuiControl, Disable, CustomLocation
GuiControl, Disable, BrowseButton
} else {
GuiControl, Enable, CustomLocation
GuiControl, Enable, BrowseButton
}

Return

CustomPresetEnabled:
GuiControlGet, PresetName,, Presets
If (PresetName=="Custom") {
GuiControl, Enable, CustomLabel
GuiControl, Enable, Prefix
} else {
GuiControl, Disable, CustomLabel
GuiControl, Disable, Prefix
}
Return

Browse:
FileSelectFolder, SelectedFolder,, 2, %GUI_BROWSE_SAVELOCATION_TITLE%
If (SelectedFolder=="") {
Return
} else {
GuiControl,, CustomLocation, %SelectedFolder%
}
Return

GetRow:
RowNum := LV_GetNext()
Return

UpdateDLP:
Gui, Options:+LabelProgress
Gui, Progress:-SysMenu
Gui, Progress:Font, Segoe UI
Gui, Progress:Add, Text,, %GUI_UPDATE_DLP%
Gui, Progress:Show,,EdibleDLP
Gui, +Disabled
RunWait, yt-dlp.exe --update
Gui, Progress:Destroy
Gui, -Disabled
Return

AboutEDLP:
Gui, +Disabled
Instruction := "EdibleDLP - until cooking version"
Content := "Version 0.0-241214 beta release`nby pap-git/paphere`nLicensed under the GNU General Public License v3.0"
Title := "About EdibleDLP"
MainIcon := 0xFFFD
Flags := 0x10
Buttons := 0x20
CustomButtons := []
CustomButtons.Push([101, "See GitHub"])
CustomButtons.Push([102, "Redownload all dependencies`nUse this option if you did broke something"])
cButtons := CustomButtons.Length()
VarSetCapacity(pButtons, 4 * cButtons + A_PtrSize * cButtons, 0)
Loop %cButtons% {
    iButtonID := CustomButtons[A_Index][1]
    iButtonText := &(b%A_Index% := CustomButtons[A_Index][2])
    NumPut(iButtonID,   pButtons, (4 + A_PtrSize) * (A_Index - 1), "Int")
    NumPut(iButtonText, pButtons, (4 + A_PtrSize) * A_Index - A_PtrSize, "Ptr")
}

; TASKDIALOGCONFIG structure
x64 := A_PtrSize == 8
NumPut(VarSetCapacity(TDC, x64 ? 160 : 96, 0), TDC, 0, "UInt") ; cbSize
NumPut(Flags, TDC, x64 ? 20 : 12, "Int") ; dwFlags
NumPut(Buttons, TDC, x64 ? 24 : 16, "Int") ; dwCommonButtons
NumPut(&Title, TDC, x64 ? 28 : 20, "Ptr") ; pszWindowTitle
NumPut(MainIcon, TDC, x64 ? 36 : 24, "Ptr") ; pszMainIcon
NumPut(&Instruction, TDC, x64 ? 44 : 28, "Ptr") ; pszMainInstruction
NumPut(&Content, TDC, x64 ? 52 : 32, "Ptr") ; pszContent
NumPut(cButtons, TDC, x64 ? 60 : 36, "UInt") ; cButtons
NumPut(&pButtons, TDC, x64 ? 64 : 40, "Ptr") ; pButtons

DllCall("Comctl32.dll\TaskDialogIndirect", "Ptr", &TDC
    , "Int*", Button := 0
    , "Int*", Radio := 0
    , "Int*", Checked := 0)

If (Button == 101) {
    ; See GitHub
    Run, https://github.com/pap-git/EdibleDLP
} Else If (Button == 102) {
    ; Redownload all dependencies
    Gui, Destroy

    Gui, Options:+LabelYTDLDLProgress
    Gui, YTDLDLProgress:-SysMenu +OwnDialogs
    Gui, YTDLDLProgress:Font,, Segoe UI
    Gui, YTDLDLProgress:Add, Text, vFirstTex x10 y10, %GUI_REDOWNLOAD%
    Gui, YTDLDLProgress:Show, , EdibleDLP
    URLDownloadToFile, https://github.com/yt-dlp/yt-dlp/releases/download/2024.10.22/yt-dlp.exe, yt-dlp.exe
    URLDownloadToFile, https://github.com/pap-git/EdibleDLP/raw/refs/heads/main/ff-binaries/ffmpeg.exe, ffmpeg.exe
    Gui, YTDLDLProgress:Destroy

    Goto, MainGUI
    Return
} Else If (Button == 8) {
    ; Close

}
Gui, -Disabled
Return

AppClose:
GuiDestroy:
GuiClose:
ExitApp

/*
EdibleDLP 0.0-241214 script by paphere/pap-git

THIS COMMENT-OUT MUST NOT BE EDITED/DELETED/REMOVED!

Before editing my code, you accept to this rules:
 - You must not remove this comment-out
 - You must write my @username and your username to "About" dialog
 - You need to credit to me
-----------------------------------------------------------------------------------------------
This project is licensed under the GNU General Public License v3.0.

| Permissions of this strong copyleft license are conditioned on making available complete
| source code of licensed works and modifications, which include larger works using a licensed
| work, under the same license. Copyright and license notices must be preserved. Contributors
| provide an express grant of patent rights. 

To see full license, Here is the link: https://github.com/pap-git/EdibleDLP/blob/main/LICENSE
-----------------------------------------------------------------------------------------------
*/