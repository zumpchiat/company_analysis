# company_analysis
Projeto de análise e visualização de dados.


Descrição do desafio de projeto
    1. Criação de uma instância na Azure para MySQL
    	Processo feito em BD local por limitações
    	
    2. Criar o Banco de dados com base disponível no github
    	Processo realizado com script SQl ======
    	
    3. Integração do Power BI com MySQL no Azure
    	Realizado diferente teste com AWS, Neon DB e Azure
    	
    4. Verificar problemas na base a fim de realizar a transformação dos dados
    	Feito, A coluna address da tabela employee foi dividida utilizando o caractere "-" como delimitador.
    
    
Diretrizes para transformação dos dados
    1. Verifique os cabeçalhos e tipos de dados
    	Feito, dados foram verificados e ajustados.
    	
    2. Modifique os valores monetários para o tipo double preciso
    	Feito, Alterar tipo >> Número decimal fixo
    
    3. Verifique a existência dos nulos e analise a remoção
    	Realizado, removida a seleção da opção null
    
    4. Os employees com nulos em Super_ssn podem ser os gerentes. Verifique se há algum colaborador sem gerente
    	sim, funcionário James Borg é gerente do departamento Headquarters
    	
    5. Verifique se há algum departamento sem gerente
    	Não, possui departamento sem gerente na base de dados.
    	
    6. Se houver departamento sem gerente, suponha que você possui os dados e preencha as lacunas
    
    7. Verifique o número de horas dos projetos
    	Foi criada uma mesclagem entre as tabelas project, work_on e employee apresentar os nomes dos funcionários, nome dos projetos e horas trabalhadas     
    
    8. Separar colunas complexas
    	Foi separada a coluna address 
    	
    	foto antes 
    	
    	foto depois 
    	
    9. Mesclar consultas employee e departament para criar uma tabela employee com o nome dos departamentos associados aos colaboradores. A mescla terá como base a tabela employee. Fique atento, essa informação influencia no tipo de junção
    	Foi criada a mesclagem employee_departament 
    	
    	foto
    	
    10. Neste processo elimine as colunas desnecessárias. 
    	Realizado o processo e a mesclagem ficou com 2 campos nome do funcionário e departamento.
    	
    	foto
    	
    11. Realize a junção dos colaboradores e respectivos nomes dos gerente . Isso pode ser feito com consulta SQL ou pela mescla de tabelas com Power BI. 
    	Criada a consulta employee_Manager via power BI
    	
    	foto
    
    12. Mescle as colunas de Nome e Sobrenome para ter apenas uma coluna definindo os nomes dos colaboradores
    
    	Realizada a mesclagem dos Fname e Lname
    
    13. Mescle os nomes de departamentos e localização. Isso fará que cada combinação departamento-local seja único. Isso irá auxiliar na criação do modelo estrela em um módulo futuro.
    	Foi realizada a Mesclagem para uma tabela departament_location
    	
    	Foto
    
    14. Explique por que, neste caso supracitado, podemos apenas utilizar o mesclar e não o atribuir. 
        Foi utilizada a opção "Mesclar Consultas" ao invés de "Acrescentar Consultas", pois existe uma coluna em comum (Dnumber) que permite combinar as duas tabelas de forma relacional.

    15. Agrupe os dados a fim de saber quantos colaboradores existem por gerente
    	Selecionado as duas colunas e agrupado em uma nova coluna chamada contagem
    	
    	foto
    
    16. Elimine as colunas desnecessárias, que não serão usadas no relatório, de cada tabela
    
    	Feito
