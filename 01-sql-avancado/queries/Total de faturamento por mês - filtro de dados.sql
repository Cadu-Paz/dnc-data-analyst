-- ============================================================
-- Análise: Faturamento total mensal
-- Autor: Carlos Eduardo Corberi Paz
-- Fonte: Sample Database — Metabase (Curso DNC)
-- Descrição: Calcula o faturamento total agrupado por mês e ano,
--            com filtro dinâmico de período via parâmetro de data.
-- ============================================================

SELECT
    MONTH(CREATED_AT)        AS mes,               -- extrai o número do mês da data do pedido
    YEAR(CREATED_AT)         AS ano,               -- extrai o ano da data do pedido
    ROUND(SUM(SUBTOTAL), 2)  AS faturamento_total  -- soma o subtotal arredondado em 2 casas decimais

FROM orders

-- ATENÇÃO: [[WHERE {{data}}]] é sintaxe exclusiva do Metabase para filtros dinâmicos opcionais.
-- Em produção, o equivalente seria passar parâmetros via aplicação:
-- WHERE CREATED_AT BETWEEN :data_inicio AND :data_fim
[[WHERE {{data}}]]

GROUP BY
    mes,
    ano       -- agrupa os resultados por mês e ano para calcular o faturamento de cada período

ORDER BY
    ano,
    mes       -- ordena cronologicamente do mais antigo para o mais recente