- Projeto Dashboard de Vendas

Projeto de conclusão de curso desenvolvido para análise de dados de vendas utilizando Power BI.

- Objetivo

Desenvolver um dashboard interativo para análise do desempenho comercial,
permitindo visualizar informações de vendas de forma clara e facilitar a tomada de decisões.

- Tecnologias utilizadas

- Power BI Desktop
- SQL
- GitHub

- Modelo de dados

O projeto utiliza um modelo composto pelas seguintes tabelas:

- Clientes
- Vendas
- Itens de Venda
- Produtos
- Categorias

- Relacionamentos

- Clientes → Vendas
- Vendas → Itens de Venda
- Categorias → Produtos
- Produtos → Itens de Venda

- Funcionalidades - AC1

Nesta primeira entrega foi desenvolvido um dashboard contendo:

- Indicador de faturamento total
- Quantidade de vendas
- Ticket médio
- Faturamento por categoria
- Evolução do faturamento
- Top 5 produtos por faturamento
- Faturamento por forma de pagamento

- Dashboard

O dashboard foi desenvolvido no Power BI com o objetivo de apresentar uma visão geral do desempenho das vendas.

- Estrutura do projeto

```text
projeto-dashboard-vendas/
├── README.md
├── sql/
│   └── script_banco.sql
├── powerbi/
│   └── dashboard_vendas.pbix
└── docs/
    └── imagens/
