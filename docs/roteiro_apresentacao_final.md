# Roteiro da apresentação final — Dashboard de Vendas

**Duração sugerida:** 4 a 5 minutos\
**Materiais na tela:** Power BI Desktop, PostgreSQL/pgAdmin, arquivos SQL e repositório GitHub.

> Antes de gravar, abra a versão final do PBIX e salve-a no repositório. O arquivo Power BI atualmente aberto nesta máquina informa que foi salvo pela última vez em 08/11/2026. Confira as alterações das issues #15, #16 e #17, salve o arquivo atualizado e mantenha apenas uma cópia oficial do PBIX no repositório.

## 0:00–0:25 | Abertura e objetivo

**Fala:** “Este é o Dashboard de Vendas, desenvolvido para acompanhar o desempenho comercial e permitir análises por produto, categoria, período, cliente e localização. Na etapa final, integramos o relatório ao PostgreSQL, refinamos as visualizações e os indicadores e documentamos o modelo de dados.”

**Mostrar:** capa ou primeira página do relatório; em seguida, mencione rapidamente Power BI, PostgreSQL e GitHub.

## 0:25–1:05 | Página original e melhorias visuais (#15)

**Fala:** “A primeira página reúne a visão geral: faturamento, quantidade de vendas e ticket médio, além da evolução do faturamento, comparação por categoria, principais produtos e formas de pagamento. As melhorias visuais ajudam a organizar a leitura e manter os indicadores e gráficos fáceis de comparar.”

**Mostrar:** cartões da Página 1; gráficos de faturamento por categoria, Top 5 produtos, evolução mensal e forma de pagamento. Aponte a paleta e a organização da página.

## 1:05–1:40 | Indicadores e métrica de pedidos (#16 e #17)

**Fala:** “Os indicadores resumem o desempenho da base. A quantidade de pedidos deve contar vendas distintas, enquanto o faturamento soma os subtotais dos itens. O ticket médio relaciona o faturamento ao número de pedidos. Assim, os cartões respondem rapidamente a perguntas diferentes sobre volume e valor.”

**Mostrar:** o cartão **Qtd de Vendas** na página original e os cartões da página PostgreSQL. Selecione um período ou categoria e mostre a mudança dos números, caso a interação esteja funcionando na versão final. Aponte o cartão novo da issue #17, se ele estiver na página atualizada.

**Nota para a gravação:** confirme no PBIX salvo onde o indicador da issue #17 foi colocado. Na cópia atualmente aberta, o cartão “Qtd de Vendas” está visível na Página 1; a página PostgreSQL mostrada na conferência não exibia um cartão de pedidos. Confira também a escala/formatação de moeda dos cartões antes de apresentar.

## 1:40–2:25 | PostgreSQL e views analíticas

**Fala:** “No PostgreSQL, os dados estão organizados em clientes, vendas, itens de venda, produtos e categorias. A view `vw_vendas_powerbi` consolida essas tabelas em uma linha por item vendido, com cliente, produto, categoria, data, quantidade e subtotal. Essa granularidade permite analisar os itens sem repetir indevidamente o valor total do pedido.”

**Mostrar:** no pgAdmin, expanda as cinco tabelas e a view `vw_vendas_powerbi`. Abra `sql/carga_dashboard_vendas.sql` e mostre os `INSERT`s e a definição da view. Em seguida, abra `sql/apoio_analise_postgresql.sql` e aponte `vw_resumo_cliente`, `vw_vendas_mensais` e a consulta de conferência.

## 2:25–3:00 | Integração e página PostgreSQL

**Fala:** “O Power BI consome a view do PostgreSQL para apresentar análises por cidade e cliente, junto com filtros de cliente, categoria e período. A conexão separa o armazenamento relacional da camada visual e facilita atualizar os dados quando a base muda.”

**Mostrar:** página **Análises PostgreSQL**; percorra os filtros e os cartões, depois o gráfico de faturamento por cidade e a tabela de clientes. Faça um recorte simples e limpe-o ao final. Só demonstre interações que já tenha testado.

## 3:00–3:35 | MER e modelo de classes

**Fala:** “O MER mostra as entidades e as chaves que conectam os registros. Um cliente pode ter várias vendas; cada venda contém itens; cada item aponta para um produto; e cada produto pertence a uma categoria. O diagrama de classes apresenta essas mesmas entidades como objetos do domínio.”

**Mostrar:** `docs/diagramas_modelagem.md`. Siga as relações Cliente → Venda → ItemVenda → Produto → Categoria. Destaque que `ItemVenda` liga vendas a produtos e registra quantidade, preço e subtotal.

## 3:35–4:05 | GitHub e encerramento

**Fala:** “No GitHub estão o relatório final, os scripts SQL e a documentação para reproduzir e entender a solução. As issues recentes de melhorias visuais, métricas e quantidade de pedidos estão concluídas. Como próximo passo, a versão final do PBIX deve estar salva junto aos arquivos documentados.”

**Mostrar:** repositório, `README.md`, pasta `sql/`, pasta `docs/` e as issues #15, #16 e #17 fechadas. Finalize com a página completa do dashboard.

## Checklist antes de gravar e enviar

- [ ] Salvar no repositório a versão mais recente do PBIX depois das mudanças das issues #15–#17.
- [ ] Confirmar que existe uma única cópia oficial do PBIX e que o README aponta para ela.
- [ ] Conferir o cartão de quantidade de pedidos e a formatação do ticket médio.
- [ ] Testar os filtros que serão demonstrados e limpar as seleções no fim.
- [ ] Abrir os dois scripts SQL sem executar a carga durante a apresentação.
- [ ] Revisar as cardinalidades e a observação sobre chaves no diagrama.
- [ ] Conferir os links e arquivos no GitHub após o envio.

