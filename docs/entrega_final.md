# Checklist de arquivos para a entrega final

Este documento organiza o que deve estar no GitHub para que a apresentação e o projeto possam ser revisados e reproduzidos.

## Arquivos para incluir

| Caminho no repositório | Conteúdo |
| --- | --- |
| `README.md` | Visão geral, tecnologias, estrutura, conexão e links da documentação. |
| `dashboard_vendas.pbix` | Uma única cópia oficial do relatório Power BI, salva após as alterações finais. |
| `sql/carga_dashboard_vendas.sql` | Script de preparação/carga e criação da view consolidada. |
| `sql/apoio_analise_postgresql.sql` | Views auxiliares e consulta de conferência. |
| `docs/criterios_implementacao.md` | Critérios e registro de implementação/limitações das issues AC2. |
| `docs/diagramas_modelagem.md` | Diagrama de classes, MER e explicação do modelo. |
| `docs/roteiro_apresentacao_final.md` | Falas, sequência de demonstração e checklist de gravação. |
| `docs/entrega_final.md` | Este checklist de publicação. |

O vídeo pode ser entregue pelo canal solicitado pela disciplina. Inclua um arquivo de vídeo no GitHub apenas se o professor pedir ou se o tamanho/limite do repositório permitir; quando publicado em outra plataforma, acrescente o link ao README.

## Estado conferido

- A captura de tela mais recente enviada mostra as issues **#15 Melhorias Visuais**, **#16 Melhorias nas métricas** e **#17 Adicionar indicador de quantidade de pedidos** como fechadas no GitHub.
- As issues fechadas mostram status, mas a captura não comprova quais mudanças foram salvas no arquivo `.pbix`.
- O Power BI aberto durante a preparação informa que foi salvo pela última vez em **08/11/2026**. Na página original aparece o cartão “Qtd de Vendas”; na página **Análises PostgreSQL** conferida não foi visto um cartão adicional de pedidos.
- Há duas cópias diferentes do PBIX na pasta local: `dashboard_vendas.pbix` na raiz e `powerbi/dashboard_vendas.pbix`. O README atual aponta para a cópia da raiz. Antes de publicar, salve a versão que contém as últimas alterações no Power BI, substitua a cópia oficial da raiz e evite manter versões duplicadas sem identificação.

## Conferências antes de publicar

1. Abra o PBIX final e confira visualmente as alterações das issues #15–#17.
2. Confira que a quantidade de pedidos conta vendas distintas e que os cartões monetários exibem valores com escala e formatação compreensíveis.
3. Salve o PBIX final em `dashboard_vendas.pbix` e confirme que esse é o caminho ligado no README.
4. Confira os links relativos do README para os arquivos em `docs/` e `sql/`.
5. Não envie senhas, credenciais de banco, dados reais pessoais ou arquivos temporários.
6. Depois do envio, abra o repositório no GitHub e confirme que o PBIX, os scripts e a documentação aparecem e podem ser abertos.

## Segurança do script de carga

`sql/carga_dashboard_vendas.sql` contém `TRUNCATE ... RESTART IDENTITY CASCADE`, que limpa e recria dados nas tabelas de destino. Mantenha o aviso no README e execute-o apenas em ambiente de demonstração ou após backup.

