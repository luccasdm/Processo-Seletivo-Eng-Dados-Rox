# Processo Seletivo para Engenheiro de Dados - RoxPartner
Projeto criado para participação do processo seletivo.

## Modelagem Conceitual de Dados
A modelagem conceitual de dados encontra-se no arquivo "modelo-conceitual.jpg" e também conforme abaixo:

<div align="center">
<img src="https://user-images.githubusercontent.com/38978227/160310329-1340f66f-0c0f-48f5-b44d-481a5ecc3665.jpg">
</div>

## Infraestrutura Necessária para Ingestão dos Dados
O fluxograma do processo criado para o projeto estão no arquivo "infra-necessaria.jpg" e também conforme abaixo:

<div align="center">
<img src="https://user-images.githubusercontent.com/38978227/160310329-1340f66f-0c0f-48f5-b44d-481a5ecc3665.jpg">
</div>

## Sobre a escolha da arquitetura e plataforma de cloud
  Levando em consideração o documento inicial que foi passado existiam inúmeras possibilidades de resolver esse problema. Algumas mais simples e menos automatizadas, outras totalmente automatizadas, porém muito mais complexas.
  <br /> Optei pela utilização da Google Cloud Plataform (GCP), pois é a que considero de usabilidade mais fácil, o que foi muito útil, tendo em vista o prazo de entrega do projeto.
  <br /> Nela utilizei 3 recursos, sendo eles:
  <br /> 1 - Cloud Storage
  <br /> 2 - Cloud Functions
  <br /> 3 - BigQuery

<br /> No Cloud Storage criei um bucket para o armazenamento do arquivo CSV original.
<br /> No BigQuery criei um conjunto de dados que será responsável por armazenar e consultar os dados contidos nos arquivos CSV.
<br /> No Cloud Functions criei uma função que tem como gatilho qualquer inclusão ou alteração de arquivo no bucket criado anteriormente. Essa função é responsável por ler os dados do arquivo adicionado/alterado, trata-los e inseri-los no conjunto de dados do BigQuery.
Uma vez que os dados estavam tratados e inseridos, criei querys que realizam as consultas pedidas no documento inicial do projeto.

## Observações finais
O projeto AINDA não se encontra no seu melhor estado de performance. É possível automatizar o upload dos arquivos CSV para o bucket também por meio de uma segunda Cloud Function. <br />
A função responsável pelo tratamento e armazenamento dos dados também não está em sua melhor forma, uma vez que caso fosse utilizado a biblioteca "Pandas" seria possível normalizar de forma mais eficaz os dados. (Tentei utiliza-la, porém encontrei alguns obstáculos no caminho e devido ao tempo de entrega, resolvi abandona-la) 
<br />
Também é possível automatizar a saída de dados e a geração de relatórios utilizando outras funcionalidades presentes na GCP e no PowerBI.
<br />
<br />
Independente do resultado do processo gostei muito de realizar esse projeto, pois ele se mostrou mais desafiador do que eu esperava, provando que ainda há muito o que evoluir da minha parte. E ao mesmo tempo saio relativamente satisfeito com o resultado alcançado (sempre da pra melhorar, né?!).
<br />
Creio que com uma equipe qualificada e algumas dicas eu possa acrescentar muito ao time da Rox.
<br />
<br />
Agradeço a oportunidade.
<br />
Guilherme Tamanini
