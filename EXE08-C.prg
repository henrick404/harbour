clear 
set date to british

do while .t.
   //Variaveis
   //DADOS DA COMPRA
   cNome             := space(30)
   nIdade            := 0
   dCompra           := Date()
   nSaldo            := 1000

   //CODIF
   nProdutoQA := 0
   nProdutoQB := 0
   nProdutoQC := 0

   nPrecoProdutoA :=0
   nPrecoProdutoB :=0
   nPrecoProdutoC :=0

   cProdutoA  := space(15)
   cProdutoB  := space(15)
   cProdutoC  := space(15)

   nTotal     := 0
   cEndereco  := space(40)

   nAlerta   := 0
   nAlerta1  := 0
   nNumero   := 1
   //escrita info
   /*@ 01,01 say "Nome:"
   @ 02,01 say "Idade:"
   @ 03,01 say "Data da compra:" + DToC(dCompra)


   //pede info
   @ 01,06 get cNome    Picture "@!"   valid !Empty(cNome)
   @ 02,07 get nIdade   Picture "999"  valid nIdade > 0 
   read */


   //medida provisória depois eu arrumo
   @ 05,01 say "Seq  Nome-do-produto  Quantidade  Preco-unitario  Custo"
   @ 06,01 say AllTrim(Str(nNumero++))
   @ 07,01 say AllTrim(Str(nNumero++))
   @ 08,01 say AllTrim(Str(nNumero++))
   if LastKey() == 27
      nAlerta1:= alert('deseja sair?', {'sim','nao'})
      if nAlerta1 = 1
         exit
      endif
   endif
   do while .t.
      //produto A
      @ 06,06 get cProdutoA      Picture "@!"      valid !Empty(cProdutoA)
      @ 06,27 get nProdutoQA     Picture "999"     valid nProdutoQA > 0
      @ 06,42 get nPrecoProdutoA Picture "999.99"  valid nPrecoProdutoA > 0
      read

      if LastKey() == 27
         nAlerta := alert('terminar compra', {'cancelar','finalizar'})
         if nAlerta = 1
            loop
         elseif nAlerta = 2
            exit
         endif
      endif

      nTotal+= (nProdutoQA * nPrecoProdutoA)
      @ 09,01 say "Total:" +   Transform(nTotal,"@e 9999.99") 
      if nSaldo > nTotal
         cCor := "g/n"
      elseif nSaldo < nTotal
         cCor := "r/n"
      endif
      @ 09,20 say 'Saldo: RS' +Transform(nSaldo-nTotal,"@e 99999.99") color cCor
      @ 06,51 say 'RS' +       Transform(nProdutoQA*nPrecoProdutoA, "@e 999.99")

      //produto B
      @ 07,06 get cProdutoB      Picture "@!"      valid !Empty(cProdutoB)
      @ 07,27 get nProdutoQB     Picture "999"     valid nProdutoQB > 0
      @ 07,42 get nPrecoProdutoB Picture "999.99"  valid nPrecoProdutoB > 0
      read

      if LastKey() == 27
         nAlerta:= alert('terminar compra', {'cancelar','finalizar'})
         if nAlerta = 1
            loop
         elseif nAlerta = 2
            exit
         endif
      endif

      nTotal+= (nProdutoQB*nPrecoProdutoB)
      @ 09,01 say "Total:" +   Transform(nTotal,"@e 9999.99")
      if nSaldo > nTotal
         cCor2 := "g/n"
      elseif nSaldo < nTotal
         cCor2 := "r/n"
      endif
      @ 09,20 say 'Saldo: RS' +Transform(nSaldo-nTotal,"@e 99999.99") color cCor2
      @ 07,51 say 'RS' +       Transform(nProdutoQB*nPrecoProdutoB, "@e 999.99")


      //Produto C
      @ 08,06 get cProdutoC      Picture "@!"      valid !Empty(cProdutoC)
      @ 08,27 get nProdutoQC     Picture "999"     valid nProdutoQC > 0
      @ 08,42 get nPrecoProdutoC Picture "999.99"  valid nPrecoProdutoC > 0
      read 

      if LastKey() == 27
         nAlerta:= alert('terminar compra', {'cancelar','finalizar',})
         if nAlerta = 1
            loop
         elseif nAlerta = 2
            exit
         endif
      endif

      nTotal+= (nProdutoQC*nPrecoProdutoC)
      @ 09,01 say "Total:" +   Transform(nTotal,"@e 9999.99")
      if nSaldo > nTotal
         cCor3:="g/n"
      elseif nSaldo < nTotal
         cCor3:="r/n"
      endif
      @ 09,20 say 'Saldo: RS' +Transform(nSaldo-nTotal,"@e 99999.99") color cCor3
      @08,51 say 'RS' +        Transform(nProdutoQC*nPrecoProdutoC, "@e 999.99")

      @ 06,01 say AllTrim(Str(nNumero++))
      @ 07,01 say AllTrim(Str(nNumero++))
      @ 08,01 say AllTrim(Str(nNumero++))
   end do   
   //cupom
   if LastKey() == 27
      nAlerta1:= alert('deseja sair?', {'sim','nao'})
      if nAlerta1 = 1
         exit
      endif
   endif
clear

   @ 11,01 say "TOTAL: RS" + Transform(nTotal, "@e 9999.99")
   inkey(0)
end do





