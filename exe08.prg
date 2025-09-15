set scoreboard off
set epoch to 1940
set date british
clear

nLinha        := 1
cProdutoNomeA := Space(10)
cProdutoNomeB := Space(10)
cProdutoNomeC := Space(10)
nTotalA       := 0
nTotalB       := 0
nTotalC       := 0
nProdutoB     := 5.25
nProdutoC     := 20.00
nProdutoA     := 10.00
nQuantidadeA  := 0
nQuantidadeB  := 0
nQuantidadeC  := 0
cNomeCliente  :=space(28)
nDesconto     :=0
dVenda        :=Date()
dNascimento   :=CToD("")//data em branco
dEntrega      :=CToD("")
cEndereco     :=space(30)
nTaxaEntrega  :=6

@ nLinha++,01 say "Nome:"
@ nLinha++,01 say "Data de nascimento:"
@ nLinha++,01 say "Endere‡o:"
@ nLinha++,01 say "Porcentagem de desconto: "
@ nLinha++,01 say "Data de entrega:"

nLinha        :=1
@ nLinha++,25 get cNomeCliente     picture "@!"        valid !empty(cNomeCliente)
@ nLinha++,25 get dNascimento                          valid !Empty(dNascimento)
@ nLinha++,25 get cEndereco        picture "@!"        valid !empty(cEndereco)
@ nLinha++,25 get nDesconto        picture "999%"      valid nDesconto>=0
@ nLinha++,25 get dEntrega         picture "@!"        valid dEntrega >= dVenda+5 .and. !empty(dEntrega)
read

clear
@ 01,01       say "PRODUTO   |PRE€O  |QTD   |TOTAL"
@ 02,01       say "          |       |      |"
@ 03,01       say "          |       |      |"
@ 04,01       say "          |       |      |"
@ 02,12       say nProdutoA        picture "@E R$99.99"
@ 03,12       say nProdutoB        picture "@E R$99.99"
@ 04,12       say nProdutoC        picture "@E R$99.99"
@ 05,00 to 07,38 double
@ 00,00 to 07,38 Double

//produto A--------------------------------------------------------------------
@ 02,01       get cProdutoNomeA    picture "@!"        valid !empty(cProdutoNomeA)
@ 02,20       get nQuantidadeA     picture "@E 999.99" valid nQuantidadeA >=0
read

nTotalA       := nQuantidadeA * nProdutoA
nTotal        := nTotalA + nTotalB + nTotalC

@ 02,27       say nTotalA          picture "@E R$9,999.99"
@ 06,27       say nTotal           picture "@E R$9,999.99"

//Produto B--------------------------------------------------------------------
@ 03,01       get cProdutoNomeB    picture "@!"        valid !empty(cProdutoNomeB)
@ 03,20       get nQuantidadeB     picture "@E 999.99" valid nQuantidadeB >=0
read

nTotalB       := nQuantidadeB * nProdutoB
nTotal        := nTotalA + nTotalB + nTotalC

@ 03,27       say nTotalB          picture "@E R$9,999.99"
@ 06,27       say nTotal           picture "@E R$9,999.99"

//Produto C--------------------------------------------------------------------
@ 04,01       get cProdutoNomeC    picture "@!"        valid !empty(cProdutoNomeC)
@ 04,20       get nQuantidadeC     picture "@E 999.99" valid nQuantidadeC >=0
read

nTotalC         := nQuantidadeC * nProdutoC
nTotal          := nTotalA + nTotalB + nTotalC
nTaxaEntrega    :=  (nTotal/100)*6
@ 04,27       say nTotalC          picture "@E R$9,999.99"
@ 06,27       say nTotal           picture "@E R$9,999.99"

Inkey(7)
nTotalDescontado:=( nTotal/100)*nDesconto

nLinha          :=01
nTotalCorrigido :=( nTotal-nTotalDescontado)+nTaxaEntrega
@ 00,00 clear to 09,70
@ 00,00       to 20,50
@ nLinha++,01 say "Obrigado pela preferencia!"
@ nLinha++,01 say cNomeCliente
@ nLinha,01   say "Total: "
@ nLinha++,11 say nTotal           picture "@E R$9,999.99"
@ nLinha,01   say "Taxa de entrega:  "
@ nLinha++,18 say nTaxaEntrega     picture "@E R$9,999.99"
@ nLinha,01   say "Desconto: "
@ nLinha++,11 say nTotalDescontado picture "@E R$9,999.99"
@ nLinha,01   say "Total com desconto e taxa:"
@ nLinha++,28 say nTotalCorrigido  picture "@E R$9,999.99"
@ nLinha++,01 say "Voce gastou com os produtos:"
@ nLinha++,01 say cProdutoNomeA
@ nLinha++,01 say cProdutoNomeB
@ nLinha++,01 say cProdutoNomeC
@ nLinha,18   say dVenda
@ nLinha++,01 say "Data de compra:"
@ nLinha,01   say "Data de entrega:"
@ nLinha++,18 say dEntrega
@ nLinha,01   say "Sera entregue no endere‡o:"
@ nLinha++,27 say cEndereco
inkey(0)

