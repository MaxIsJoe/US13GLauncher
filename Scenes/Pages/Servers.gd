class_name ServerListUI
extends Control

onready var listContainer = $ScrollContainer/VBoxContainer

export var serverEntryPrefab : PackedScene


func AddServer(var name, var WinDown, var OSXDown, var LinDown, var ip, var port, var icon = null):
	var newEntry : ServerEntryUI = serverEntryPrefab.instance()
	listContainer.add_child(newEntry)
	newEntry.SetupEntry(name, WinDown, OSXDown, LinDown, ip, port, icon)
