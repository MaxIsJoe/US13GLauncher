extends Node

onready var httpServers = $ServerRequests

var d : Dictionary = {
	ServerName = "ServerName",
	PlayerCount = 0,
	ServerIP = "127.0.0.1",
	ServerPort = 7777,
	WinDownload = "WinDownload",
	OSXDownload = "OSXDownload",
	LinuxDownload = "LinuxDownload"
	}

func _ready():
	httpServers.request(Global.officalAPI)


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	if(response_code != 200): return
	var json = JSON.parse(body.get_string_from_utf8())
	var dic : Dictionary = json.result
	for i in json.result:
		for server in dic["servers"]:
			print("-------- \n")
			print(server["ServerName"])
			d.ServerName = str(server["ServerName"] + " --- " + str(server["PlayerCount"]) + " Players")
			d.PlayerCount = server["PlayerCount"]
			d.ServerIP = server["ServerIP"]
			d.ServerPort = server["ServerPort"]
			d.WinDownload = server["WinDownload"]
			d.OSXDownload = server["OSXDownload"]
			d.LinuxDownload = server["LinuxDownload"]
			Global.MainScene.AddServer(d)
