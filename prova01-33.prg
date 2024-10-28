//Henrick claudino da silva
clear
set epoch to 1940
set date to british 

cDisciplina1 := space(30)
cDisciplina2 := space(30)
cDisciplina3 := space(30)
 

@ 01,01 say "Sistema Colegio Sul"

@ 02,01 say "Para comecar ensira as diciplinas:"
@ 03,01 say "Disciplina 1:"
@ 04,01 say "Disciplina 2:"
@ 05,01 say "Disciplina 3:"

@ 03,15 get cDisciplina1 picture '@!' valid !Empty(cDisciplina1)
@ 04,15 get cDisciplina2 picture '@!' valid !Empty(cDisciplina2)
@ 05,15 get cDisciplina3 picture '@!' valid !Empty(cDisciplina3)
read

clear

cNome:= space(30)
dNascimento:= CToD("")
cCurso:=space(15)
nSerie:= 0
nMensalidade:= 0



@ 01,01 say "Insira as informacoes do aluno"
@ 02,01 say "Nome:"
@ 03,01 say "Data de nascimento: "
@ 04,01 say "Curso:"
@ 05,01 say "Serie: °"
@ 06,01 say "Valor da mensalidade"

@ 02,06 get cNome picture '@!' valid !Empty(cNome)
@ 03,31 get dNascimento 
@ 04,07 get cCurso picture '@!' valid !Empty(cCurso)
@ 05,07 get nSerie picture "99" valid nSerie>0 .and. nSerie<9
@ 06,21 get nMensalidade picture "999.99" valid nMensalidade>0
read

nNota1B1M:=0
nNota2B1M:=0
nNota3B1M:=0
nNota4B1M:=0
nNota1B2M:=0
nNota2B2M:=0
nNota3B2M:=0
nNota4B2M:=0
nNota1B3M:=0
nNota2B3M:=0
nNota3B3M:=0
nNota4B3M:=0

nFalta1B1M:=0
nFalta2B1M:=0
nFalta3B1M:=0
nFalta4B1M:=0
nFalta1B2M:=0
nFalta2B2M:=0
nFalta3B2M:=0
nFalta4B2M:=0
nFalta1B3M:=0
nFalta2B3M:=0
nFalta3B3M:=0
nFalta4B3M:=0

nFaltaTotalB1:= 0
nFaltaTotalB2:= 0
nFaltaTotalB3:= 0
nFaltaTotalB4:= 0

nFaltaTotalM1:= 0
nFaltaTotalM2:= 0
nFaltaTotalM3:= 0

cMateriReprovol1:= space(15)
cMateriReprovol2:= space(15)
cMateriReprovol3:= space(15)

nMediaM1 := 0
nMediaM2 := 0
nMediaM3 := 0
nMediaTotal:=0

nPrecoaPagar:=0
nReprovaFaltas:=0

@ 07,01 say "A seguir encira o numero de faltas e notas por materia e bimestre"
@ 08,01 say "Materias       1Bimestre  2Bimestre 3Bimestre  4Bimestre    Media"
@ 09,01 say "                 F   N      F   N     F   N      F   N"
@ 10,01 say AllTrim(cDisciplina1)
@ 11,01 say AllTrim(cDisciplina2)
@ 12,01 say AllTrim(cDisciplina3)

@ 10,18 get nFalta1B1M picture "99" valid nFalta1B1M >= 0
@ 10,22 get nNota1B1M  picture "999" valid nNota1B1M >= 0 .and. nNota1B1M <101
read
@ 10,29 get nFalta2B1M picture "99" valid nFalta2B1M >= 0
@ 10,33 get nNota2B1M  picture "999" valid nNota2B1M >= 0 .and. nNota2B1M <101
read
@ 10,39 get nFalta3B1M picture "99" valid nFalta3B1M >= 0
@ 10,43 get nNota3B1M  picture "999" valid nNota3B1M >= 0 .and. nNota3B1M <101
read
@ 10,50 get nFalta4B1M picture "99" valid nFalta4B1M >= 0
@ 10,54 get nNota4B1M  picture "999" valid nNota4B1M >= 0 .and. nNota4B1M <101
read
nMediaM1 := (nNota1B1M+nNota2B1M+nNota3B1M+nNota4B1M)/4
if nSerie < 5
   if nMediaM1 >= 60
      @ 10,63 say Transform(nMediaM1, "999") color "g/n"
   else 
      @ 10,63 say Transform(nMediaM1, "999") color "r/n"
      cMateriReprovol1 := cDisciplina1
      nPrecoaPagar:= nPrecoaPagar+1
   endif
else
   if nMediaM1 >= 70
      @ 10,63 say Transform(nMediaM1, "999") color "g/n"
   else 
      @ 10,63 say Transform(nMediaM1, "999") color "r/n"
      cMateriReprovol1 := cDisciplina1
      nPrecoaPagar:= nPrecoaPagar+1
   endif
endif


@ 11,18 get nFalta1B2M picture "99" valid nFalta1B2M >= 0
@ 11,22 get nNota1B2M  picture "999" valid nNota1B2M >= 0 .and. nNota1B2M <101
read
@ 11,29 get nFalta2B2M picture "99" valid nFalta2B2M >= 0
@ 11,33 get nNota2B2M  picture "999" valid nNota2B2M >= 0 .and. nNota2B2M <101
read
@ 11,39 get nFalta3B2M picture "99" valid nFalta3B2M >= 0
@ 11,43 get nNota3B2M  picture "999" valid nNota3B2M >= 0 .and. nNota3B2M <101
read
@ 11,50 get nFalta4B2M picture "99" valid nFalta4B2M >= 0
@ 11,54 get nNota4B2M  picture "999" valid nNota4B2M >= 0 .and. nNota4B2M <101
read
nMediaM2 := (nNota1B2M+nNota2B2M+nNota3B2M+nNota4B2M)/4
if nSerie < 5
   if nMediaM2 >= 60
      @ 11,63 say Transform(nMediaM2, "999") color "g/n"
   else 
      @ 11,63 say Transform(nMediaM2, "999") color "r/n"
      cMateriReprovol2 := cDisciplina2
      nPrecoaPagar:= nPrecoaPagar+1
   endif
else
   if nMediaM2 >= 70
      @ 11,63 say Transform(nMediaM2, "999") color "g/n"
   else 
      @ 11,63 say Transform(nMediaM2, "999") color "r/n"
      cMateriReprovol2 := cDisciplina2
      nPrecoaPagar:= nPrecoaPagar+1
   endif
endif


@ 12,18 get nFalta1B3M picture "99" valid nFalta1B3M >= 0
@ 12,22 get nNota1B3M  picture "999" valid nNota1B3M >= 0 .and. nNota1B3M <101
read
@ 12,29 get nFalta2B3M picture "99" valid nFalta2B3M >= 0
@ 12,33 get nNota2B3M  picture "999" valid nNota2B3M >= 0 .and. nNota2B3M <101
read
@ 12,39 get nFalta3B3M picture "99" valid nFalta3B3M >= 0
@ 12,43 get nNota3B3M  picture "999" valid nNota3B3M >= 0 .and. nNota3B3M <101
read
@ 12,50 get nFalta4B3M picture "99" valid nFalta4B3M >= 0
@ 12,54 get nNota4B3M  picture "999" valid nNota4B3M >= 0 .and. nNota4B3M <101
read
nMediaM3 := (nNota1B3M+nNota2B3M+nNota3B3M+nNota4B3M)/4
if nSerie < 5
   if nMediaM3 >= 60
      @ 12,63 say Transform(nMediaM3, "999") color "g/n"
   else 
      @ 12,63 say Transform(nMediaM3, "999") color "r/n"
      cMateriReprovol3 := cDisciplina3
      nPrecoaPagar:= nPrecoaPagar+1

   endif
else
   if nMediaM3 >= 70
      @ 12,63 say Transform(nMediaM3, "999") color "g/n"
   else 
      @ 12,63 say Transform(nMediaM3, "999") color "r/n"
      cMateriReprovol3 := cDisciplina3
      nPrecoaPagar:= nPrecoaPagar+1
   endif
endif

nFaltaTotalB1:= nFalta1B1M+ nFalta1B2M + nFalta1B3M
nFaltaTotalB2:= nFalta2B1M+ nFalta2B2M + nFalta2B3M
nFaltaTotalB3:= nFalta3B1M+ nFalta3B2M + nFalta3B3M
nFaltaTotalB4:= nFalta4B1M+ nFalta4B2M + nFalta4B3M

nFaltaTotalM1 := nFalta1B1M + nFalta2B1M + nFalta3B1M + nFalta4B1M
nFaltaTotalM2 := nFalta1B2M + nFalta2B2M + nFalta3B2M + nFalta4B2M
nFaltaTotalM3 := nFalta1B3M + nFalta2B3M + nFalta3B3M + nFalta4B3M
if nSerie < 5
   if nFaltaTotalM1 <07

   else 
      cMateriReprovol1 := cDisciplina1
      nPrecoaPagar:= nPrecoaPagar+1

   endif
else
   if nFaltaTotalM1 <09

   else 
     
      cMateriReprovol1 := cDisciplina1
      nPrecoaPagar:= nPrecoaPagar+1
   endif
endif

if nSerie < 5
   if nFaltaTotalM2 <07

   else 
      cMateriReprovol2 := cDisciplina2
      nPrecoaPagar:= nPrecoaPagar+1

   endif
else
   if nFaltaTotalM2 <09

   else 
     
      cMateriReprovol2 := cDisciplina2
      nPrecoaPagar:= nPrecoaPagar+1
   endif
endif

if nSerie < 5
   if nFaltaTotalM3 <07

   else 
      cMateriReprovol3 := cDisciplina3
      nPrecoaPagar:= nPrecoaPagar+1

   endif
else
   if nFaltaTotalM3 <09

   else 
     
      cMateriReprovol3 := cDisciplina3
      nPrecoaPagar:= nPrecoaPagar+1
   endif
endif


nFalta:=(nFaltaTotalB1+ nFaltaTotalB2+nFaltaTotalB3+nFaltaTotalB4+nFaltaTotalM1+nFaltaTotalM2+nFaltaTotalM3 )/7
nMediaTotal:= (nMediaM1+nMediaM2+nMediaM3)/3

clear
nnovopreco:=nMensalidade +(((nMensalidade/100) *20)*nPrecoaPagar)

if nSerie <5
   if nMediaTotal >= 60 .and. nSerie < 4 .and. nFalta < 7
      @ 01,01 say "ALUNO APROVADO COM MEDIA " + AllTrim(Transform(nMediaTotal,"999"))
   elseif nMediaTotal >= 60 .and. nSerie = 4 .and. nFalta < 9
      @ 01,01 say "ALUNO APROVADO COM MEDIA " + AllTrim(Transform(nMediaTotal,"999"))
   elseif nMediaTotal < 60  .and. nFalta >=7 .and. nSerie < 4 
      @ 01,01 say "ALUNO REPROVOU EM TODAS AS MATERIAS" 
   elseif nMediaTotal < 60  .and. nFalta >=9 .and. nSerie = 4
      @ 01,01 say "ALUNO REPROVOU EM TODAS AS MATERIAS" 
   elseif nMediaTotal < 60 .and. nFalta < 7 .or. MediaTotal >= 60 .and. nFalta > 7 .and. nSerie<4
      @ 01,01 say "ALUNO APROVADO COM DEPENDENCIAS, O CUSTO AGORA E DE "+ Transform(nnovopreco, "999.99")+" Reprovado em " +AllTrim(cDisciplina1)+AllTrim(cDisciplina2)+AllTrim(cDisciplina3)
   elseif nMediaTotal < 70 .and. nFalta < 9 .or. MediaTotal >= 70 .and. nFalta > 9 .and. nSerie=4
      @ 01,01 say "ALUNO APROVADO COM DEPENDENCIAS, O CUSTO AGORA E DE "+ Transform(nnovopreco, "999.99")+" Reprovado em " +AllTrim(cDisciplina1)+AllTrim(cDisciplina2)+AllTrim(cDisciplina3)
   endif
else
   if nMediaTotal >= 70 .and. nFalta < 9 
         @ 01,01 say "ALUNO APROVADO COM MEDIA " + AllTrim(Transform(nMediaTotal,"999"))

   elseif nMediaTotal < 70 .and. nPrecoaPagar>=3 .and. nFalta >=9 .and. nPrecoaPagar>=3
         @ 01,01 say "ALUNO REPROVOU EM TODAS AS MATERIAS" 
   elseif nMediaTotal < 70 .and. nFalta < 9 .or. MediaTotal >= 70 .and. nFalta > 9
      @ 01,01 say "ALUNO APROVADO COM DEPENDENCIAS, O CUSTO AGORA E DE "+Transform(nnovopreco,"999.99")+" Reprovado em " +AllTrim(cDisciplina1)+AllTrim(cDisciplina2)+AllTrim(cDisciplina3)
   end if
endif










