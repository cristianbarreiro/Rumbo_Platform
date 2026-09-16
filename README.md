# Rumbo Platform

Repositorio principal para coordinar Rumbo Web y Rumbo Android, conservando sus lenguajes, historial y compilaciones independientes.

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

## Estado inicial (2026-09-16)

Estructura preparada localmente, sin commit ni publicación. Web se recuperó de la copia local existente. Android está registrado en el commit `7511c4c61a923bbf03f03c77110d2b5446714203`, consultado en GitHub; su descarga local está pendiente porque Git no dispone de credenciales en esta sesión. Ejecutar setup con autenticación disponible. Las compilaciones de las aplicaciones no se han verificado en esta preparación.
