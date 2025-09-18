//Henrick Claudino da silva
set date british
set epoch to 1940
clear

nLinha         :=01

cVendedor      :=space(30)
dCotacao       :=date()

cNome          :=space(30)
nIdade         :=00
cSexo          :=space(1)
nPeso          :=0
nAltura        :=0
cFumante       :=space(1)

cTipoPlano     :=Space(1)
cAbrangencia   :=space(1)

nValorBaseSaude:=300
nValorBaseVida :=320
nNovoValorSaude:=300
nNovoValorVida :=320

@ nLinha,01   say "Vendedor:"
@ nLinha++,50 say "Data cotacao:"
nLinha++
@ nLinha++,01 say "Nome........:"
@ nLinha++,01 say "Idade.......:"
@ nLinha++,01 say "Sexo(M/F)...:"
@ nLinha++,01 say "Peso........:"
@ nLinha++,01 say "Altura......:"
@ nLinha++,01 say "Fumante(S/N):"
nLinha++
@ nLinha++,01 say "Tipo de plano(E/A/V):"
@ nLinha++,01 say "abrangencia(R/N)....:"
nLinha:=01

@ nLinha,15   get cVendedor    picture "@!"     Valid !Empty(cVendedor)
@ nLinha++,63 get dCotacao                      Valid !Empty(dCotacao)
read
nLinha++
@ nLinha++,15 get cNome        picture"@!"      Valid !Empty(cNome)
@ nLinha++,15 get nIdade       picture"999"     Valid nIdade>=0
@ nLinha++,15 get cSexo        picture"@!"      Valid cSexo $ "FM"
@ nLinha++,15 get nPeso        picture"@E 999.9"Valid nPeso>0
@ nLinha++,15 get nAltura      picture"@E 9.99" Valid nAltura>0
@ nLinha++,15 get cFumante     picture"@!"      Valid cFumante $ "SN"
read
nLinha++
@ nLinha++,23 get cTipoPlano   picture"@!"      Valid cTipoPlano $ "EAV"
@ nLinha++,23 get cAbrangencia picture"@!"      Valid cAbrangencia $ "RN"
read

nIMC:=nPeso/(nAltura*nAltura)

if nIdade<30
   nNovoValorSaude-= nValorBaseSaude*(10/100)
   if nIdade<25
      nNovoValorVida-=nValorBaseVida*(15/100)
   endif
elseif nIdade>60
   nNovoValorSaude+= nValorBaseSaude*(20/100)
   if nIdade>65
      nNovoValorVida+= nValorBaseVida*(25/100)
   endif
endif

if cSexo =="M"
   nNovoValorSaude+= nValorBaseSaude*(5/100)
   nNovoValorVida-= nValorBaseVida*(5/100)
else
   nNovoValorSaude-= nValorBaseSaude*(5/100)
   nNovoValorVida+= nValorBaseVida*(10/100)
endif

if nIMC>25
   nNovoValorVida+= nValorBaseVida*(10/100)
   if nIMC >30
      nNovoValorSaude+= nValorBaseSaude*(15/100)
   endif
endif

if cFumante =="S"
   nNovoValorSaude+= nValorBaseSaude*(20/100)
   nNovoValorVida+= nValorBaseVida*(25/100)
endif

if cTipoPlano =="A"
   nNovoValorSaude+= nValorBaseSaude*(30/100)
   nNovoValorVida+= nValorBaseVida*(25/100)
elseif cTipoPlano == "V"
   nNovoValorSaude+= nValorBaseSaude*(50/100)
   nNovoValorVida+= nValorBaseVida*(45/100)
endif

if cAbrangencia =="N"
   nNovoValorSaude+= nValorBaseSaude*(15/100)
   nNovoValorVida+= nValorBaseVida*(10/100)
endif

if Month(dCotacao)==5
   nNovoValorSaude-= nValorBaseSaude*(10/100)
elseif Month(dCotacao)==10
   nNovoValorVida-= nValorBaseVida*(15/100)
endif

nValorTrimestralSaude:=nNovoValorSaude*3
nValorAnualSaude:=nNovoValorSaude*12
nValorTrimestralVida:=nNovoValorVida*3
nValorAnualVida:=nNovoValorVida*12

cCorSaude:="W/R"
cCorVida :="W/G"

if nNovoValorSaude<nNovoValorVida
   cCorSaude:="W/G"
   cCorVida :="W/R"
endif

dCotacao+=31
dValidade:=dCotacao-day(dCotacao)


@ 01,01 clear to 09,38
@ 01,41 clear to 09,78

nLinha:=01

@ nLinha++,01 say"Saude Total" color cCorSaude
@ nLinha++,01 say"Mensal.....:"+alltrim(str(nNovoValorSaude))
@ nLinha++,01 say"Trimestral:" +alltrim(str(nValorTrimestralSaude))
@ nLinha++,01 say"Anual.....:" +alltrim(str(nValorAnualSaude))

nLinha:=01

@ nLinha++,41 say "Vida Pura" color cCorVida
@ nLinha++,41 say "Mensal.....:"+ alltrim(Str(nNovoValorVida))
@ nLinha++,41 say "Trimestral:"+  alltrim(Str(nValorTrimestralVida))
@ nLinha++,41 say "Anual.....:"+  alltrim(Str(nValoranualVida))
nLinha++
@ nLinha++,01 say "Validado ate: "+ DToC(dValidade)

