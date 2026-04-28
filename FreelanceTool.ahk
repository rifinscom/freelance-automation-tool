/*
================================================================================
Project: Freelance Workflow Automation Tool
Version: 1.1.0
Author: Rifins Dev
Website: https://www.rifins.com
Description: A productivity GUI to speed up data entry. 
             Now features "Drag-Anywhere" functionality.
================================================================================
*/

#Requires AutoHotkey v2.0
#SingleInstance Force

; Application Metadata
AppTitle := "Rifins Automation Tool"
AppWebsite := "www.rifins.com"

; Initialize GUI
MyGui := Gui("+AlwaysOnTop +MinimizeBox +E0x08000000", AppTitle)

; =====================================================================
; PRO FEATURE: Make GUI draggable from any background area
; =====================================================================
OnMessage(0x0201, WM_LBUTTONDOWN)
WM_LBUTTONDOWN(wParam, lParam, msg, hwnd) {
    ; Send message to the system mimicking a title bar drag
    PostMessage(0xA1, 2, , , "ahk_id " hwnd)
}

; Add functional buttons
MyGui.Add("Button", "w90 h50", "Cut (X)").OnEvent("Click", (*) => SendInput("^x"))
MyGui.Add("Button", "w90 h50", "Enter").OnEvent("Click", (*) => SendInput("{Enter}"))
MyGui.Add("Button", "w90 h50", "Paste (V)").OnEvent("Click", (*) => SendInput("^v"))

; Manual Minimize button
MyGui.Add("Button", "w90 h50", "Minimize").OnEvent("Click", (*) => MyGui.Minimize())

; Credit Label & Link
MyGui.SetFont("s8 cBlue", "Inter")
MyGui.Add("Text", "Center w90", AppWebsite).OnEvent("Click", (*) => Run("https://" . AppWebsite))

; Handle application close
MyGui.OnEvent("Close", (*) => ExitApp())

; Show GUI without stealing initial focus (NoActivate)
MyGui.Show("NoActivate")
