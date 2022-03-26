class_name ServerEntryUI
extends Panel

onready var ServerIcon = $HBoxContainer/ServerIcon
onready var ServerName = $HBoxContainer/VBoxContainer/ServerName
onready var DownloadButton = $HBoxContainer/Button

var WinDownload
var OSXDownload
var LinuxDownload


func SetupEntry(var name, var WinDown, var OSXDown, var LinDown, var ip, var port, var icon = null):
	ServerName.bbcode_text = name
	WinDownload = WinDown
	OSXDownload = OSXDown
	LinuxDownload = LinDown
	#hint_tooltip = Desc
	if(icon == null): return
	ServerIcon.texture = load(icon)


func _on_Button_button_down():
	match OS.get_name():
		"Windows":
			print("Windows")
			OS.shell_open(WinDownload)
		"macOS":
			print("macOS")
			OS.shell_open(OSXDownload)
		"Linux", "FreeBSD", "NetBSD", "OpenBSD", "BSD":
			print("Linux/BSD")
			OS.shell_open(LinuxDownload)
