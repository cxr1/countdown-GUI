InputBox, time,输入框,请输入时间---单位(秒)
CustomColor := "EEAA99"  ; 可以为任意 RGB 颜色(在下面会被设置为透明).
Gui +LastFound +AlwaysOnTop -Caption +ToolWindow  ; +ToolWindow 避免显示任务栏按钮和 alt-tab 菜单项.
Gui, Color, %CustomColor%
Gui, Font, s23  ; 设置大字体 (32 磅).
Gui, Add, Text, vMyText cBlack, XXXXX YYYYY  ; XX & YY 用来自动调整窗口大小.
; 让此颜色的所有像素透明且让文本显示为半透明 (150):
WinSet, TransColor, %CustomColor% 150
SetTimer, UpdateOSD, 1000
Gosub, UpdateOSD  ; 立即进行第一次更新而不等待计时器.
Gui, Show, x1035 y-8 NoActivate  ; NoActivate 让当前活动窗口继续保持活动状态.
return

UpdateOSD:
GuiControl,, MyText, % Format("{:02d}:{:02d}", time/60 , Mod(time,60))
time--
if Format("{:02d}", time/60)=0{
    if Format("{:02d}",Mod(time,60))=0{
    MsgBox,时间到了
	  ExitApp
  }
}

return
