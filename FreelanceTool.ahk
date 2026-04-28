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

; Metadata Aplikasi
AppTitle := "Rifins Automation Tool"
AppWebsite := "www.rifins.com"

; Inisialisasi GUI
MyGui := Gui("+AlwaysOnTop +MinimizeBox +E0x08000000", AppTitle)

; =====================================================================
; FITUR PRO: Membuat GUI bisa diseret dari area background mana saja
; =====================================================================
OnMessage(0x0201, WM_LBUTTONDOWN)
WM_LBUTTONDOWN(wParam, lParam, msg, hwnd) {
    ; Mengirim pesan ke sistem bahwa kursor sedang menahan bagian "Caption"
    PostMessage(0xA1, 2, , , "ahk_id " hwnd)
}

; Menambahkan tombol-tombol fungsional
MyGui.Add("Button", "w90 h50", "Cut (X)").OnEvent("Click", (*) => SendInput("^x"))
MyGui.Add("Button", "w90 h50", "Enter").OnEvent("Click", (*) => SendInput("{Enter}"))
MyGui.Add("Button", "w90 h50", "Paste (V)").OnEvent("Click", (*) => SendInput("^v"))

; Tombol Minimize manual
MyGui.Add("Button", "w90 h50", "Minimize").OnEvent("Click", (*) => MyGui.Minimize())

; Label Kredit & Link
MyGui.SetFont("s8 cBlue", "Inter")
MyGui.Add("Text", "Center w90", AppWebsite).OnEvent("Click", (*) => Run("https://" . AppWebsite))

; Menangani penutupan aplikasi
MyGui.OnEvent("Close", (*) => ExitApp())

; Tampilkan GUI tanpa merebut fokus awal (NoActivate)
MyGui.Show("NoActivate")
