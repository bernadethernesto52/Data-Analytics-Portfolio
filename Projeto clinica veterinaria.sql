
--Questão 1 -Apresente todos os registos da tabela tb_animal. 

select *from tb_animal


--Questão 2 -Apresente apenas o nome, a data de nascimento, o peso e a altura dos animais. 

select nome, data_nascimento, peso, altura from tb_animal

--Questão 3  -Apresente os animais cujo peso seja superior a 10. 

select *from tb_animal where Peso > 10

--Questão 4 -Apresente os veterinários ordenados alfabeticamente pelo nome. 

select *from tb_veterinario ORDER BY Nome ASC

--Questão 5  -Apresente os clientes cuja localidade seja Barreiro. 

select *from tb_cliente where localidade = 'Barreiro'



--Questão 6 -Apresente as consultas realizadas a partir de 1 de janeiro de 2025, incluindo o número da consulta, a data, o custo e a descrição. 

select numero_consulta, data, custo, descricao from tb_consulta where data >= 2025-01-01

--Questão 7 -Apresente os animais cujo nome comece pela letra B. 
select *from tb_animal WHERE nome LIKE 'B%'

--Questão 8 Apresente as consultas por ordem decrescente de custo. 

select *from tb_consulta ORDER BY Custo DESC
 
--Questão 9 -Apresente o nome de cada animal, o nome do respetivo cliente e o contacto telefónico do cliente. 
--Os campos devem aparecer como, Nome do Animal, Nome do Cliente e Contacto, respetivamente. 

SELECT tb_animal.nome AS [Nome do Animal],tb_cliente.nome_cliente AS [Nome do Cliente],tb_cliente.Telefone AS Contacto
FROM tb_animal INNER JOIN tb_cliente ON tb_animal.numero_cliente = tb_cliente. nif


--Questão 10 -Apresente o nome do animal, a raça e o tipo de animal a que pertence. 
SELECT tb_animal.nome AS [Nome do Animal],tb_raca.Raca AS Raça,tb_tipo_animal.tipo_animal AS [Tipo de Animal]
FROM (tb_animal INNER JOIN tb_raca ON tb_animal.codigo_raca_animal = tb_raca.codigo_raca_animal) INNER JOIN tb_tipo_animal
ON tb_animal.codigo_raca_animal = tb_tipo_animal.codigo_tipo_animal 

--Questão 11 -Apresente o número da consulta, a data, o nome do animal e o nome do veterinário responsável. 

SELECT
    tb_consulta.numero_consulta AS [Número da Consulta], tb_consulta.data AS Data,
    tb_animal.nome AS [Nome do Animal],
    tb_veterinario.Nome AS [Nome do Veterinário]
FROM (tb_consulta
INNER JOIN tb_animal
ON tb_consulta.codigo_animal = tb_animal.codigo_raca_animal)
INNER JOIN tb_veterinario
ON tb_consulta.codigo_veterinario = tb_veterinario.codigo_veterinario

--Questão 12 -Determine o número total de animais registados na base de dados. 
select COUNT(*) AS [Total de Animais] from  tb_animal

--Questão 13 Determine o custo médio das consultas. 
SELECT AVG(Custo) AS [Custo Médio] FROM tb_consulta;

--Questão 14 -Apresente o número de consultas realizadas por cada veterinário, incluindo o -código e o nome do veterinário. Deve apresentar todos os veterinários. A clínica pretende registar os pagamentos efetuados pelos clientes
SELECT
    tb_veterinario.codigo_veterinario AS [Código do Veterinário],
    tb_veterinario.Nome AS [Nome do Veterinário],
    COUNT(tb_consulta.numero_consulta) AS [Número de Consultas]
FROM tb_veterinario
LEFT JOIN tb_consulta
ON tb_veterinario.codigo_veterinario = tb_consulta.codigo_veterinario
GROUP BY
    tb_veterinario.codigo_veterinario,
    tb_veterinario.nome;

 
--Questão 15 
--Crie uma tabela denominada tb_pagamento, com os seguintes campos: 
--Campo 
--numero_pagamento 
--data_pagamento 
--valor_pago 
--metodo_pagamento 
--numero_consulta 
--Tipo de dados 
--INT 
--DATE 
--DECIMAL(10,2) 
--NVARCHAR(30) 
--INT 
--Restrições 
--Chave primária 
--Obrigatório 
--Obrigatório 
--Obrigatório 
--Chave 
--estrangeira
--O campo numero_consulta deverá estabelecer uma relação com a tabela 
--tb_consulta. 
--O campo numero_pagamento será identity a iniciar em 1 e incremento de 1.
CREATE TABLE tb_pagamento (
    numero_pagamento INT IDENTITY(1,1) PRIMARY KEY,
    data_pagamento DATE NOT NULL,
    valor_pago DECIMAL(10,2) NOT NULL,
    metodo_pagamento NVARCHAR(30) NOT NULL,
    numero_consulta INT NOT NULL,
    FOREIGN KEY (numero_consulta)
        REFERENCES tb_consulta(numero_consulta)
);

--Questão 16 
--Insira na tabela tb_pagamento um registo com os seguintes dados: 
--Número da consulta: 1 
--Data do pagamento: 2025-02-15 
--Valor pago: 45,00 
--Método de pagamento: Multibanco 
--Valide se tem uma consulta com o número 1. Se não tiver substitua pelo 
--número da primeira consulta que tem.

INSERT INTO tb_pagamento
    (data_pagamento, valor_pago, metodo_pagamento, numero_consulta)
VALUES ('2025-02-15', 45.00, N'Multibanco', 1)


--Questão 17 Apresente todos os pagamentos cujo valor seja superior a 30 euros, ordenados por ordem decrescente do valor pago. 

SELECT *FROM tb_pagamento WHERE valor_pago > 30 ORDER BY valor_pago DESC
 

--Questão 18 -Atualize o número de telefone do cliente com o número 1 para 212345678. -Valide se tem um cliente com o número 1. Se não tiver substitua pelo número do primeiro cliente que tem. 
 
SELECT *FROM tb_cliente WHERE numero_cliente = 1
UPDATE tb_cliente
SET Telefone = '212345678'
WHERE numero_cliente = 1

--Questão 19 -Elimine da tabela tb_pagamento o pagamento com o número 1.
DELETE FROM tb_pagamento WHERE numero_pagamento = 1