---
name: rumbo-contract-sync
description: Maintain Rumbo domain and data compatibility when changing models, field semantics, API normalization or shared contracts across TypeScript and Kotlin. Use for schema drift and data changes, not purely visual edits or behavior-only UX comparisons.
---

# Rumbo contract sync

Aplicar las [reglas operativas](../../../AGENTS.md). Este procedimiento evalúa cambios de significado o representación; no mantiene copias de los modelos.

1. Identificar el concepto real y localizar sus representaciones con búsquedas dirigidas de nombres, interfaces, data classes, DTOs, serializers y tests.
2. Leer la sección pertinente del [contrato conceptual](../../../.okf/transport-model.md), sus esquemas/ejemplos en contracts si existen y los normalizadores afectados. Si cambia procedencia o payload externo, consultar [datos de transporte](../../../.okf/transport-data.md).
3. Comparar obligatoriedad, nulabilidad, defaults, IDs, relaciones, orden de coordenadas, unidades, tiempo, procedencia y ausencia de datos. Comprobar consumidores y conversiones: igual nombre no garantiza igual significado.
4. Clasificar: documentación de plataforma, implementación de un cliente o contrato compartido. Para este último evaluar Web, Android, integración, cachés/persistencia, tests y documentación; registrar compatibilidad o migración cuando corresponda.
5. Actualizar solo capas afectadas y tests relevantes. Modificar la definición canónica cuando cambie semántica; esquemas y ejemplos solo si existen y se afectan. No crear modelos sin uso ni forzar imports desde el padre.
6. Comparar las representaciones finales y sus consumidores con el significado acordado para detectar drift accidental. Preservar los adaptadores existentes; no introducir otra arquitectura por uniformidad.
7. Ejecutar checks pertinentes y reportar impacto, diferencias abiertas y límites de validación. Usar [rumbo-feature-parity](../rumbo-feature-parity/SKILL.md) además si requiere comparar comportamiento visible.

Seguir solo mappings y consumidores relevantes; leer UI únicamente si resulta afectada. Las guías [Web](../../../docs/architecture/web.md) y [Android](../../../docs/architecture/android.md) ubican las entradas cuando sea necesario.
