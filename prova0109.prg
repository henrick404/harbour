// Henrick Claudino da Silva
set date british
set epoch to 1940
clear

nMediaNota        :=60
nMediaFalta       :=6
nDP               :=0
cDiciplina1       :=space(10)
cDiciplina2       :=space(10)
cDiciplina3       :=space(10)
cNome             :=space(30)
dNascimento       :=CToD("")
cCurso            :=space(15)
nSerie            :=0
nNotaDisciplina1  :=0
nNotaDisciplina2  :=0
nNotaDisciplina3  :=0
nFaltaDisciplina1 :=0
nFaltaDisciplina2 :=0
nFaltaDisciplina3 :=0
nMensalidade      :=0
//
nNotaBimestre1    :=0
nNotaBimestre2    :=0
nNotaBimestre3    :=0
nNotaBimestre4    :=0
nFaltaBimestre1   :=0
nFaltaBimestre2   :=0
nFaltaBimestre3   :=0
nFaltaBimestre4   :=0
nLinha            :=01
//
cDisciplinaReprova:=space(30)

@ nLinha++,01 say "instituicao de ensino"
@ nLinha++,01 say "Nome:"
@ nLinha++,01 say "Nascimento"
@ nLinha++,01 say "curso"
@ nLinha++,01 say "serie"
@ nLinha++,01 say "mensalidade: R$"
nLinha:=02

@ nLinha++,15 get  cNome        picture "@!"             valid !Empty(cNome)
@ nLinha++,15 get  dNascimento                           valid dNascimento< Date()
@ nLinha++,15 get  cCurso       picture "@!"             valid !Empty(cCurso)
@ nLinha++,15 get  nSerie       picture "9"              valid nSerie > 0 .and. nSerie<9
@ nLinha++,15 get  nMensalidade picture "@E   99,999.99" valid nMensalidade>0
read

if nSerie >=5
   nMediaNota:=70
endif
if nSerie >= 4
   nMediaFalta:=8
endif

nLinha++
@ nLinha++,10       say "1Bimes |2Bimes |3Bimes |4Bimes |Media"
@ nLinha++,10       say "  N|F  |  N|F  |  N|F  |  N|F  | N|F "
@ nLinha++,10       say "   |   |   |   |   |   |   |   |  |   "
@ nLinha++,10       say "   |   |   |   |   |   |   |   |  |   "
@ nLinha++,10       say "   |   |   |   |   |   |   |   |  |   "
@ 07,00 to 15,60 double
nLinha:=10
@ nLinha++,00 get cDiciplina1    Picture"@!" Valid !Empty(cDiciplina1)
@ nLinha++,00 get cDiciplina2    Picture"@!" Valid !Empty(cDiciplina2)
@ nLinha++,00 get cDiciplina3    Picture"@!" Valid !Empty(cDiciplina3)
read

//----------------disciplina1
nLinha:=10
@ nLinha,10 get nNotaBimestre1   picture "999"  valid nNotaBimestre1>=0 .and. nNotaBimestre1<=100
@ nLinha,14 get nFaltaBimestre1  picture "99"   valid nFaltaBimestre1 >=0
@ nLinha,18 get nNotaBimestre2   picture "999"  valid nNotaBimestre2>=0 .and. nNotaBimestre2<=100
@ nLinha,22 get nFaltaBimestre2  picture "99"   valid nFaltaBimestre2 >=0
@ nLinha,26 get nNotaBimestre3   picture "999"  valid nNotaBimestre3>=0 .and. nNotaBimestre3<=100
@ nLinha,30 get nFaltaBimestre3  picture "99"   valid nFaltaBimestre3 >=0
@ nLinha,34 get nNotaBimestre4   picture "999"  valid nNotaBimestre4>=0 .and. nNotaBimestre4<=100
@ nLinha,38 get nFaltaBimestre4  picture "99"   valid nFaltaBimestre4 >=0
read

nNotaDisciplina1 =(nNotaBimestre1+nNotaBimestre2+nNotaBimestre3+nNotaBimestre4)/4
nFaltaDisciplina1=(nFaltaBimestre1+nFaltaBimestre2+nFaltaBimestre3+nFaltaBimestre4)/4

if nNotaDisciplina1>=nMediaNota
   cColor1:="g/n"
else
   cColor1:="r/n"
endif

if nFaltaDisciplina1 <= nMediaFalta
   cColor2:="g/n"
else
   cColor2 := "r/n"
endif

if cColor1=="r/n" .or. cColor2=="r/n"
   cDisciplinaReprova+=cDiciplina1
   nDP+=1
endif
@ nLinha,42 say nNotaDisciplina1    picture "999" color cColor1
@ nLinha,46 say nFaltaDisciplina1   picture "99"  color cColor2

//-----------------disciplina2
nLinha:=11
@ nLinha,10 get nNotaBimestre1   picture "999"  valid nNotaBimestre1>=0 .and. nNotaBimestre1<=100
@ nLinha,14 get nFaltaBimestre1  picture "99"   valid nFaltaBimestre1 >=0
@ nLinha,18 get nNotaBimestre2   picture "999"  valid nNotaBimestre2>=0 .and. nNotaBimestre2<=100
@ nLinha,22 get nFaltaBimestre2  picture "99"   valid nFaltaBimestre2 >=0
@ nLinha,26 get nNotaBimestre3   picture "999"  valid nNotaBimestre3>=0 .and. nNotaBimestre3<=100
@ nLinha,30 get nFaltaBimestre3  picture "99"   valid nFaltaBimestre3 >=0
@ nLinha,34 get nNotaBimestre4   picture "999"  valid nNotaBimestre4>=0 .and. nNotaBimestre4<=100
@ nLinha,38 get nFaltaBimestre4  picture "99"   valid nFaltaBimestre4 >=0
read

nNotaDisciplina2 =(nNotaBimestre1+nNotaBimestre2+nNotaBimestre3+nNotaBimestre4)/4
nFaltaDisciplina2=(nFaltaBimestre1+nFaltaBimestre2+nFaltaBimestre3+nFaltaBimestre4)/4

if nNotaDisciplina2>=nMediaNota
   cColor1:="g/n"
else
   cColor1:="r/n"
endif

if nFaltaDisciplina2 <= nMediaFalta
   cColor2:="g/n"
else
   cColor2 := "r/n"
endif

if cColor1=="r/n" .or. cColor2=="r/n"
   cDisciplinaReprova+=cDiciplina2
   nDP+=1
endif

@ nLinha,42 say nNotaDisciplina2    picture "999" color cColor1
@ nLinha,46 say nFaltaDisciplina2   picture "99"  color cColor2

//-------disciplina3
nLinha:=12
@ nLinha,10 get nNotaBimestre1   picture "999"  valid nNotaBimestre1>=0 .and. nNotaBimestre1<=100
@ nLinha,14 get nFaltaBimestre1  picture "99"   valid nFaltaBimestre1 >=0
@ nLinha,18 get nNotaBimestre2   picture "999"  valid nNotaBimestre2>=0 .and. nNotaBimestre2<=100
@ nLinha,22 get nFaltaBimestre2  picture "99"   valid nFaltaBimestre2 >=0
@ nLinha,26 get nNotaBimestre3   picture "999"  valid nNotaBimestre3>=0 .and. nNotaBimestre3<=100
@ nLinha,30 get nFaltaBimestre3  picture "99"   valid nFaltaBimestre3 >=0
@ nLinha,34 get nNotaBimestre4   picture "999"  valid nNotaBimestre4>=0 .and. nNotaBimestre4<=100
@ nLinha,38 get nFaltaBimestre4  picture "99"   valid nFaltaBimestre4 >=0
read

nNotaDisciplina3 =(nNotaBimestre1+nNotaBimestre2+nNotaBimestre3+nNotaBimestre4)/4
nFaltaDisciplina3=(nFaltaBimestre1+nFaltaBimestre2+nFaltaBimestre3+nFaltaBimestre4)/4

if nNotaDisciplina3>=nMediaNota
   cColor1:="g/n"
else
   cColor1:="r/n"
endif

if nFaltaDisciplina3 <= nMediaFalta
   cColor2:="g/n"
else
   cColor2 := "r/n"
endif


if cColor1=="r/n" .or. cColor2=="r/n"
   cDisciplinaReprova+=cDiciplina3
   nDP+=1
endif

@ nLinha,42 say nNotaDisciplina3    picture "999" color cColor1
@ nLinha,46 say nFaltaDisciplina3   picture "99"  color cColor2

inkey(07)
clear
nLinha:=01
@ nLinha++,01 say cNome

if nDP >=3
   @ nLinha++,01 say "reprovou"
elseif nDP==0
   @ nLinha++,01 say "passou sem dependencias"
else
   nAumento:=nDP*20
   nMensalidade+=nMensalidade*(nAumento/100)
   @ nLinha,01   say "passou com dependencias em:"
   @ nLinha++,30 say cDisciplinaReprova
   @ nLinha,01   say "nova mensalidade"
   @ nLinha++,20 say nMensalidade picture "@E R$99,999.99"
endif
