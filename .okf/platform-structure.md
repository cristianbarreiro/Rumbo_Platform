---
type: Architecture Decision
title: Estructura de plataforma
description: Por qué existen clientes independientes, submódulos y contratos neutrales.
sources:
  - id: platform
    resource: https://github.com/cristianbarreiro/Rumbo_Platform/blob/c1ddc42e4c31d7e1c5fc5b0ade2df62165c6db2e/README.md
  - id: rules
    resource: https://github.com/cristianbarreiro/Rumbo_Platform/blob/c1ddc42e4c31d7e1c5fc5b0ade2df62165c6db2e/AGENTS.md
---

# Estructura de plataforma

## Contexto

Rumbo presenta el mismo producto en dos plataformas con ciclos de desarrollo propios. Una implementación única obligaría a trasladar convenciones de un entorno al otro sin garantizar mejor comportamiento.[^platform]

## Decisión adoptada

Rumbo Platform coordina conocimiento del producto, contratos conceptuales, documentación, flujo de agentes y decisiones. Los repositorios Web y Android conservan implementación, UI, arquitectura nativa y builds. Los submódulos fijan versiones explícitas sin copiar fuentes ni perder historial.[^platform]

La paridad se evalúa por intención del usuario, significado del dominio y estados observables. No implica clases, carpetas, bibliotecas o código idénticos. Los contratos son neutrales respecto del lenguaje; no requieren imports desde las aplicaciones ni generación de modelos.[^rules]

## Razón

La independencia permite evolucionar cada cliente con convenciones nativas mientras los acuerdos de producto siguen siendo revisables en un lugar común.

## Consecuencias

Una mejora puede afectar a un solo cliente. Un par de commits fijados no demuestra paridad funcional. La coordinación no incorpora npm workspaces, builds Gradle compuestos, UI compartida ni un nuevo backend común; las integraciones propias de cada aplicación siguen perteneciendo a ella.[^rules]

[^platform]: Decisión documentada en el README del padre, versión anterior a esta reorganización.
[^rules]: Límites adoptados en las instrucciones del padre, conservados al reorganizar contexto.
