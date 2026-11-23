# Projeto Dashboard de Vendas

Projeto acadêmico de análise de vendas com PostgreSQL e Power BI. O relatório combina indicadores e análises comerciais com uma camada PostgreSQL de dados relacionais e views para consumo no Power BI. A página original foi preservada e complementada por uma página de análises baseada no banco.

## Tecnologias

- PostgreSQL
- Power BI Desktop
- SQL e DAX
- GitHub

## Estrutura do repositório

```text
├── README.md
├── docs/
│   ├── criterios_implementacao.md
│   ├── diagramas_modelagem.md
│   ├── roteiro_apresentacao_final.md
│   └── entrega_final.md
├── dashboard_vendas.pbix
└── sql/
    ├── apoio_analise_postgresql.sql
    └── carga_dashboard_vendas.sql
```

## Banco de dados

O banco contém dados de vendas e uma visão consolidada `public.vw_vendas_powerbi`, usada pelo Power BI. O script `sql/carga_dashboard_vendas.sql` prepara a carga e a estrutura inicial do projeto. O script `sql/apoio_analise_postgresql.sql` cria visões agregadas de apoio, incluindo resumo de clientes e vendas mensais.

> **Atenção:** `sql/carga_dashboard_vendas.sql` apaga e recarrega os dados das tabelas de destino (`TRUNCATE ... CASCADE`). Use somente em ambiente de demonstração ou após backup.

> Antes de executar os scripts, confirme o nome do banco e adapte a configuração ao seu PostgreSQL. Não coloque senhas ou outros segredos nos arquivos do repositório.

## Relatório Power BI

Abra `dashboard_vendas.pbix`. O relatório tem a página original **Página 1** e uma nova página **Análises PostgreSQL**. A página nova usa os dados importados de `public.vw_vendas_powerbi` e apresenta:

- Cartões de faturamento, ticket médio, itens vendidos e clientes ativos;
- Faturamento por cidade;
- Tabela de faturamento por cliente;
- Segmentações disponíveis por cliente, categoria e período.

Os valores exibidos refletem a base carregada no arquivo e precisam ser atualizados quando o banco de origem mudar. O filtro de período deve ser validado com uma seleção no Power BI antes de usar em uma apresentação. A análise por categoria ainda está representada como segmentação, sem gráfico de faturamento por categoria na nova página.

## Como conectar/atualizar

1. Instale PostgreSQL e execute o script de carga adequado ao seu ambiente.
2. Confirme que `public.vw_vendas_powerbi` está disponível no banco selecionado.
3. No Power BI Desktop, abra o `.pbix` e configure a fonte PostgreSQL com o servidor, porta e banco locais.
4. Atualize as credenciais pelo diálogo de conexão do Power BI; não as grave neste repositório.
5. Use **Atualizar** para carregar os dados mais recentes.

## Issues AC2 documentadas

Os critérios de análise derivados das issues 9 a 14 e suas observações de implementação estão em [`docs/criterios_implementacao.md`](docs/criterios_implementacao.md). Esse documento descreve o escopo e as limitações atuais da página.

## Diagramas do modelo

Os diagramas de classes e o MER das entidades de vendas, além da explicação das cardinalidades e da view analítica, estão em [`docs/diagramas_modelagem.md`](docs/diagramas_modelagem.md).

## Apresentação e entrega final

O roteiro com falas e o que mostrar em cada parte está em [`docs/roteiro_apresentacao_final.md`](docs/roteiro_apresentacao_final.md). O checklist dos arquivos e das verificações antes de publicar está em [`docs/entrega_final.md`](docs/entrega_final.md). As issues #15 (melhorias visuais), #16 (melhorias nas métricas) e #17 (indicador de quantidade de pedidos) aparecem fechadas na captura mais recente; confira e salve a versão final do PBIX antes de substituir o arquivo do repositório.

## Visão geral original

A página original apresenta indicadores gerais, faturamento por categoria, evolução das vendas, principais produtos e forma de pagamento. Ela foi preservada no arquivo Power BI.

