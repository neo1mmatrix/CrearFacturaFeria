;~ # Windows
;~ ^ Control
;~ ! Alt
;~ + Shift
#SingleInstance, Force
#Persistent

	CoordMode, Mouse, Screen
	CoordMode, tooltip, screen
	CoordMode, Pixel, Screen
	
global MensajeTool = Atajos F9 Cliente F12 Productos ctl+L Pausa F5 Imprimir
	
ToolTip, Atajos F9 Cliente F12 Productos ctl+L Pausa F5 Imprimir, 814, 75

#^a::
	MouseGetPos, x,y
	MsgBox, 64, Coordenadas, %x%`, %y%
	Clipboard = %x%, %y% ;~ `n MouseMove,  %x%, %y%
return



#IfWinActive, Factura Profesional - Google Chrome ahk_class Chrome_WidgetWin_1
{
	:?*: ::%
	F12::
		;~ CLICK EN LATERAL DERECHO DE CHROME PARA DESPLAZAR HACIA ARRIBA
		MouseClick, left, 1894, 554
		Send {Home}
		Sleep, 20
		;~ CLICK EN ARTICULOS
		MouseClick, left, 705, 721
	return
	F5::
		Run, C:\Users\Feria\Documents\Crear_Factura.exe
	return
	
	F9::
	;~ CLICK EN PESTAÑA FACTURACION
	MouseClick, left, 100, 15
	Sleep, 20
	;~ CLICK EN CLIENTE
	MouseClick, left, 530, 401
return
	
}

^l::
	Suspend Permit
	Suspend
	if (A_IsSuspended)
		ToolTip, Atajos EN PAUSA CTRL+L ACTIVAR, 814, 75
	else
		ToolTip, Atajos F9 Cliente F12 Productos ctl+L Pausa F5 Imprimir, 814, 75
return

ExitApp


