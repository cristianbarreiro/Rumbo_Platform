# Rumbo Platform

Fuente de verdad de arquitectura, contratos conceptuales, convenciones, documentación y flujo de agentes de Rumbo. Web y Android son dos implementaciones del mismo producto, con lenguajes, historial y compilaciones independientes.

## Aplicaciones

| Ruta | Repositorio | Tecnología |
| --- | --- | --- |
| apps/web | https://github.com/cristianbarreiro/Rumbo-v1.0 | React, TypeScript, Vite, Express, Leaflet |
| apps/android | https://github.com/cristianbarreiro/Rumbos | Kotlin, Jetpack Compose |

Las aplicaciones son submódulos Git fijados a commits. Compartimos especificaciones, contratos y criterios visuales; cada plataforma implementa sus propias capas.

## Preparación

Con Git instalado y acceso a ambos repositorios:

```powershell
git clone --recurse-submodules https://github.com/cristianbarreiro/Rumbo_Platform.git
cd Rumbo_Platform
```

Para una copia existente:

```powershell
git submodule update --init --recursive
# Alternativa PowerShell (sincroniza también URLs):
./scripts/setup.ps1
```

No se actualiza automáticamente a la última rama remota. Los commits del repositorio padre definen las versiones elegidas.

## Documentación

- [Arquitectura](docs/architecture/overview.md)
- [Web](docs/architecture/web.md) y [Android](docs/architecture/android.md)
- [Requisitos](docs/product/requirements.md), [paridad](docs/product/features.md) y [roadmap](docs/product/roadmap.md)
- [Diseño](docs/design/design-system.md), [pantallas](docs/design/screens.md) y [navegación](docs/design/navigation.md)
- [Integración IMM](docs/api/imm-api.md)
- [Contratos](contracts/README.md)

## Flujo de cambios

1. Crear una rama en la aplicación afectada antes de editar: un submódulo puede estar en detached HEAD.
2. Validar y publicar los cambios en su repositorio independiente.
3. Registrar en el padre el nuevo puntero con `git add apps/web` o `git add apps/android`.
4. Actualizar las especificaciones afectadas y revisar la paridad con la otra aplicación.
5. Confirmar y publicar el cambio del padre después de que los commits de las aplicaciones estén disponibles en GitHub.

## Contexto para agentes

[AGENTS.md](AGENTS.md) es la entrada operativa. Las dos skills existentes están enlazadas allí; el [índice OKF](.okf/index.md) permite consultar conocimiento por tema. [CLAUDE.md](CLAUDE.md) y [GEMINI.md](GEMINI.md) importan únicamente las reglas canónicas.

La [decisión de contexto](.okf/context-architecture.md) explica las responsabilidades y compatibilidad, sin exigir lectura de toda la documentación al iniciar tareas.

## Estado de integración

Los dos submódulos ya estaban configurados y se conservaron. La [auditoría del 2026-09-17](docs/architecture/audit.md) registra ramas, commits, diferencias y límites. El checkout Web estaba adelantado respecto al pin del padre; no se promovió ni restableció. Consultar `git submodule status` y `git diff --submodule` antes de sincronizar una copia con trabajo local.

El [contrato de transporte](.okf/transport-model.md) reúne la semántica y diferencias abiertas; la [decisión de plataforma](.okf/platform-structure.md) explica los límites de integración.

Los snapshots auditados de los clientes no tienen README rastreado. Consultar [Web](docs/architecture/web.md) y [Android](docs/architecture/android.md) para ubicar su configuración propia; cuando incorporen READMEs, mantener allí el setup específico. No se certificaron builds ni conexión IMM en esta tarea.
