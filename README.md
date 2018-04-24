# Desafio

Construir	uma	aplicação,	disponibilizando	um	endpoint	REST	que	receba	um	parâmetro	(do	tipo	texto).		

A	aplicação	deverá	contar	o	número	de	ocorrências	do	parâmetro	recebido	nos	arquivos	de	amostras	enviados	juntos.	O	retorno	deve	ser	o	número	de	ocorrências	do	termo	nos	arquivos	e	o	tempo	total	gasto	na	pesquisa.		

## Pré	requisitos:

  1.	A	solução	deve	utilizar	Docker;
  2.	A	solução	deve	ser	escalável;
  3.	A	arquitetura	e	tecnologias	são	livres,	de	escolha	do	candidato.

## Solução:		

  +	Explique	o	porquê	do	modelo	de	arquitetura	e	tecnologias	adotadas;

O modelo de arquitetura selecionado foi o MVC (Model-Controller-View), pois trata-se de uma padrão de projeto amplamente utilizado, que muito embora apresente uma camada monolitica de aplicação, por tratar-se do desenvolvimento de uma API, possui alto poder de integração com outras arquiteruras, em especial SOA.

  As tecnologias utilizadas foram:
      - Docker: Pré Requisito.
      - Ruby on Rails: Framework de desenvolvimento WEB, que por padrão fornece uma API RESTfull.
      - Elasticsearch Servidor de Buscas Distribuído.
      - gem rspec-rails: BDD para Rails.
      - gem searchkick: Fornece uma busca inteligente, integrando Rails e Elasticsearch.
  Acesse para maiores informações de [searchkick](https://github.com/ankane/searchkick).

  + Como	a	solução	poderia	ser	escalada	(o	que	se	espera	da	sua	solução	se	tiver	1	  milhão	de	arquivos);

A solução está pronta para escalonamento, do ponto de vista da API, uma solução apropriada seria gerenciar o número de threads do app server, a fim de possibilitar um maior número de pesquisas assíncronas. Do ponto de vista do servidor de dados, seria necessário estudar novas estratégias de indexação e clusterização de dados.

  +	Como	seria	o	procedimento	de	build,	deploy,	etc.

O processo de setup do Docker foi baseado na documentação do mesmo, para maiores detalhes: [Docker.docs - Quickstart: Compose and Rails](https://docs.docker.com/compose/rails/).

Após `docker-compose up` verifique o `publish_adress` IP disponibilizado pelo serviço do elasticsearch, o default definido nesse projeto é `http://172.18.0.4:9200`, se por acaso o IP disponibilizado for diferente, altere o arquivo `config/initiliazers/elasticsearch.rb`.

Para criar a base de dados: `docker-compose run web bundle exec rake db:create`.

Para gerar a tabela `article`: `docker-compose run web bundle exec rake db:migrate`.

Para popular a base de dados: `docker-compose run web bundle exec rake db:seed`. Para maiores informações acesse o arquivo: `db/seeds.rb`.

Antes de rodar os testes, prepare a base de dados: `docker-compose run web bundle exec rake db:test:prepare`.

Rode os testes: `docker-compose run web bundle exec rspec spec/.`

Acesse a API em: `localhost:3001`. Se forem seguidos todos os passos anteriores, será aberta a página com todos a lista de todos os `articles` equivalente à: `articles#index` ou `localhost:3001/articles.json`

As buscas são baseadas em query string, através do parâmetro `keyword`. Para realizar uma busca, basta acessar: `localhost:3001/searchs?keyword=parametro`.

Por exemplo: `localhost:3001/searchs?keyword=Elizabteh`. Retornará um 'hash' com todas as ocorrências da busca, sendo `results['took']` a key que informa o tempo total da pesquisa em milissegundos e `hits['total']` a key que informa a quantidade total de ocorrências da busca.
