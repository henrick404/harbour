//Henrick Claudino da Silva
clear

set date to british
set epoch to 1940

//cabeçalho
cNomeVendedor  :=space(30)
dCotacao:=CToD("")

//dados
cNome  :=space(30)
nIdade := 0
cSexo  := space(1)
dAnocnh:= CtoD("")
dAnocnh:= Year(dAnocnh)

//dadosveiculo
cMarca      :=space(20)
dAnoFabrica := CtoD('')
dAnoFabrica := Year(dAnoFabrica)
cTipoVei    := space(01)
nMotor      := 0
nValorFipe  :=0
cUso        := space(1)
linha       :=01
linha2      :=01

@ linha++,01 say "Nome vendedor:"
@ linha++,01 say "Quando esta cotando:"

//pergunta dados do usuario
@ linha++,01 say "nome:"
@ linha++,01 say "Idade:"
@ linha++,01 say "Sexo(M para masculino F para feminino)"
@ linha++,01 say "Ano CNH:"

//pergunta dados do carro
@ linha++,01 say "Marca:"
@ linha++,01 say "Ano de fabrica"
@ linha++,01 say "Tipo(P passeio,E esportivo,L luxo)"
@ linha++,01 say "Motor:"
@ linha++,01 say "Preco fipe:"
@ linha++,01 say "Uso(P particular,O profissional): "

//pega os dados
@ linha2++,15 get cNomeVendedor   picture "@!"            valid !Empty(cNomeVendedor)
@ linha2++,21 get dCotacao        picture "99/99/9999"    valid !Empty(dCotacao)
@ linha2++,06 get cNome           picture "@!"            valid !Empty(cNome)
@ linha2++,07 get nIdade          picture "999"           Valid nIdade >= 18
@ linha2++,39 get cSexo           picture '@!'            valid cSexo $ 'F M'
@ linha2++,09 get dAnocnh         picture "9999"          valid !Empty(dAnocnh)
@ linha2++,07 get cMarca          picture "@!"            valid !Empty(cMarca)
@ linha2++,15 get dAnoFabrica     picture "9999"          valid !Empty(dAnoFabrica)
@ linha2++,35 get cTipoVei        picture '@!'            valid cTipoVei $ ' P E L'
@ linha2++,07 get nMotor          picture "9.9"           valid nMotor > 0
@ linha2++,12 get nValorFipe      picture "9999999999.99" valid nValorFipe>0
@ linha2++,34 get cUso            picture '@!'            valid cUso $ 'P O'
read

nSeguro1:=0
nSeguro2:=0

nSeguro1 := (nValorFipe/100) * 6
nSeguro2 := (nValorFipe/100) * 7

nSeguro1inicio := (nValorFipe/100) * 6
nSeguro2inicio := (nValorFipe/100) * 7

nCarroidade := 0
nCarroidade := dCotacao-dAnoFabrica
precoidade  := 0
dVerifica   := year(dCotacao)-dAnocnh

//seguro 1
if nIdade < 25 .or. nIdade > 65
   nSeguro1 += (nSeguro1inicio/100)*10
elseif cSexo = "M"
   nSeguro1 += (nSeguro1inicio/100)*10
elseif cSexo = "F"
   nSeguro1 -= (nSeguro1inicio/100)*5
elseif dVerifica <= 3
   nSeguro1 += (nSeguro1inicio/100)*15
elseif dVerifica > 8
   nSeguro1 -= (nSeguro1inicio/100)*10
elseif cTipoVei = "E"
   nSeguro1 += (nSeguro1inicio/100)*10
elseif cTipoVei = "L"
   nSeguro1 += (nSeguro1inicio/100)*20
elseif nMotor > 2.0
   nSeguro1 += (nSeguro1inicio/100)*15
elseif cUso = "O"
   nSeguro1 += (nSeguro1inicio/100)*10
elseif dCotacao = Month(03)
   nSeguro1 -= (nSeguro1inicio/100)*10
endif

//seguro 2
if nIdade < 23 .or. nIdade > 60
   nSeguro2 += (nSeguro2inicio/100)*15
elseif nIdade < 50 .and. nIdade > 30
   nSeguro2 -= (nSeguro2inicio/100)*08
elseif cSexo = "M"
   nSeguro2 -= (nSeguro2inicio/100)*06
elseif cSexo = "F"
   nSeguro2 += (nSeguro2inicio/100)*12
elseif dVerifica <= 2
   nSeguro2 += (nSeguro2inicio/100)*20
elseif dVerifica > 5
   nSeguro2 -= (nSeguro2inicio/100)*8
elseif cTipoVei = "E"
   nSeguro2 += (nSeguro2inicio/100)*15
elseif cTipoVei = "L"
   nSeguro2 += (nSeguro2inicio/100)*18
elseif nMotor >= 1.5
   nSeguro2 += (nSeguro2inicio/100)*10
elseif cUso = "O"
   nSeguro2 += (nSeguro2inicio/100)*12
elseif dCotacao = Month(09)
   nSeguro2 -= (nSeguro2inicio/100)*8
endif

clear
linha3:=02
linha4:=02

@ 01,01 say "seguros e Cia                  seguro dois irmãos"

if nSeguro1 < nSeguro2

   @ linha3++,01 say "valor anual RS" +      Transform(nSeguro1,"@e 99999.99")   color "g/n"
   @ linha3++,01 say "valor trimestral RS" + Transform(nSeguro1/4,"@e 99999.99") color "g/n"
   @ linha3++,01 say "valor mensal RS" +     Transform(nSeguro1/12,"@e 99999.99")color "g/n"

   @ linha4++,32 say "valor anual RS" +      Transform(nSeguro2,"@e 99999.99")   color "r/n"
   @ linha4++,32 say "valor trimestral RS" + Transform(nSeguro2/4,"@e 99999.99") color "r/n"
   @ linha4++,32 say "valor mensal RS" +     Transform(nSeguro2/12,"@e 99999.99")color "r/n"
elseif nSeguro2 < nSeguro1
   @ linha3++,01 say "valor anual RS" +      Transform(nSeguro1,"@e 99999.99")   color "r/n"
   @ linha3++,01 say "valor trimestral RS" + Transform(nSeguro1/4,"@e 99999.99") color "r/n"
   @ linha3++,01 say "valor mensal RS" +     Transform(nSeguro1/12,"@e 99999.99")color "r/n"

   @ linha4++,32 say "valor anual RS" +      Transform(nSeguro2,"@e 99999.99")   color "g/n"
   @ linha4++,32 say "valor trimestral RS" + Transform(nSeguro2/4,"@e 99999.99") color "g/n"
   @ linha4++,32 say "valor mensal RS" +     Transform(nSeguro2/12,"@e 99999.99")color "g/n"
end if
dValidade:=dCotacao
dDiavVal:= day(dCotacao)+30
@ 30,01 say "valido ate" + DToC(dDiavVal) + DToC(Month(dValidade)) +  DToC(Year(dValidade)) DToC()
