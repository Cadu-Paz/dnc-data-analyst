-- ============================================================
-- Análise: Total de novos clientes por dia em um mês
-- Autor: Carlos Eduardo Corberi Paz
-- Fonte: Sample Database — Metabase (Curso DNC)
-- Descrição: Conta o total de novos clientes cadastrados por dia,
--            com filtro dinâmico de período via parâmetro de data.
-- ============================================================

SELECT
    COUNT(*)            AS total,  -- conta o total de novos clientes cadastrados no dia
    DAY(CREATED_AT)     AS dia     -- extrai o número do dia da data de cadastro

FROM people

-- ATENÇÃO: [[WHERE {{data}}]] é sintaxe exclusiva do Metabase para filtros dinâmicos opcionais.
-- Em produção, o equivalente seria passar parâmetros via aplicação:
-- WHERE CREATED_AT BETWEEN :data_inicio AND :data_fim
[[WHERE {{data}}]]

GROUP BY
    dia     -- agrupa os resultados por dia para contar os cadastros de cada dia

ORDER BY
    dia     -- ordena cronologicamente do dia 1 ao último dia do mês