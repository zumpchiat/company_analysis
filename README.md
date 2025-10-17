# company_analysis
Projeto de análise, transformação e visualização de dados com a
criação de um dashboard corporativo utilizando MySQL como banco de dados e Power BI


### Screenshot
<img width="893" height="499" alt="image" src="https://github.com/user-attachments/assets/0e06e20b-3fe7-4012-9767-65923f39a12a" />



## Descrição do desafio de projeto

    1. Criação de uma instância na Azure para MySQL
    	Processo feito em BD local por limitações
    	
    2. Criar o Banco de dados com base disponível no github
    	Processo realizado com script SQl **companyDB_mysql**
    	
    3. Integração do Power BI com MySQL no Azure
    	Realizado diferente teste com AWS, Neon DB e Azure
    	
    4. Verificar problemas na base a fim de realizar a transformação dos dados
    	Feito, A coluna address da tabela employee foi dividida utilizando o caractere "-" como delimitador.
    
## Diretrizes para transformação dos dados 

- Verifique os cabeçalhos e tipos de dados
    	Feito, dados foram verificados e ajustados.
    	
-  Modifique os valores monetários para o tipo double preciso
    	Feito, Alterar tipo >> Número decimal fixo
    
- Verifique a existência dos nulos e analise a remoção
    	Realizado, removida a seleção da opção null
    
 - Os employees com nulos em Super_ssn podem ser os gerentes. Verifique se há algum colaborador sem gerente
    	sim, funcionário James Borg é gerente do departamento Headquarters
    	
 -   Verifique se há algum departamento sem gerente
    	Não, possui departamento sem gerente na base de dados.
    	
 -   Se houver departamento sem gerente, suponha que você possui os dados e preencha as lacunas
    
-   Verifique o número de horas dos projetos
    Foi criada uma mesclagem entre as tabelas project, work_on e employee apresentar os nomes dos funcionários, nome dos projetos e horas trabalhadas 
     
       <img width="1033" height="247" alt="image" src="https://github.com/user-attachments/assets/3b0fbd57-d56f-4aa4-8ad6-5a921408ee8e" />

    
-  Separar colunas complexas
  Foi separada a coluna address 
    	
 
  <img width="166" height="223" alt="image" src="https://github.com/user-attachments/assets/85d468c0-b7d0-4493-94c9-161332b99fb4" />

  
 <img width="165" height="200" alt="image" src="https://github.com/user-attachments/assets/3f32a5be-e7c7-45d2-a53f-a8fb63b67791" />

    	
-  Mesclar consultas employee e departament para criar uma tabela employee com o nome dos departamentos associados aos colaboradores. A mescla terá como base a tabela employee. Fique atento, essa informação influencia no tipo de junção
    	Foi criada a mesclagem employee_departament 
    	
<img width="672" height="144" alt="image" src="https://github.com/user-attachments/assets/96605ca8-f34c-4306-94fe-8d0852f8b391" />


    	
    10. Neste processo elimine as colunas desnecessárias. 
    	Realizado o processo e a mesclagem ficou com 2 campos nome do funcionário e departamento.
    	
<img width="355" height="140" alt="image" src="https://github.com/user-attachments/assets/fa483f2f-ee90-4838-8d8b-e3c25e804261" />

    	
    11. Realize a junção dos colaboradores e respectivos nomes dos gerente.Isso pode ser feito
    com consulta SQL ou pela mescla de tabelas com Power BI.
    
    Criada a consulta employee_Manager via power BI
    	
 <img width="516" height="208" alt="image" src="https://github.com/user-attachments/assets/f74bcbd3-b182-4910-a9e6-5aabda0ac0d3" />

    
    12. Mescle as colunas de Nome e Sobrenome para ter apenas uma coluna definindo os nomes dos colaboradores
    
    Realizada a mesclagem dos Fname e Lname
<img width="516" height="208" alt="image" src="https://github.com/user-attachments/assets/28d97c24-9dfa-4de4-8612-6a5d9a24cbf4" />

    
    13. Mescle os nomes de departamentos e localização. Isso fará que cada combinação departamento-local seja único. Isso irá auxiliar na criação do modelo estrela em um módulo futuro.
    	Foi realizada a Mesclagem para uma tabela departament_location
    	
<img width="518" height="136" alt="image" src="https://github.com/user-attachments/assets/ba507e02-3e43-468a-b59f-24b3ffe5a08b" />

    
    14. Explique por que, neste caso supracitado, podemos apenas utilizar o mesclar e não o atribuir. 
        Foi utilizada a opção "Mesclar Consultas" ao invés de "Acrescentar Consultas", pois existe uma coluna em comum (Dnumber) que permite combinar as duas tabelas de forma relacional.

    15. Agrupe os dados a fim de saber quantos colaboradores existem por gerente
    	Selecionado as duas colunas e agrupado em uma nova coluna chamada contagem

<img width="495" height="208" alt="image" src="https://github.com/user-attachments/assets/85b6983e-fefb-46a1-8f33-d6b0f1e3695b" />

    
    16. Elimine as colunas desnecessárias, que não serão usadas no relatório, de cada tabela
    
    	Feito
