extends Control

export(NodePath) var PATH_EmailTextField
export(NodePath) var PATH_PasswordTextField
export(NodePath) var PATH_ErrorText

var EmailTextField    : LineEdit
var PasswordTextField : LineEdit
var ErrorText         : Label

var em : String #Email
var pw : String #Password

func _ready():
	EmailTextField    = get_node(PATH_EmailTextField)
	PasswordTextField = get_node(PATH_PasswordTextField)
	ErrorText         = get_node(PATH_ErrorText)
	ErrorText.text = ""
