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

## Skills de Rumbo

- [rumbo-feature-parity](.github/skills/rumbo-feature-parity/SKILL.md): comparar o trasladar comportamiento, flujos y estados entre clientes.
- [rumbo-contract-sync](.github/skills/rumbo-contract-sync/SKILL.md): mantener significado compatible entre contratos, modelos y normalización.

Formato Agent Skills con metadata YAML; cada agente puede leer estas rutas explícitamente si no descubre `.github/skills`. No hace falta cargar ambas para cada tarea.

## Estado de integración

Los dos submódulos ya estaban configurados y se conservaron. La [auditoría del 2026-09-17](docs/architecture/audit.md) registra ramas, commits, diferencias y límites. El checkout Web estaba adelantado respecto al pin del padre; no se promovió ni restableció. Consultar `git submodule status` y `git diff --submodule` antes de sincronizar una copia con trabajo local.

La paridad es equivalencia de comportamiento y significado, con UX nativa. El [contrato de transporte](contracts/models/transit.md) documenta la base común y las diferencias abiertas; no es una nueva API compartida. No se acoplan builds ni se comparte UI.

Los snapshots auditados de los clientes no tienen README rastreado. Consultar [Web](docs/architecture/web.md) y [Android](docs/architecture/android.md) para ubicar su configuración propia; cuando incorporen READMEs, mantener allí el setup específico. No se certificaron builds ni conexión IMM en esta tarea.
