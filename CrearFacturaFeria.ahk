;~ Creado por Esteban Mora
;~ Fecha 08-01-2018
;~ Compuradora Mini de uso en la feria
;~ Navegador Chrome, escala 100%
;~ Pantalla 1280*800, escala 100%

;~ version 1.2 lista de cambios
;~ Pantalla_Factura_Electronica(ByRef estado) Utiliza un loop para el intento de creacion de factura
;~ Se incluye un tooltip para la visualizacion de cuantos intentos se realizan para la impresion de la factura

#SingleInstance, Force
#Persistent

CoordMode, Mouse, Screen
CoordMode, tooltip, screen
CoordMode, Pixel, Screen


global MontoFactura = ""
global TextoFactura = ""
global FacturaEnviadaCorrectamente = true
;~ variable que comprueba la pagina antes de realizar la factura
global Continuar := true
global CuentaImpresion := 1
global CorrigePosicionY := 27
global XposTip := 934
global YposTip := 37
global ClienteArray := []

Crear_Factura()
F11::ExitApp

Crear_Factura()
{
	ClienteDobleFactura()
	BlockInput, Mousemove
	ToolTip, Iniciando Proceso F11 PARA SALIR, XposTip, YposTip
	Cerrar_Ventana_Impresion()
	Boton_Condicion_Venta()
	Boton_Procesar_Factura_Electronica()
	Ventana_Emergente_Creacion_Factura()
	BlockInput, Mousemoveoff
}


Cerrar_Ventana_Impresion()
{
	ToolTip, Cerrando ventanas F11 PARA SALIR, XposTip, YposTip
	Process, close, JDownloader2.exe
	ifWinExist, ahk_class WindowsForms10.Window.8.app.0.141b42a_r9_ad1 ahk_exe Imprime Tiquetes.exe
	{
		WinClose, ahk_class WindowsForms10.Window.8.app.0.141b42a_r9_ad1 ahk_exe Imprime Tiquetes.exe
	}
}

Boton_Condicion_Venta()
{
	ToolTip, Realizando Pago F11 PARA SALIR, XposTip, YposTip
	;~ Mueve la pagina a la parte inicial
	MouseClick, left, 1892, 642
	Sleep, 100
	Send {Home}
	Sleep, 200
	;~ Cierra el mensaje de la pagina
	
	;~ Condicion de Venta
	MouseClick, left, 1592, 565
	Sleep, 200
	;~ Contado
	MouseClick, left, 1542, 634
	Sleep, 200
	
	;~ Agregar (Boton en la parte superior de la derecha, color verde, justo debajo del total a pagar)
	MouseClick, left, 1734, 971
	Sleep, 1000
	;~ Seleccione una opcion
	MouseClick, left, 1170, 438
	Sleep, 200

	;~ Añadir monto pendiente
	MouseClick, left, 1215, 515
	;~ Agregar
	MouseClick, left, 1199, 732
	Sleep, 200
	;~ Ok
	MouseClick, left, 946, 688
}

Boton_Procesar_Factura_Electronica()
{
	ToolTip, Procesando Factura F11 PARA SALIR, XposTip, YposTip
	Send {End}
	;~ Procesar Factura Electronica
	Sleep, 50
	MouseClick, left, 1119, 920
	Sleep, 50
	MouseClick, left, 1119, 920
	Sleep, 50
	Pantalla_Cargada := "Desea procesar"
	Tiempo_Espera_Datos(Pantalla_Cargada)
	;~ Click en la parte superior de la ventana emergente
	MouseClick, left, 1003, 673
	Sleep, 100
}

Ventana_Emergente_Creacion_Factura()
{
	Pantalla_Cargada := "se ha creado exitosamente!"
	Tiempo_Espera_Datos_Enviados(Pantalla_Cargada)
	Imprimir_Factura()
}

Pantalla_Factura_Electronica(ByRef estado)
{
	MouseMove, 443, 342
	Tooltip, %i% Esperando la pantalla de factura. Intento de impresion F11 PARA SALIR, XposTip, YposTip
	NombreComercio = Gerardo,Mora,Solano
	Leyenda := "Generado por www.FacturaProfesional.com"
	i:=0
	Sleep, 10
	while(i<1000)
	{
		i++
		Tooltip, %i% Intento de impresion
		Send, ^a
		Sleep, 50
		Send, ^c
		Sleep, 50
		If Clipboard Contains %NombreComercio%
		{
			if Clipboard Contains %Leyenda% 
			{
				Clipboard := StrReplace(Clipboard, "%", " ")
				Imprimir_Factura()
				break
				i := 1020
			}
	    } 
	}
	
}

Imprimir_Factura()
{
	ToolTip, Imprimiendo Factura F11 PARA SALIR, XposTip, YposTip
	if(CuentaImpresion = 1)
	{
		CuentaImpresion := 2
		Run, C:\Facturacion\Imprime Tiquetes.exe
		;~ Cambiar segun la version de Imprime Tiquetes..... IMPORTANTE!!!!!!!!!!!!!!!!!!!!!!!!!!
		WinWaitActive, ahk_exe Imprime Tiquetes.exe
		;~ Impresion doble
		Loop, % ClienteArray.MaxIndex()
		{
			Sleep, 20
			if Clipboard Contains  % ClienteArray[A_Index]
			{
				ClipTemp := ClipboardAll
				;~ Click en Tiquete Impresion Digital
				MouseClick, left, 988, 430
				ToolTip, Imprimiendo Factura 2 F11 PARA SALIR, XposTip + SegundaPantallaX, YposTip + SegundaPantalla
				Sleep, 1200
				Clipboard = %ClipTemp%
			}
		}
		MouseMove, 988,430
		;~ Click en Tiquete Impresion Digital
		MouseClick, left, 988, 430
		Sleep, 750
		;~ Click en la pestaña de chrome para cerrarla
		MouseClick, left, 353, 21
		Sleep, 100
		MouseClick, left, 353, 21
		Send, ^w
		Sleep, 50
		;~ Selecciona la pestaña de factura
		MouseClick, left, 85, 15
		;~ MouseMove, 455, 399
		;~ Ultima Posicion del mouse al finalizar la factura,
		;~ Queda en la segunda ventana en la pesta;a de tictick
		MouseMove, 3348, 354
		ExitApp
	}
	else
	{
		CuentaImpresion := 1
	}
}

Tiempo_Espera_Datos(ByRef Datos)
{
	i := 0
	Esperar := true
	While Esperar = true
	{
		i++
		Sleep, 25
		SeleccionarCopiar()
		ToolTip,  Espere... Intentos realizados = %i% F11 PARA SALIR, XposTip, YposTip
		
		If clipboard contains %Datos%
		{
			Esperar := false
			clipboard =	
		}
	
		if (i > 3000)
		{
			Esperar := false
			MsgBox, Error
			ExitApp
		}
		
		
	}
}

Tiempo_Espera_Datos_Enviados(ByRef Datos)
{
	i := 0
	DatosErroneo := "Ocurrió"
	Esperar := true
	While Esperar = true
	{
		i++
		Sleep, 25
		SeleccionarCopiar()
		ToolTip,  Intentos realizados = %i% F11 PARA SALIR, XposTip, YposTip
		If clipboard contains %Datos%
		{
			Esperar := false
			Sleep, 50
			MouseClick, left, 883, 693
			Clipboard =
			Sleep, 50
			break
		}else if clipboard contains %DatosErroneo%
		{
			ExitApp
		}
	}
	if(Esperar = false)
	{
		Pantalla_Factura_Electronica(FacturaEnviadaCorrectamente)	
	}
}


SeleccionarCopiar()
{
	Clipboard =
	Send, ^a
	Sleep, 50
	Send, ^c
	Sleep, 50
}

ClienteDobleFactura()
{
	ClienteArray.Push("112320255") ; Pablo Hidalgo Ferreto
	ClienteArray.Push("3101072350") ; Union Salvadore;a
	ClienteArray.Push("3002142152") ; Soda Betania
	ClienteArray.Push("3101091972") ; Feymaco
	ClienteArray.Push("3004045099") ; Coopeagry
	;~ ClienteArray.Push("Tiquete ") ; Solo para pruebas
}

ExitApp