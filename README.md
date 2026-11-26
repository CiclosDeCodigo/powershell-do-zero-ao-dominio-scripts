# PowerShell — Do Zero ao Domínio

Repositório oficial de scripts, exercícios e automações  
por **Ciclos de Código — Rodrigo Minerva Colombo**

---

## Autor

Rodrigo Minerva Colombo  
GitHub: https://github.com/CiclosDeCodigo  
LinkedIn: https://www.linkedin.com/in/rodrigo-minerva-colombo/

## Livro

Este repositório acompanha o livro **PowerShell — Do Zero ao Domínio**, da série **Ciclos de Código**.

📘 Disponível na Amazon: https://www.amazon.com.br/dp/B0G8TGDTL5

---

## Sobre este repositório

Este repositório reúne os scripts, exercícios, exemplos e automações apresentados no livro **PowerShell — Do Zero ao Domínio**, além de materiais complementares para estudo e aplicação prática.

Os conteúdos abordam:

- Fundamentos da linguagem PowerShell e utilização do terminal;
- Automação de tarefas administrativas e corporativas;
- Manipulação de arquivos, diretórios, dados e logs;
- Administração de sistemas, serviços e processos;
- Compartilhamentos, permissões e auditorias;
- Monitoramento, métricas e diagnósticos;
- Administração de Active Directory;
- Rede, suporte e automações operacionais;
- Integração entre PowerShell e Inteligência Artificial.

Os exemplos procuram valorizar legibilidade, segurança, organização e manutenção. Antes de utilizar qualquer script em um ambiente real, leia seu conteúdo, confira os pré-requisitos e valide os possíveis impactos.

---

## Estrutura do projeto

Os exemplos do livro estão organizados de acordo com os capítulos e as seções correspondentes.

Além desse conteúdo, o repositório disponibiliza **50 scripts adicionais**, agrupados por tema:

| Módulo | Tema |
|--------|------|
| A1–A10 | Manipulação de arquivos e análises |
| A11–A20 | Compartilhamentos, permissões e auditorias |
| A21–A30 | Métricas do sistema e Active Directory |
| A31–A40 | Serviços, jobs e automações |
| A41–A50 | Rede, diagnósticos e suporte |
| Extras | IA + PowerShell e integrações avançadas |

Os scripts adicionais complementam os assuntos do livro e permitem explorar outros cenários de utilização da linguagem.

---

## Assistente de estudos com Inteligência Artificial

Este projeto também disponibiliza um conjunto de instruções para configurar um assistente de IA especializado no estudo e na aplicação de PowerShell, seguindo a abordagem do livro **PowerShell — Do Zero ao Domínio**.

O assistente atua como tutor técnico, auxiliando o leitor a:

- Compreender os fundamentos e os recursos da linguagem PowerShell;
- Criar, explicar e revisar scripts;
- Identificar erros e investigar problemas;
- Aplicar boas práticas de segurança, organização e manutenção;
- Automatizar tarefas administrativas e corporativas;
- Entender diferenças entre versões e ambientes;
- Utilizar Inteligência Artificial como apoio ao desenvolvimento e à aprendizagem.

### Como utilizar

O arquivo de instruções está disponível na pasta `Agente` deste repositório:

📄 [Agente de Estudos — PowerShell (Markdown)](Agente/agente-estudos-powershell.md)

Seu conteúdo pode ser utilizado nas instruções de um projeto, nas instruções personalizadas ou em recurso equivalente oferecido pela plataforma de Inteligência Artificial escolhida.

Quando a plataforma permitir, recomenda-se adicionar também o livro e os scripts complementares como materiais de referência.

**Importante:** o arquivo define o comportamento e as orientações do assistente, mas não concede automaticamente acesso ao computador, aos arquivos locais, à rede ou aos servidores do usuário, nem permite executar scripts. Essas capacidades dependem dos recursos e das permissões disponibilizados pela plataforma utilizada.

---

## Objetivo

Fornecer uma base sólida e progressiva para que estudantes e profissionais possam:

- Aprender PowerShell com exemplos aplicáveis;
- Desenvolver automações claras e eficientes;
- Administrar e diagnosticar ambientes de TI;
- Implementar boas práticas de segurança e documentação;
- Criar soluções que possam ser adaptadas a situações reais;
- Utilizar Inteligência Artificial como apoio ao desenvolvimento.

---

## Requisitos

Os exemplos têm como referência principal:

- Windows 11;
- PowerShell 7.x.

O Windows 10 pode ser utilizado em cenários de compatibilidade, observadas as condições de suporte do sistema operacional e os requisitos de cada exemplo.

Alguns scripts podem exigir privilégios administrativos, módulos específicos, componentes opcionais do Windows ou acesso a recursos de rede e domínio. Esses requisitos devem ser conferidos antes da execução.

Para verificar a versão do PowerShell instalada, execute:

```powershell
$PSVersionTable
```

---

## Como executar

Clone o repositório:

```powershell
git clone https://github.com/CiclosDeCodigo/powershell-do-zero-ao-dominio-scripts
```

Acesse a pasta do projeto:

```powershell
Set-Location powershell-do-zero-ao-dominio-scripts
```

Abra os arquivos de script (`.ps1`) em um editor de sua preferência, como o Visual Studio Code, ou execute-os pelo terminal do PowerShell, conforme as instruções de cada exemplo.

Antes de executar um script:

1. Leia o código e identifique o que será alterado;
2. Confira os pré-requisitos e as permissões necessárias;
3. Verifique caminhos, parâmetros e recursos utilizados;
4. Quando aplicável, utilize mecanismos de simulação, como `-WhatIf`;
5. Teste primeiro em um ambiente controlado.

**Atenção:** scripts administrativos podem alterar configurações, permissões, serviços, arquivos e recursos de rede. Não execute código sem compreender seu funcionamento e seus possíveis efeitos.
