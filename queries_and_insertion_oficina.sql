use oficina;
insert into clients (CPF, complete_name, Address, Payment) 
	values	('22461908562','Maria Conceição', 'Rua Olavo Biubiu, São Paulo - SP', 'Dinheiro'),
			('52746283648','Cristiano Ronaldo','Rua Cisto Redentor, Copacabana - RJ','Crédito'),
			('64980919987','Lionel Jr','Rua 30 de Fevereiro, Campinas - SP','Boleto'),
            ('28593649749','Ronaldinho Ceará','Rua Vera Verão, Alagoasm- SP','Débito');
            
insert into oficina_mecânica (CNPJ, Nome)
	values	('462789564730000', 'Oficina do Marcão');
    
insert into mecânico (Nome, Codigo, Especialidade)
	values	('José Azevedo','36729265739','Esp1'),
			('Mario Bezerra','74974928917','Esp2'),
            ('Joanna Alciedes','47285739302','Esp3'),
            ('Cassio Donesi','46773029875','Esp4');
		
insert into peça (valor)
	values	('250.00'),
			('1178.00'),
            ('455.00'),
            ('78.50'),
            ('99.90'),
            ('890.50');
            
insert into ordem_de_serviço (Número, Data_de_emissão, status_serviço, Data_conclusão)
	values	('77489837','2015-08-07','Concluído','2015-08-14'),
			('18903920','2015-04-03','Em processamento',null),
            ('09354749','2016-02-20','Concluído','2016-03-01'),
            ('43834932','2016-03-10','Em processamento',null),
            ('91842872','2015-09-09','Concluído',null);
            
update ordem_de_serviço set Data_conclusão = '2015-09-29' where Número = '91842872';
            
insert into serviço (tabela_de_referencia,valor,idPeça,idOrdem)
	values	('Esp1','1550.90','1','1'),
			('Esp2','1800.00','1','2'),
            ('Esp3','890.99','2','3'),
            ('Esp4','1700.00','3','4'),
            ('Esp2','1949.90','6','5');
            
insert into veículo (Register,idClient,idServiço)
	values	('44A5K7','1','1'),
			('89C7S2','2','2'),
            ('99L3I6','3','3'),
            ('81N8L6','4','4');
            
insert into equipe_mecânica (idMecânico_equipe,idOficina_equipe,idServiço_equipe)
	values	('1','1','1'),
			('2','1','2'),
            ('3','1','3'),
            ('4','1','4'),
            ('2','1','5');
            
select * from clients;

-- Quais clientes fizeram serviço e qual foi o preço, excluindo o primeiro
select complete_name, CPF, tabela_de_referencia, valor from Clients as c
		inner join veículo as v on c.idClient = v.idVeículo
		inner join serviço as s on v.idVeículo = s.idServiço
        group by c.idClient
        having c.idClient >= 2;