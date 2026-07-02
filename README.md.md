# DNC — Curso de Análise de Dados

Repositório com todos os projetos e exercícios do curso de Análise de Dados da Escola DNC.

## Módulos

| Módulo | Tema | Ferramentas | Status |
|---|---|---|---|
| 01 | SQL Avançado | SQL · Metabase | 🚧 Em andamento |
| 02 | Estatística com Python | Python · Jupyter | 🔜 Em breve |
| 03 | Power BI | Power BI | 🔜 Em breve |
| 04 | Projeto Final | Todas | 🔜 Em breve |

## Ambiente de desenvolvimento

### Pré-requisitos instalados
- Java JDK 25 (Temurin)
- Metabase OSS (local)
- PostgreSQL 18
- VS Code
- Git 2.44

### Como iniciar o Metabase local

Abra o terminal e rode:

```bash
cd C:\metabase
java -jar metabase.jar
```

Aguarde a mensagem de inicialização e acesse no navegador:

```
http://localhost:3000
```

### Bancos de dados disponíveis

| Banco | Tipo | Descrição |
|---|---|---|
| Sample Database | H2 (embutido) | Base de dados do curso com tabelas Orders, People e Products |
| DNC Local | PostgreSQL | Banco local para projetos próprios |

### Credenciais PostgreSQL
- Host: 127.0.0.1
- Port: 5432
- Database: postgres / sample_database
- Username: postgres

> ⚠️ Nunca commite senhas no GitHub. As credenciais acima são apenas para ambiente local de estudos.

## Sobre
Curso de formação em análise de dados com foco em SQL, estatística, visualização e projeto prático.

**Aluno:** Carlos Eduardo Corberi Paz  
**LinkedIn:** [cadupaz](https://linkedin.com/in/cadupaz)
