-- Objetos de apoio para análise comercial e clientes no PostgreSQL.
-- Execute no banco dashboard_vendas. Não remove nem altera tabelas de origem.

CREATE OR REPLACE VIEW public.vw_resumo_cliente AS
SELECT
    cliente_id,
    cliente,
    cidade,
    estado,
    COUNT(DISTINCT venda_id) AS qtd_vendas,
    SUM(subtotal)::numeric(14,2) AS faturamento_total,
    SUM(quantidade) AS itens_comprados,
    (SUM(subtotal) / NULLIF(COUNT(DISTINCT venda_id), 0))::numeric(14,2) AS ticket_medio,
    MAX(data_venda) AS ultima_compra
FROM public.vw_vendas_powerbi
GROUP BY cliente_id, cliente, cidade, estado;

CREATE OR REPLACE VIEW public.vw_vendas_mensais AS
SELECT
    DATE_TRUNC('month', data_venda)::date AS mes,
    SUM(subtotal)::numeric(14,2) AS faturamento,
    COUNT(DISTINCT venda_id) AS qtd_vendas,
    SUM(quantidade) AS itens_vendidos
FROM public.vw_vendas_powerbi
GROUP BY DATE_TRUNC('month', data_venda)::date;

-- Conferência para comparar os totais da view com as vendas registradas.
SELECT
    COUNT(DISTINCT venda_id) AS pedidos,
    COUNT(DISTINCT cliente_id) AS clientes,
    SUM(quantidade) AS itens,
    SUM(subtotal)::numeric(14,2) AS faturamento
FROM public.vw_vendas_powerbi;
