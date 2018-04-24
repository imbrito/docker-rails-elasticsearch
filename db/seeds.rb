# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

articles_list = [
  ['The Black List', 'Raymond Reddington, um dos criminosos mais procurados pelo FBI, entrega-se às autoridades. Promete entregar diversos criminosos e terroristas desde que trate somente com Elizabeth Keen, uma funcionária novata do FBI. Aparentemente não há ligação entre eles e ele também não revela o motivo dessa preferência' ],
  ['The Big Bang Theory', 'The Big Bang Theory (Big Bang: A Teoria (título no Brasil) ou A Teoria do Big Bang (título em Portugal)), frequentemente abreviada como "TBBT", é uma série de televisão norte-americana de comédia de situação criada por Chuck Lorre e Bill Prady, que estreou no canal CBS em 22 de setembro de 2007'],
  ['Orphan Black', 'Orphan Black é uma série de televisão canadense de ficção científica, criada por Graeme Manson e John Fawcett, estrelada por Tatiana Maslany como várias pessoas idênticas que são clones. A série centra-se em Sarah Manning, uma mulher que assume a identidade de outro clone, Elizabeth Childs, depois de testemunhar o suicídio da mesma. A série levanta questões sobre as implicações morais e éticas da clonagem humana e seus efeitos sobre questões de identidade pessoal'],
  ['Luke Cage', 'Luke Cage, anteriormente conhecido como Poderoso (no original Powerman), é um super-herói de histórias em quadrinhos da Marvel Comics. Nascido nas ruas do Harlem, ex-membro de gangue, foi preso por um crime que não cometeu. Voluntário em uma experiência científica, foi vítima de sabotagem de um carcereiro. Acabou ganhando superforça e pele invulnerável. Fora da cadeia, passou a trabalhar por dinheiro, geralmente como guarda-costas, e participou de aventuras ao lado de vários outros heróis, principalmente Demolidor e Punho de Ferro. A série foi cancelada no final dos anos 1980 e ele passou a ser usado apenas como coadjuvante em HQs de outros personagens. No ano 2001, estreou nova série, agora pelo selo Marvel MAX. Também foi personagem regular da série The Pulse que, assim como Alias, foi estrelada por sua atual esposa, Jessica Jones'],
  ['Agent Carter', 'Marvels Agent Carter ou simplesmente Agent Carter, foi uma série de televisão americana criada por Christopher Markus e Stephen McFeely, transmitida pela ABC. A série se passa depois dos eventos vistos em Capitão América: O Primeiro Vingador, acompanhando Peggy Carter conforme ela lida com o desaparecimento de Steve Rogers e o novo emprego na RCE (Reserva Científica e Estratégica)']
]

articles_list.each do |title, content|
  Article.create( title: title, content: content )
end
