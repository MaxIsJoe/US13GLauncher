class_name InstallsManager
extends Node

var InstallsPath : String

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.Installs = self
	InstallsPath = str(OS.get_executable_path() + "/client/")

func VersionExists(version : String):
	var dir = Directory.new()
	return dir.open(InstallsPath) == OK

func OpenVersion(version : String):
	var dir = Directory.new()
	if (dir.open(InstallsPath) != OK): return
	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		if dir.current_is_dir():
			print("Found directory: " + file_name)
		else:
			print("Found file: " + file_name)
			if(file_name.find("unitystation")):
				OS.shell_open(file_name)
				return
		file_name = dir.get_next()
	print("Attempted to open game but couldn't find any executables called 'unitystation'")

func CreateVersionFolder(version : String):
	var dir = Directory.new()
	dir.make_dir(str(InstallsPath + version))

func StoreDownloadedFiles(body, version):
	var file = File.new()
	file.open(str(InstallsPath + version), File.WRITE)
	file.store_buffer(body)
	file.close()

