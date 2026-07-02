-- ============================================================
-- Análise: Pedidos e novos clientes por dia em 2025
-- Autor: Carlos Eduardo Corberi Paz
-- Fonte: Sample Database — Metabase Local
-- Descrição: Utiliza duas CTEs para calcular separadamente o
--            total de pedidos e de novos clientes por dia em 2025,
--            combinando os resultados via LEFT JOIN para comparar
--            as duas métricas na mesma visualização.
-- Nota: COALESCE substitui ISNULL (não suportado no banco H2).
--       Em produção com MySQL/PostgreSQL, ISNULL também funcionaria.
-- ============================================================

-- CTE 1: total de pedidos por dia em 2025
WITH pedidos2025 AS (
    SELECT
        COUNT(ID)                AS pedidos,     -- conta o total de pedidos do dia
        CAST(CREATED_AT AS DATE) AS dia_pedido   -- converte o timestamp para apenas a data
    FROM orders
    WHERE YEAR(CREATED_AT) = 2025               -- filtra apenas pedidos de 2025
    GROUP BY dia_pedido                          -- agrupa por dia
),

-- CTE 2: total de novos clientes cadastrados por dia em 2025
clientes2025 AS (
    SELECT
        COUNT(ID)                AS clientes,     -- conta o total de novos clientes do dia
        CAST(CREATED_AT AS DATE) AS dia_cliente   -- converte o timestamp para apenas a data
    FROM PEOPLE
    WHERE YEAR(CREATED_AT) = 2025                -- filtra apenas cadastros de 2025
    GROUP BY dia_cliente                          -- agrupa por dia
)

-- Query principal: combina pedidos e clientes por dia
-- LEFT JOIN garante que todos os dias com pedidos apareçam,
-- mesmo que não haja novos clientes cadastrados naquele dia
SELECT
    dia_pedido,
    pedidos,
    COALESCE(clientes, 0) AS clientes  -- substitui NULL por 0 quando não há novos clientes no dia

FROM pedidos2025
LEFT JOIN clientes2025 ON pedidos2025.dia_pedido = clientes2025.dia_cliente