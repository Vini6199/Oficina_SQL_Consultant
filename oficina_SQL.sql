create database if not exists oficina;
use oficina;

create table if not exists clients (
	idClient int auto_increment primary key,
    CPF char(11) unique not null,
    Complete_name varchar(55) not null,
    Address varchar(255),
    Payment enum('Boleto','Débito','Crédito','Dinheiro')
);

create table if not exists oficina_mecânica (
	idOficina int auto_increment primary key,
    CNPJ char(15) unique not null,
    Nome varchar(255)
);

create table if not exists mecânico (
	idMecânico int auto_increment primary key,
	Nome varchar(255),
    Codigo char(11),
    Especialidade enum('Esp1','Esp2','Esp3','Esp4')
);

create table if not exists serviço (
	idServiço int auto_increment primary key,
    tabela_de_referencia enum('Esp1','Esp2','Esp3','Esp4'),
    valor int,
    idPeça int,
    idOrdem int,
    constraint fk_serviço_peça foreign key (idPeça) references peça(idPeça),
    constraint fk_serviço_ordem foreign key (idOrdem) references ordem_de_serviço(idOrdem)
);

create table if not exists equipe_mecânica (
	idEquipeMecânica int auto_increment primary key,	
	idMecânico_equipe int,
    idOficina_equipe int,
    idServiço_equipe int,
    constraint fk_Mecânico_equipe foreign key (idMecânico_equipe) references mecânico(idMecânico),
    constraint fk_Oficina_equipe foreign key (idOficina_equipe) references oficina_mecânica(idOficina),
    constraint fk_Serviço_equipe foreign key (idServiço_equipe) references serviço(idServiço)
);

create table if not exists veículo (
	idVeículo int auto_increment primary key,
    Register varchar(45) not null,
    idClient int,
    idServiço int,
    constraint fk_idClient_veículo foreign key (idClient) references clients(idClient),
    constraint fk_idServiço_veículo foreign key (idServiço) references serviço(idServiço)
);

create table if not exists peça (
	idPeça int auto_increment primary key,
    valor int
);

create table if not exists ordem_de_serviço (
	idOrdem int auto_increment primary key,
    Número int,
    Data_de_emissão date,
    status_serviço enum('Em processamento', 'Concluído'),
    Data_conclusão date
);


show tables;
