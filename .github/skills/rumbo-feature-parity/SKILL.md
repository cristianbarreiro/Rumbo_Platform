---
name: rumbo-feature-parity
description: Compare or port Rumbo user-visible behavior between Web and Android, including flows, map interactions and loading/error/empty states. Use for cross-client feature parity or behavioral drift, not ordinary single-client visual edits or data-only schema changes.
---

# Rumbo feature parity

Aplicar las [reglas operativas](../../../AGENTS.md). Este procedimiento compara comportamiento observable; no define una arquitectura común.

1. Identificar la función y el cliente fuente, si existe. Empezar por su entrada y seguir dependencias necesarias; inspeccionar el área equivalente del otro cliente.
2. Consultar la [matriz de paridad](../../../docs/product/features.md). Si se necesita aclarar qué es común frente a nativo, consultar la [decisión de plataforma](../../../.okf/platform-structure.md); para datos de transporte, solo las secciones pertinentes del [contrato](../../../.okf/transport-model.md) y, si cambia origen/fallback, [procedencia](../../../.okf/transport-data.md).
3. Definir escenarios comparables: intención, acción, resultado, carga, error, vacío, datos ausentes/obsoletos y regreso. Separar diferencias nativas legítimas de gaps sin aprobarlos por existir.
4. Inspeccionar los modelos afectados. Si cambia significado compartido de datos, usar también [rumbo-contract-sync](../rumbo-contract-sync/SKILL.md).
5. Aplicar la modificación mínima. Evitar copiar implementación entre clientes, sustituir patrones nativos, cambiar UX ya equivalente o introducir abstracciones entre plataformas para lograr semejanza interna.
6. Ejecutar los tests/builds/checks pertinentes del cliente usando su configuración. Comparar el mismo escenario y procedencia antes de afirmar paridad.
7. Reportar evidencia, diferencias intencionales, gaps y comprobaciones omitidas. Actualizar la matriz solo en el área afectada.

Las entradas de código están en [Web](../../../docs/architecture/web.md) y [Android](../../../docs/architecture/android.md), disponibles si no se conoce el punto de partida. Detener la lectura al reunir evidencia suficiente.
