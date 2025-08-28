CREATE SCHEMA empresa;
USE empresa;


CREATE TABLE funcionarios(
id int primary key auto_increment,
nome varchar(100) not null,
cargo varchar(50),
salario decimal(10,2),
departamento varchar(50),
data_contratacao date
);


CREATE TABLE departamentos(
id int primary key auto_increment,
nome varchar(100),
localizacao varchar(100)
);

INSERT INTO funcionarios(nome,cargo,salario,departamento,data_contratacao)VALUES
('João Silva','Desenvolvedor','5000.00','TI','2020-01-15'),
('Juca Silva','Analista','4500.00','RH','2019-03-20'),
('Pedro Costa','Gerente','8000.00','TI','2018-06-10'),
('Ana Oliveira','Desenvolvedor','5500.00','TI','2021-02-18'),
('Carlos Pererira','Contador','4800.00','Financeiro','2020-11-05');
INSERT INTO departamentos(nome,localizacao)VALUES
('TI', 'Andar 1'),
('RH', 'Andar 2'),
('Financeiro', 'Andar 3');
-- ====================================================================================================
/*
CREATE VIEW	view_funcionarios_ti AS
SELECT nome, cargo, salario
FROM funcionarios
WHERE departamento = 'TI';
SELECT * FROM view_funcionarios_ti;
*/
/*
ALTER VIEW view_funcionarios_ti AS
SELECT nome,cargo,salario,
DATE_FORMAT(data_contratacao, '%d/%m/%y') AS data_contratacao_formatada
FROM funcionarios
WHERE departamento = 'TI';
SELECT * FROM view_funcionarios_ti;
*/
/*
CREATE VIEW view_funcionarios_departamento AS
SELECT f.nome,f.cargo,f.salario,
	d.nome AS dep,d.localizacao
FROM funcionarios AS f
INNER JOIN departamentos AS d
ON f.departamento = d.nome;
SELECT * FROM view_funcionarios_departamento;
*/

CREATE VIEW view_estatistica_dep AS
SELECT departamento, 
	COUNT(*) AS TotalFuncionarios,
    AVG(salario) AS SalarioMedio,
    MAX(salario) AS MaiorSalario,
    MIN(salario) AS MenorSalario,
    SUM(salario) AS FolhaSalarial
FROM funcionarios GROUP BY departamento;
SELECT * FROM view_estatistica_dep;
