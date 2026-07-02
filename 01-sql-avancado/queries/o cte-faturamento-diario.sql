-- ============================================================
-- Análise: Faturamento diário acima de R$ 400 em 2025
-- Autor: Carlos Eduardo Corberi Paz
-- Fonte: Sample Database — Metabase Local
-- Descrição: Utiliza CTE para calcular o faturamento diário de
--            2025 e filtra apenas os dias com faturamento acima
--            de 400. Demonstra o uso de CTE para modularizar
--            consultas complexas em etapas legíveis.
-- ============================================================

-- CTE: cria uma tabela temporária chamada pedidos2025
-- com o faturamento agrupado por dia para o ano de 2025
WITH pedidos2025 AS (
    SELECT
        SUM(SUBTOTAL)           AS faturamento,  -- soma o subtotal de todos os pedidos do dia
        CAST(CREATED_AT AS DATE) AS dia           -- converte o timestamp para apenas a data

    FROM ORDERS

    WHERE YEAR(CREATED_AT) = 2025  -- filtra apenas pedidos do ano de 2025

    GROUP BY dia   -- agrupa por dia para calcular o faturamento diário
    ORDER BY dia   -- ordena cronologicamente
)

-- Query principal: consulta a CTE e aplica filtro de faturamento mínimo
SELECT *
FROM pedidos2025
WHERE faturamento > 400  -- retorna apenas os dias com faturamento acima de 400