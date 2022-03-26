class_name MainScene
extends Control

onready var tabs : TabContainer = $TabContainer
onready var servers : ServerListUI = $TabContainer/Servers/Servers


func _ready():
	Global.MainScene = self
	if(tabs.current_tab == 0):
		pass

func AddServer(var serverData ):
	var downloadList = []
	downloadList.append(serverData.WinDownload)
	servers.AddServer(serverData.ServerName, serverData.WinDownload, serverData.OSXDownload, serverData.LinuxDownload, serverData.ServerIP, serverData.ServerPort)
