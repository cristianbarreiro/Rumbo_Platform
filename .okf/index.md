---
okf_version: "0.2"
---

# Conocimiento de Rumbo

## Arquitectura y decisiones

- [Estructura de plataforma](platform-structure.md) - Por qué existen clientes independientes, submódulos y contratos neutrales.
- [Contexto de agentes](context-architecture.md) - Responsabilidad de cada fuente y razón de la lectura bajo demanda.

## Transporte

- [Contrato conceptual](transport-model.md) - Significado de paradas, líneas, vehículos y llegadas; diferencias de representación.
- [Procedencia de datos](transport-data.md) - Límites entre datos locales, horarios, normalización y conexión verificada.

## Rutas de consulta

Cambiar llegadas: contrato conceptual; añadir procedencia de datos si cambia origen o fallback.
Cambiar estructura de repositorios: estructura de plataforma.
Cambiar instrucciones o adaptadores: contexto de agentes.

Las entradas de implementación por cliente siguen en [Web](../docs/architecture/web.md) y [Android](../docs/architecture/android.md).
La [matriz de paridad](../docs/product/features.md) registra gaps; el [historial de auditoría](../docs/architecture/audit.md) conserva evidencia fechada.
