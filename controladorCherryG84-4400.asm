#Controlador Cherry G84-4400
	.eqv fil1 0x1 
	.eqv fil2 0x2
	.eqv fil3 0x3
	.eqv fil4 0x4
	.eqv fil5 0x5
	.eqv fil6 0x6

	.eqv col1 0x1
	.eqv col2 0x2
	.eqv col3 0x3
	.eqv col4 0x4
	.eqv col5 0x5
	.eqv col6 0x6
	.eqv col7 0x7
	.eqv col8 0x8
	.eqv col9 0x9
	.eqv col10 0x10
	.eqv col11 0xA
	.eqv col12 0xB
	.eqv col13 0xC
	
	.data
#  Matriz del teclado
# "Esc,F1,F2,F3,F4,F5,F6,F7,F8,F9,F10,F11,F12,PrtSc,Pause"
# "^,1,2,3,4,5,6,7,8,9,0,?,',Del,Home"
# "Tab,q,w,e,r,t,z,u,i,o,p,u,+,Enter,Pg Up"
# "Caps,a,s,d,f,g,h,j,k,l,ö,ä,',Pg On,"
# "ShifL,<,y,x,c,v,b,n,m,;,.,-,ShiftR,Up,End"
# "Fn,Ctrl,Alt,Space,Alt Gr,Insert,Delete,Left,Down,Right, , , , , "
msgB1: .asciz "Boton1"
msgB2: .asciz "Boton2"
msgAmbos: .asciz "Boton 1 y 2"

	.text
main:

#cargamos las posiciones de memoria del puerto
	lui t0, 0x10000		#puerto 0x10000
	lw t1, 0(t0)
	lui t2, 0x10001		#puerto 0x10001
	lw t3, 0(t2)
	lui t4, 0x10002		#puerto 0x10002
	lw t5, 0(t4)	
	lui a0, 0x10003		#puerto 0x10003
	lw t6, 0(a0)
			
#-----teclado
#copio los primeros 6 bits de la posicion 0x10001 para obtener la fila
	andi a2,t1,0x0000003f
#compruebo en que fila está la tecla activada
	li s0,fil1
	beq a2,s0,fila1
	li s0,fil2
	beq a2,s0,fila2
	li s0,fil3
	beq a2,s0,fila3
	li s0, fil4
	beq a2,s0,fila4
	li s0,fil5
	beq a2,s0,fila5
	li s0,fil6
	beq a2,s0,fila6
#guardo en s10 la fila	
fila1:	
	li s10,fil1
fila2:	
	li s10,fil2
fila3:
	li s10,fil3
fila4:
	li s10,fil4
fila5:
	li s10,fil5
fila6:
	li s10,fil6
							
#copio los primeros 4 bits de la posicion 0x10000 para obtener la columna
	andi a1,t0, 0x0000000F
#copio los bits del 4 a 7 de la posicion 0x10000 que corresponden a los leds
	andi a3,t0, 0x000000F0
#compruebo en que col
	li s0, col1
	beq a1,s0,colum1
	li s0, col2
	beq a1,s0,colum2
	li s0, col3
	beq a1,s0,colum3
	li s0, col4
	beq a1,s0,colum5
	li s0, col6
	beq a1,s0,colum6
	li s0, col7
	beq a1,s0,colum7
	li s0, col8
	beq a1,s0,colum8
	li s0, col9
	beq a1,s0,colum9
	li s0, col10
	beq a1,s0,colum10
	li s0, col11
	beq a1,s0,colum11
	li s0, col12
	beq a1,s0,colum12
	li s0, col13
	beq a1,s0,colum13
#guardo en s0 la columna	
colum1:
	li s5,fil2
	beq s10,s5,impCircumflex #^
	li s5,fil3
	beq s10,s5,impTab
	li s5,fil4
	beq s10,s5,ledCaps
	li s5,fil5
colum2:	 
	li s5,fil2
	beq s10,s5,imp1
	li s5,fil3
	beq s10,s5,impQ
	li s5,fil4
	beq s10,s5,impA
	li s5,fil5
	beq s10,s5,impMenor
colum3:
	li s5,fil2
	beq s10,s5,imp2
	li s5,fil3
	beq s10,s5,impW
	li s5,fil4
	beq s10,s5,impS
	li s5,fil5
	beq s10,s5,impX
colum4:
	li s5,fil2
	beq s10,s5,imp3
	li s5,fil3
	beq s10,s5,impE
	li s5,fil4
	beq s10,s5,impD
	li s5,fil5
	beq s10,s5,impC
	li s5,fil6
	beq s10,s5,impSpace
colum5:
	li s5,fil2
	beq s10,s5,imp4
	li s5,fil3
	beq s10,s5,impR
	li s5,fil4
	beq s10,s5,impF
	li s5,fil5
	beq s10,s5,impV
colum6:
	li s5,fil2
	beq s10,s5,imp5
	li s5,fil3
	beq s10,s5,impT
	li s5,fil4
	beq s10,s5,impG
	li s5,fil5
	beq s10,s5,impB
colum7:
	li s5,fil2
	beq s10,s5,imp6
	li s5,fil3 
	beq s10,s5,impZ
	li s5,fil4
	beq s10,s5,impH
	li s5,fil5
	beq s10,s5,impN
colum8:
	li s5,fil2
	beq s10,s5,imp7
	li s5,fil3 
	beq s10,s5,impU
	li s5,fil4
	beq s10,s5,impJ
	li s5,fil5
	beq s10,s5,impM
colum9:
	li s5,fil2
	beq s10,s5,imp8
	li s5,fil3 
	beq s10,s5,impI
	li s5,fil4
	beq s10,s5,impK
	li s5,fil5
	beq s10,s5,impComa
colum10:
	li s5,fil2
	beq s10,s5,imp9
	li s5,fil3 
	beq s10,s5,impO
	li s5,fil4
	beq s10,s5,impL
	li s5,fil5
	beq s10,s5,impPunto
colum11:
	li s5,fil2
	beq s10,s5,imp0
	li s5,fil3 
	beq s10,s5,impP
	li s5,fil5
	beq s10,s5,impGuion
colum12:	
	li s5,fil1
	beq s10,s5,ledPad
	li s5,fil2
	beq s10,s5,impPreg
colum13:
	li s5,fil1
	beq s10,s5,ledNum
	li s5,fil2
	beq s10,s5,impMas

impCircumflex:	li a0,'^'
		j mostrarTecla
impTab:		li a0,' '
		j mostrarTecla
imp1:		li a0,'1'
		j mostrarTecla
impQ:		li a0,'q'
		j mostrarTecla
impA:		li a0,'a'
		j mostrarTecla
impMenor:	li a0,'<'
		j mostrarTecla
imp2:		li a0,'2'
		j mostrarTecla
impW:		li a0,'w'
		j mostrarTecla
impS:		li a0,'s'
		j mostrarTecla
impX:		li a0,'x'
		j mostrarTecla
imp3:		li a0,'3'
		j mostrarTecla
impE:		li a0,'e'
		j mostrarTecla
impD:		li a0,'d'
		j mostrarTecla
impC:		li a0,'c'
		j mostrarTecla
impSpace:	li a0,' '
		j mostrarTecla
imp4:		li a0,'4'
		j mostrarTecla
impR:		li a0,'r'
		j mostrarTecla
impF:		li a0,'f'
		j mostrarTecla
impV:		li a0,'v'
		j mostrarTecla
imp5:		li a0,'5'
		j mostrarTecla
impT:		li a0,'t'
		j mostrarTecla
impG:		li a0,'g'
		j mostrarTecla
impB:		li a0,'b'
		j mostrarTecla
imp6:		li a0,'6'
		j mostrarTecla
impZ:		li a0,'z'
		j mostrarTecla
impH:		li a0,'h'
		j mostrarTecla
impN:		li a0,'n'
		j mostrarTecla
imp7:		li a0,'7'
		j mostrarTecla
impU:		li a0,'u'
		j mostrarTecla
impJ:		li a0,'j'
		j mostrarTecla
impM:		li a0,'m'
		j mostrarTecla
imp8:		li a0,'8'
		j mostrarTecla
impI:		li a0,'i'
		j mostrarTecla
impK:		li a0,'k'
		j mostrarTecla
impComa:	li a0,','
		j mostrarTecla
imp9:		li a0,'9'
		j mostrarTecla
impO:		li a0,'o'
		j mostrarTecla
impL:		li a0,'l'
		j mostrarTecla
impPunto:	li a0,'.'
		j mostrarTecla
imp0:		li a0,'0'
		j mostrarTecla
impP:		li a0,'p'
		j mostrarTecla
impGuion:	li a0,'-'
		j mostrarTecla
impPreg: 	li a0,'?'
		j mostrarTecla
impMas:		li a0,'+'
		j mostrarTecla
			
mostrarTecla:
	li a7,11	#mostrar la tecla pulsada
	ecall
	j fin
#los bits de los led están guardados en el registro a0
#encender o apagar Num -> bit 7
ledNum:
	addi s2,a0,0x00000080 # 0x00000080 tiene solo el bit 7 en 1 solo
	beq s2,zero,encNum  #si es igual a zero, está el bit apagado, entonces se enciende
	
#encender o apagar Caps -> bit 6
ledCaps:
	addi s2,a0,0x00000040 # 0x00000040 tiene solo el bit 6 en 1
	beq s2,zero,encCaps #si es igual a zero, está el bit apagado, entonces se enciende
	
#encender o apagar Pad -> bit 4
ledPad:
	addi s2,a0,0x00000010	# 0x00000080 tiene solo el bit 4 en 1 solo
	beq s2,zero,encPad #si es igual a zero, está el bit apagado, entonces se enciende
		
encNum:
	addi s4,t0,0x00000080
	sw t0,0(s4) #guarda el valor leido del puerto con el bit del led encendido
encCaps:
	addi s4,t0,0x00000040
	sw t0,0(s4)
encPad:
	addi s4,t0,0x00000010
	sw t0,0(s4)
#----- botones
#copio los bits 6 y 7 de la posicion de memoria 0x10001
	andi a3,t1,0x000000c0
	li s4, 0x60	
	beq a3,s4,act2Bot	#los dos botones presionados
	li s4, 0x20		
	beq a3,s4,actBot1	#boton de la derecha
	li s4, 0x40		
	beq a3,s4,actBot2	#boton de la izquierda
	
actBot1:
	la a0, msgB1	#muestra en pantalla que se apretó el botón izquierdo
	li a7, 4   
	ecall
	j fin
actBot2:
	la a0, msgB2	#muestra en pantalla que se apretó el botón derecho
	li a7, 4   
	ecall
	j fin
act2Bot:
	la a0, msgAmbos	#muestra en pantalla que se apretó ambos botones
	li a7, 4   
	ecall
	j fin
	
#----- mouse
	lui t4, 0x10002		#puerto 0x10002
	lw t5, 0(t4)	
	lui a0, 0x10003		#puerto 0x10003
	lw t6, 0(a0)
	
	add a0,zero,t5	#muestra en pantalla la posicion del mouse
	li a7,1
	ecall
	
	add a0,zero,t6	#muestra en pantalla la posicion del mouse
	li a7,1	
	ecall
	
	j fin

fin:
	li a7,10
	ecall

