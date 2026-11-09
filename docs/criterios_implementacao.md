# Critérios e implementação — Issues AC2

Este documento converte os títulos das issues 9–14 em critérios verificáveis e registra o que está presente na versão atual do relatório. A página original do Power BI foi preservada. Os itens abaixo descrevem o artefato salvo; os critérios da issue devem ser fechados após validar as interações e requisitos completos.

## Issue 9 — Filtro e Segmentação de Dados

**Critério:** permitir recortes por cliente, período, cidade/estado, categoria e forma de pagamento, atualizando os indicadores relacionados.

**Implementado no PBIX:** segmentações por cliente, categoria e período na página **Análises PostgreSQL**. O gráfico de faturamento por cidade também pode ser selecionado para filtrar os outros visuais.

**Pendente:** adicionar segmentações específicas de cidade/estado e forma de pagamento e testar que cada seleção atualiza os visuais esperados. A interação do filtro de período não foi validada nesta entrega.

## Issue 10 — Análise Detalhada de Clientes

**Critério:** comparar clientes por faturamento, pedidos, itens comprados e recência.

**Implementado no PBIX:** tabela de clientes por faturamento e indicador de clientes ativos. A view `public.vw_resumo_cliente`, criada por `sql/apoio_analise_postgresql.sql`, acrescenta pedidos distintos, itens, ticket médio e última compra por cliente para análises futuras.

**Pendente:** incorporar os campos adicionais da view à tabela, ordenar/rankear clientes, mostrar Top 10 e validar recência dentro do intervalo da base.

## Issue 11 — Novos Indicadores de Desempenho

**Critério:** disponibilizar faturamento, pedidos distintos, ticket médio, itens vendidos e clientes ativos.

**Implementado no PBIX:** cartões de faturamento, ticket médio, itens vendidos e clientes ativos. Medidas DAX:

```DAX
Faturamento PostgreSQL = SUM('public vw_vendas_powerbi'[subtotal])
Vendas PostgreSQL = DISTINCTCOUNT('public vw_vendas_powerbi'[venda_id])
Ticket Médio PostgreSQL = DIVIDE([Faturamento PostgreSQL], [Vendas PostgreSQL])
Itens Vendidos PostgreSQL = SUM('public vw_vendas_powerbi'[quantidade])
Clientes Ativos PostgreSQL = DISTINCTCOUNT('public vw_vendas_powerbi'[cliente_id])
```

**Pendente:** adicionar um cartão visível de pedidos distintos e conferir a formatação monetária do ticket médio (R$ 3.484,90 na base atual).

## Issue 12 — Implementação do SQL

**Critério:** consolidar as tabelas relacionais em uma fonte de consumo de BI, com granularidade explícita.

**Implementado:** `sql/carga_dashboard_vendas.sql` carrega as tabelas e cria `vw_vendas_powerbi` na granularidade de item da venda. A receita deve ser calculada por `SUM(subtotal)`; não some o valor total do pedido repetido em cada item. `sql/apoio_analise_postgresql.sql` cria as views `vw_resumo_cliente` e `vw_vendas_mensais` e uma consulta de conferência.

**Atenção:** o script de carga contém `TRUNCATE ... RESTART IDENTITY CASCADE` e substitui os dados das tabelas de destino. Use somente em ambiente de demonstração ou após backup.

## Issue 13 — Conexão de SQL com Power BI

**Critério:** conectar o Power BI ao PostgreSQL e carregar a view sem armazenar credenciais no repositório.

**Implementado:** o PBIX contém a tabela importada `public vw_vendas_powerbi`; a conexão local utilizada foi `localhost:5432`, banco `dashboard_vendas`, modo Importar. Senhas não devem ser incluídas no PBIX compartilhado ou nos scripts; configure-as pelo gerenciador de credenciais do Power BI.

## Issue 14 — Atualização do Dashboard utilizando Banco de Dados

**Critério:** apresentar visuais baseados no PostgreSQL, mantendo a página existente e conciliando os totais.

**Implementado no PBIX:** página **Análises PostgreSQL**, com indicadores de faturamento, ticket médio, itens vendidos e clientes ativos, faturamento por cidade, tabela de clientes e segmentações. A página 1 foi preservada. O conjunto importado registrou R$ 243.942,90 em faturamento, 70 pedidos, 285 itens e 15 clientes.

**Observação de reconciliação:** alguns visuais da página antiga mostram cerca de R$ 2,44 milhões; esse valor diverge da nova fonte consolidada e não deve ser comparado como se viesse do mesmo cálculo. Revisar a medida da página antiga em trabalho futuro.

## Limites da base

A amostra cobre janeiro a setembro de 2026 e contém 70 pedidos e 15 clientes. Ela permite explorar os registros existentes, mas não sustenta conclusões sobre crescimento anual, sazonalidade de ano inteiro, retenção de coortes, inadimplência ou margem/lucro (não há custo).
