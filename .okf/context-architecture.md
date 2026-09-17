---
type: Architecture Decision
title: Contexto de agentes
description: Responsabilidad de cada fuente y razón de la lectura bajo demanda.
sources:
  - id: okf
    resource: https://github.com/GoogleCloudPlatform/open-knowledge-format/blob/main/SPEC.md
  - id: claude
    resource: https://code.claude.com/docs/en/memory
  - id: gemini
    resource: https://geminicli.com/docs/cli/gemini-md/
---

# Contexto de agentes

## Contexto

Las instrucciones y las skills de Rumbo mezclaban reglas generales con semántica del transporte. Mantener copias por proveedor hacía posible que divergieran y cargaba información ajena a tareas pequeñas.

## Decisión adoptada

| Fuente canónica | Responsabilidad |
| --- | --- |
| AGENTS.md | Reglas operativas frecuentes y selección del contexto |
| .github/skills/ | Los dos procedimientos especializados existentes |
| .okf/ | Conocimiento duradero y razones de decisiones |
| Código de cada cliente | Verdad de su implementación |
| contracts/ | Entrada a contratos; futuros esquemas/ejemplos con valor técnico propio |
| docs/ | Evidencia de auditoría, matriz de paridad, diseño y guías humanas |
| README.md | Presentación y navegación para personas |

El bundle adopta OKF 0.2, consultado el 2026-09-17. Su índice declara la versión; los conceptos tienen tipo, título, descripción y fuentes. No se atribuye revisión humana ni verificación funcional inexistente.[^okf]

La compatibilidad con Claude Code y Gemini CLI se incorpora mediante imports de AGENTS.md de una línea. Ambos mecanismos están documentados oficialmente.[^claude][^gemini] La alternativa Gemini `context.fileName` existe, pero requeriría configuración adicional; el adaptador conserva el nombre predeterminado sin alterar settings.[^gemini]

## Razón

Una regla tiene un único lugar de mantenimiento. Las skills aportan pasos para una tarea; el índice permite seleccionar conocimiento sin importarlo entero al inicio. Los enlaces anteriores a contratos siguen funcionando mediante una referencia a la versión canónica.

## Consecuencias

Los adaptadores no importan OKF, README ni skills. Los tipos de conocimiento son decisiones, contrato conceptual y referencia de integración; no incluyen inventarios de componentes o dependencias. Las fuentes fijadas a commits permiten distinguir observación de garantía vigente. El snapshot auditado de un cliente puede diferir del pin del padre.

No hay reglas anidadas nuevas: no se identificó una invariante local frecuente que las justifique. Tampoco hay archivos para otros proveedores, copias de skills, PLANS.md, servidores de conocimiento o automatización de documentación. La compatibilidad de importación se comprobó por documentación y estructura, no mediante sesiones ejecutadas de esos agentes.

[^okf]: Especificación oficial; apartados 4, 5, 8, 11 y 12.
[^claude]: Claude Code, imports y compatibilidad con AGENTS.md.
[^gemini]: Gemini CLI, imports Markdown y context.fileName.
