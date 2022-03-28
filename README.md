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
<img src="https://user-images.githubusercontent.com/38978227/160310641-af1b030f-95d0-4260-aac7-ff1e19e3209b.jpg">
</div>

## Escolha da Arquitetura e Cloud GCP
Optei pela utilização da Google Cloud Plataform (GCP), pois é a que tive mair contato e a que considero mais usual, o que foi muito útil, tendo em vista o prazo.
  <br /> Foram utilizados 3 recursos principais, sendo eles:
  <br /> 1 - Cloud Storage : Foi criado um bucket para o armazenamento dos arquivos CSV;
  <br /> 2 - Cloud Functions : Criado uma função que tem como gatilho qualquer inclusão ou alteração de arquivo no bucket criado anteriormente. Essa função é responsável por ler os dados do arquivo adicionado/alterado, trata-los e inseri-los no conjunto de dados do BigQuery.
  <br /> 3 - BigQuery : Criado um conjunto de dados que será responsável por armazenar e consultar os dados contidos nos arquivos CSV.

