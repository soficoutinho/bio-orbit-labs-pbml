# Bio-Orbit Labs – Sistema Robótico Orbital para Manipulação de Amostras Biológicas

## Integrantes

* Anna Yagyu — RM 550360
* Felipe Capriotti — RM 98460
* Gustavo Kawamura — RM 99679
* Gabriel Pacheco — RM 550191
* Sofia Coutinho — RM 552534

---

# Descrição do Projeto

O projeto **Bio-Orbit Labs** consiste em um sistema robótico embarcado para manipulação automatizada de amostras biológicas em ambiente orbital simulado.

O sistema foi desenvolvido utilizando Arduino Uno, servomotores microservo 9g, comunicação serial e modelagem 3D paramétrica em OpenSCAD.

A proposta do projeto é simular um mecanismo de coleta e manipulação de amostras biológicas em um laboratório orbital automatizado, inspirado em aplicações de biotecnologia espacial e sistemas embarcados utilizados em ambientes de microgravidade.

---

# Funcionalidades

O sistema permite:

* Controle manual do braço robótico;
* Controle manual da garra robótica;
* Execução de sequência automatizada de coleta;
* Feedback visual através de LED indicador;
* Comunicação serial com comandos em tempo real;
* Estrutura 3D paramétrica com encaixe para microservo 9g.

---

# Acesso ao Simulador

Link público do Tinkercad:
https://www.tinkercad.com/things/ginhQqdLpeU-bodacious-leelo-turing/editel?returnTo=https%3A%2F%2Fwww.tinkercad.com%2Fdashboard
---

# Guia de Operação

Os comandos devem ser enviados pelo Monitor Serial do simulador.

| Comando | Função                        |
| ------- | ----------------------------- |
| U       | Elevar braço robótico         |
| D       | Recolher braço robótico       |
| O       | Abrir garra                   |
| C       | Fechar garra                  |
| M       | Executar sequência automática |
| S       | Exibir status atual           |
| R       | Resetar sistema               |

---

# Sequência Automática

O modo automático executa a seguinte sequência:

1. Elevação do braço robótico;
2. Abertura da garra;
3. Fechamento da garra;
4. Retorno do braço para posição inicial.

O processo simula uma rotina automatizada de coleta de amostras em ambiente orbital.

---

# Software de Modelagem 3D

O modelo da garra robótica foi desenvolvido utilizando:

* OpenSCAD

O projeto foi criado utilizando modelagem paramétrica, permitindo ajustes simples através de variáveis dimensionais.

Os arquivos disponíveis incluem:

* Arquivo fonte `.scad`
* Arquivo exportado `.stl`

---

# Especificações Técnicas

## Alimentação

* Arduino Uno alimentado em 5V;
* Servomotores alimentados diretamente pelo pino 5V do Arduino;
* LED indicador com resistor de proteção de 220 Ω.

---

# Pinagem Utilizada

| Componente              | Pino Arduino |
| ----------------------- | ------------ |
| Servo do braço robótico | D9           |
| Servo da garra          | D10          |
| LED indicador           | D7           |

---

# Estrutura do Projeto

## /src

Código-fonte Arduino (.ino)

## /model

Arquivos OpenSCAD (.scad) e STL (.stl)

## /images

Capturas do circuito, código e modelo 3D

---

# Tecnologias Utilizadas

* Arduino Uno
* Tinkercad
* OpenSCAD
* Linguagem C++
* Modelagem Paramétrica 3D

---

# Objetivo Educacional

O projeto integra conceitos de:

* Sistemas embarcados;
* Automação robótica;
* Comunicação serial;
* Modelagem 3D paramétrica;
* Integração hardware/software;
* Simulação de aplicações espaciais.

---

# Status do Projeto

Projeto funcional e validado em ambiente de simulação.
