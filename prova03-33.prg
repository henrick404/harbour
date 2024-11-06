//Henrick Claudino da Silva
clear

set date to british
set epoch to 1940

dHoje       := date()
nAptoF      :=0
nAptoM      :=0
nLinha      :=01
nLinha2     :=03
nAtual      := 1
nEmpregados :=0
nAlerta     :=0
nTotalPagar :=0
dAleatorio10:= CToD("01/01/2010")
dAleatorio15:= CToD("01/01/2015")
dAleatorio12:= CToD("01/01/2012")
dAleatorio20:= CToD("01/01/2020")
nMulher85   :=0
nHomen06    :=0
dAleatorio06:= CToD("01/01/2006")
mulherreduz :=0
homenganha  :=0

@ nLinha++ ,01 say "Numero de empregados:"
@ 01, 22 get nEmpregados picture '999999' valid nEmpregados>0
read



do while .T.
   nLinha      :=01
   nLinha2     :=03
   cNome       :=space(15)
   cSexo       :=space(1)
   nIdade      := 0
   nTrabalho   :=  0
   nLinha++
   nAposentado :=0
   nVELHA85    :=0
   dNascimento := CToD('')
   dAdmissao   := CToD('')
   dDemissao   := CToD('')
   nHomen206:=0
   nSalarioBase            := 0
   nAdicionalNoturno       := 0
   nAdicionalInsalubridade := 0

   @ nLinha++,01 SAY "FUNCIONARIO "+ AllTrim(STR(nAtual))
   @ nLinha++,01 say "NOME DO FUNCINARIO:"
   @ nLinha++,01 say "Sexo(M/F): "
   @ nLinha++,01 say "DATA DE NASCIMENTO: "
   @ nLinha++,01 say "DATA DE ADMISSAO:"
   @ nLinha++,01 say "DATA DE DEMISSAO:"
   @ nLinha++,01 say "VALOR DO SALARIO:"
   @ nLinha++,01 say "ADICIONAL NOTURNO(EM %):"
   @ nLinha++,01 say "ADICIONAL INSALUBRIDADE(EM %):"

   @ nLinha2++,20 GET cNome PICTURE '@!' VALID !EMPTY(cNome)
   @ nLinha2++,11 GET cSexo PICTURE '@!' VALID !EMPTY(cSexo) .AND. cSexo = 'M' .OR. !EMPTY(cSexo) .AND. cSexo = 'F'
   @ nLinha2++,20 GET dNascimento VALID !EMPTY(dNascimento)
   @ nLinha2++,18 GET dAdmissao VALID !EMPTY(dAdmissao)
   @ nLinha2++,18 GET dDemissao VALID !EMPTY(dDemissao)
   @ nLinha2++,18 GET nSalarioBase PICTURE '99999.99' VALID nSalarioBase > 0
   @ nLinha2++,25 GET nAdicionalNoturno PICTURE '999'
   @ nLinha2++,31 GET nAdicionalInsalubridade PICTURE '999'
   READ
   IF LastKey()==27
      nAlerta:= ALERT('DESEJA SAIR?', {'CANCELAR','RETORNAR','PROCESSAR'})
      IF nAlerta = 1
         LOOP
      ELSEIF nAlerta = 3
         exit
      ENDIF
   end if 

   
   nAposentado+= nSalarioBase
   nIdade := year(dHoje)-year(dNascimento)  
   nTrabalho := year(dDemissao)-year(dAdmissao)
   nAposentado+= (nSalarioBase/100)*nAdicionalNoturno
   nAposentado+= (nSalarioBase/100)*nAdicionalInsalubridade
   nTotalPagar+=nAposentado

   IF YEAR(dAdmissao) = (YEAR(dAleatorio10) .or.YEAR(dAleatorio15)) .OR. YEAR(dDemissao) = (YEAR(dAleatorio10).or.YEAR(dAleatorio15)) .OR.  ( YEAR(dAdmissao) < (YEAR(dAleatorio15).or.YEAR(dAleatorio10)) .AND. YEAR(dDemissao) > (YEAR(dAleatorio10).or.YEAR(dAleatorio15)))
      nAposentado += (nSalarioBase/100)*6
      if cSexo = "M"
         homenganha += 1
      endif
   ELSEIF YEAR(dAdmissao) < year(dAleatorio20) .and. YEAR(dDemissao) > year(dAleatorio12)
      nAposentado -= (nSalarioBase/100)*2
      if cSexo = "F"
         mulherreduz+= 1
      endif
   ENDIF

   IF cSexo = "M" .AND. nIdade >= 59 .and. nTrabalho>=27
      nAptoM += 1
      
   elseIF cSexo = "F" .AND. nIdade >= 55 .and. nTrabalho>=22
      nAptoF += 1

   ENDIF
   IF cSexo = "F"
      nVELHA85:=year(dNascimento) - year(dHoje)
      if  nVELHA85 >85
         nMulher85+=1
      ENDIF
   end if

   IF cSexo = "M" .and. year(dAdmissao)> year(dAleatorio06)
      nHomen06+=1
   end if

   nAtual +=1

   IF nAtual > nEmpregados
      exit
   ENDIF
end do

CLEAR
nAptoTotal   := 0
nAptoTotal   := nAptoF + nAptoM
nPorcentagemF := (nAptoF*100)/nAptoTotal
nPorcentagemM := (nAptoM*100)/nAptoTotal

@ 01,01 say 'O percentual de homens aposentado e' + Transform(nPorcentagemM,'999.99') + '%'
@ 02,01 say 'O percentual de mulheres aposentadas e' + Transform(nPorcentagemF,'999.99') + '%'
@ 03,01 say "o total a pagar e RS"+ AllTrim(str(nTotalPagar))

@ 04,01 say "A quantidade de mulheres com 85 anos e "+ AllTrim(str(nMulher85))
@ 05,01 say "A quantidade de Homens adimitidos antes de 2006 e "+ AllTrim(str(nHomen06))
@ 06,01 say "A quantidade de mulheres que recebeu reducao e "+ AllTrim(str(mulherreduz))
@ 07,01 say "A quantidade de homens que recebeu adicional foi "+ AllTrim(str(homenganha))
