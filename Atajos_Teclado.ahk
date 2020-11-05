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

;~ CAMBIO DE PRECIOS
{
#^Numpad1::
	MouseClick, left, 1169, 249
	Send, ^a
	send, 1900
	MouseClick, left, 1073, 400
	MouseMove, 878, 841
return

#^Numpad2::
	MouseClick, left, 1169, 249
	Send, ^a
	send, 2100
	MouseClick, left, 1073, 400
	MouseMove, 878, 841
return

#^Numpad3::
	MouseClick, left, 1169, 249
	Send, ^a
	send, 1800
	MouseClick, left, 1073, 400
	MouseMove, 878, 841
return	

;~ Descuento de un  5 porciento
#^Numpad9::
	MouseClick, left, 776, 301
	Send, ^a
	send, 5
	Sleep, 20
	MouseClick, left, 784, 371
	send, d
	MouseClick, left, 1069, 866
	MouseMove, 878, 841
return	
}


#IfWinActive, Factura Profesional - Google Chrome ahk_class Chrome_WidgetWin_1
{

	;~ CAMISETAS
	{
	:?*:cgr::CR1225{Enter}
	:?*:cmr::CR1020{Enter}
	:?*:cpr::CR816{Enter}

	:?*:cgf::CF1225{Enter}
	:?*:cmf::CF1020{Enter}
	:?*:cpf::CF816{Enter}
	:?*:cmmf::CF714{Enter}

	:?*:cjb::CB1520{Enter}
	:?*:cgb::COX1225{Enter}
	:?*:cmb::COX1020{Enter}
	:?*:cpb::COX816{Enter}
	:?*:cmmb::COX714{Enter}
	:?*:c612::CB612{Enter}
	}
;~ -----------------------------------------------

	;~ EMPAQUES
	;~ 1 Foam
	;~ 2 Biodegradable
	;~ 3 Coco
	{
	:?*:1881::EMP8S{Enter}
	:?*:1882::EMP8C{Enter}
	:?*:2881::BIO8S{Enter}
	:?*:2882::BIO8C{Enter}
	:?*:3881::88SDCC{Enter}
	:?*:3882::88CDCC{Enter}
	
	:?*:1991::EMP9S{Enter}
	:?*:1992::EMP9C{Enter}
	:?*:2991::BIO9S{Enter}
	:?*:2992::BIO9C{Enter}
	
	:?*:166::6X6EMP{Enter}
	:?*:366::6X6BIO{Enter}
	:?*:266::EMHAMCO{Enter}
	}
	
;~ -----------------------------------------------

	;~ LIMPIEZA
	{
	:?*:0001::CL6820{Enter}
	:?*:0002::DES4573{Enter}
	:?*:0003::JALIQLI{Enter} ;Jabon liquido en litro
	:?*:0004::JALIMAN{Enter}	;Jabon liquido en galon
	:?*:0005::LAVA4851{Enter}
	:?*:0006::JAPOL{Enter}
	:?*:0007::HIGBONNY{Enter}
	:?*:0008::JUROBON{Enter}
	
	:?*:0030::ALLIQ{Enter} ;Alcohol liquido en galon
	:?*:0031::ALLI{Enter} ;Alcohol liquido en litro
	:?*:0032::ALGELGA{Enter} ;Alcohol gel en galon
	:?*:0033::ALGELLI{Enter} ;Alcohol gel en litro
	
	}
	
	;~ -----------------------------------------------
	
	;~ OTROS
	{
		;~ BURBUJAS
	:?*:BB6::BUR6PA{Enter}
	:?*:BB5::BUR5PA{Enter}
	:?*:BB4::BUR4PA{Enter}
	
		;~ VASOS FOAM
	:?*:VF12::VAF12{Enter}
	:?*:VF10::VAF10{Enter}
	:?*:VF8::VAF8{Enter}
	:?*:TF25::TAFO10-12{Enter}
	
		;~ VASOS CARTON
	:?*:VC12::VACAR12CT{Enter}
	:?*:VC8::VACAR8{Enter}
	:?*:VC6::VACAR6{Enter}
	:?*:TC25::TACAR{Enter}
	
		;~ VASOS BATIDOS
	:?*:VB12::VABA12{Enter}
	:?*:VB16::VABA16{Enter}
	:?*:VB24::VABA24{Enter}
	:?*:TBSE::TABAT{Enter}
		
		;~ PAJILLAS
	:?*:PPFF::PAFOPEQ{Enter}
	:?*:PPBB::PABIO{Enter}
	:?*:PBBB::PABAT{ENTER}
	
		;~ TAZAS
	:?*:TV8::TA8A{Enter}
	:?*:TA5::TA55{Enter}
	:?*:TA3::TA325{Enter}
	:?*:TA2::TA2CT{Enter}
	:?*:2560::VA01{Enter}
	
		;~ HERAMIENTAS
	:?*:CCCC::CUCHARAS SYS{Enter}
	:?*:TTTT::TENEDORES SYS{Enter}
	:?*:CCBB::CUBIERTOS{Enter}
	:?*:SSSS::SERV423{Enter}
	:?*:BSSS::SERBUL{Enter}
	
		;~ EMPAQUES COMIDA PLASTICOS
	:?*:0010::ENTDUR{Enter}
	:?*:0011::MEDD457{Enter}
	:?*:0020::ENTERSU{Enter}
	:?*:0021::MEDSUA{Enter}
	
		;~ TOALLAS DE COCINA
	:?*:0041::TOCOS{Enter}
	:?*:0042::TONEX1{Enter}
	:?*:0043::NEVAXDOBLE{Enter}
	:?*:0044::TOIND{Enter}
	}
	
	;~ -----------------------------------------------
	
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
	Send {Home}
	Sleep, 20
	;~ CLICK EN CLIENTE
	MouseClick, left, 530, 401
return
	
}

#IfWinActive, Principal - TickTick - Google Chrome ahk_class Chrome_WidgetWin_1
{
	::bpa::Bolsa de papel {#}
	::1881::8x8 sd foam
	::1882::8x8 cd foam
	::2881::8x8 sd biodegradable
	::2881::8x8 cd biodegradable
	::3881::8x8 sd coco
	::3881::8x8 cd coco
	::1991::9x9 sd foam
	::1992::9x9 cd foam
	::2991::9x9 sd biodegradable
	::2992::9x9 cd biodegradable
	::tp::Tapas 
	::cj::Caja
	::vf12::Vaso Foam {#} 12
	::vf10::Vaso Foam {#} 10
	::vf8::Vaso Foam {#} 8
	::evs::Envase 
	::my::Maya 
	::cj::Caja 
	::tz::Tazas 
	::vv::Vasos Vacan {#}
	::jr::Jumbo Roll
	::bj::Burbujas {#}
	::lt::Litro 
	::gl::Galon 
	::dsf::Desinfectante
	::alm::Aluminio
	::bjf::Burbuja de Fresa
	::bio::Biodegradable
	::sv::Servilletas belen
	::bl::Blanca
	::gr::Gruesa
	::bob::Bobina
	::ti::Toalla Industrial sys
	::cmf::10x20 fina
	::ets::Enteros suaves
	::cmr::Camiseta Mediana Rayada
	::atom::Atomizador
	
}

#IfWinActive, FACTURACION - ahk_class WindowsForms10.Window.8.app.0.141b42a_r6_ad1
{
	F5::
		Send, {F9}
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


