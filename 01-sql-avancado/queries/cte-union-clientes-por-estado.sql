-- ============================================================
-- Análise: Clientes de LA e NY cadastrados em 2025
-- Autor: Carlos Eduardo Corberi Paz
-- Fonte: Sample Database — Metabase Local
-- Descrição: Utiliza três CTEs e o operador UNION para combinar
--            clientes de dois estados (LA e NY) em uma única
--            base consolidada. Demonstra o uso de UNION para
--            empilhar resultados de queries distintas eliminando
--            duplicatas automaticamente.
-- Nota: UNION elimina linhas duplicadas. Caso queira manter
--       duplicatas, utilize UNION ALL que tem melhor performance.
-- ============================================================

-- CTE 1: clientes cadastrados em 2025 no estado da Louisiana (LA)
WITH clientesLA AS (
    SELECT *
    FROM PEOPLE
    WHERE
        YEAR(CREATED_AT) = 2025 AND  -- filtra apenas cadastros de 2025
        STATE = 'LA'                  -- filtra apenas clientes da Louisiana
),

-- CTE 2: clientes cadastrados em 2025 no estado de Nova York (NY)
clientesNY AS (
    SELECT *
    FROM PEOPLE
    WHERE
        YEAR(CREATED_AT) = 2025 AND  -- filtra apenas cadastros de 2025
        STATE = 'NY'                  -- filtra apenas clientes de Nova York
),

-- CTE 3: consolida os clientes dos dois estados em uma única tabela
-- UNION empilha os resultados eliminando linhas duplicadas
clientes_nacional AS (
    SELECT * FROM clientesLA
    UNION
    SELECT * FROM clientesNY
)

-- Query principal: retorna todos os clientes consolidados
SELECT * FROM clientes_nacional