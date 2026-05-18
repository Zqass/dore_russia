#UseHook
#Persistent
SetBatchLines, -1

global lastChar := ""

~$е::
~$ф::  
~$и::
~$Space::
    if (isRussianLayout()) {
        if (A_ThisHotkey = "~$Space") {
            if (isConsonant(lastChar)) {
                Send, {Backspace}  
                Send, ъ{Space}     
            }
            lastChar := ""  
            return
        }
        
        Send, {Backspace}  
        
        if (A_ThisHotkey = "~$е") {
            Send, ѣ
            lastChar := "е"  
        }
        else if (A_ThisHotkey = "~$ф") {
            Send, Ѳ
            lastChar := "ф"  
        }
        else if (A_ThisHotkey = "~$и") {
            Send, {Text}i  
            lastChar := "и"  
        }
    }
    return

isConsonant(char) {

    consonants := "бвгджзйклмнпрстфхцчшщ"
    
    if (char != "" && InStr(consonants, char)) {
        return true
    }
    return false
}

isRussianLayout() {
    ControlGetFocus, ctrl, A
    WinGet, pid, PID, A
    WinGet, hwnd, ID, A
    threadID := DllCall("GetWindowThreadProcessId", "UInt", hwnd, "UInt", 0)
    hkl := DllCall("GetKeyboardLayout", "UInt", threadID)
    layoutID := hkl & 0xFFFF
    return layoutID = 0x419  
}

~$a::
~$б::
~$в::
~$г::
~$д::
~$ё::
~$ж::
~$з::
~$й::
~$к::
~$л::
~$м::
~$н::
~$о::
~$п::
~$р::
~$с::
~$т::
~$у::
~$х::
~$ц::
~$ч::
~$ш::
~$щ::
~$ъ::
~$ы::
~$ь::
~$э::
~$ю::
~$я::
~$Backspace::
~$Enter::
    if (isRussianLayout()) {
        if (A_ThisHotkey != "~$Backspace" && A_ThisHotkey != "~$Enter") {
            lastChar := SubStr(A_ThisHotkey, 3)
        } else {
            lastChar := ""  
        }
    }
    return