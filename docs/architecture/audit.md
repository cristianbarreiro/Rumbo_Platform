# Auditoría de integración — 2026-09-17

Inspección estática de los checkouts locales antes de editar. No se consultaron ramas remotas nuevas, no se ejecutaron aplicaciones ni se certificó conectividad IMM.

| Repositorio | Rama / HEAD inspeccionado | Estado inicial |
| --- | --- | --- |
| Rumbo_Platform | main / 0b85ee7f33a730eee662be4d0a064276ca1b79d9 | Documentación y submódulos ya existentes; Web marcado modificado por diferencia de commit |
| Rumbo-v1.0 (`apps/web`) | main / eca370d312d073864a81efab6274bf562958119c | Árbol limpio; pin del padre 6550da48858adea67a39d28f6ac6253998fcc8eb |
| Rumbos (`apps/android`) | detached HEAD / 7511c4c61a923bbf03f03c77110d2b5446714203 | Árbol limpio; coincide con pin del padre |
| cdevstudio_platform | main / d63697dded02334c98b99f33c81bc1de9ea2c9e8 | Cambio preexistente en apps/client-dashboard; solo lectura |

Se verificaron remotos origin, archivos rastreados, modelos, acceso a datos, pruebas, temas e instrucciones. Los dos gitlinks Rumbo ya tienen modo 160000 y `.gitmodules` apunta a los repositorios solicitados. No se alteraron pins ni historial. La evidencia Web describe el checkout observado, no necesariamente el pin anterior del padre.

## Estructura e instrucciones

El padre ya tenía AGENTS.md, README, contratos reservados, documentación de arquitectura/producto/diseño/API, design/ y scripts/setup.ps1. No había skills. Los clientes inspeccionados no contienen README ni AGENTS.md ni skills rastreadas. Mantener setup propio en cada repositorio; no enlazar READMEs inexistentes.

CDev Studio usa apps como submódulos y documentación central. También contiene servicios, base de datos y orquestación npm que no corresponden a Rumbo y no se copiaron. Sus instrucciones son específicas de ese repositorio.

## Clientes

- Web: React/TypeScript, Vite, Express, Leaflet; App.tsx coordina componentes. `src/services/api.ts` consume `/api/transit`; `server.ts` normaliza paradas, vehículos y llegadas. `gtfsScheduleService.ts` aporta horarios. `package.json` define dev/build/start/preview/lint/test; existen package-lock.json y bun.lock. Pruebas TypeScript en test/ cubren normalización, llegadas, integración y panel de parada. Estilos en src/index.css y clases de componentes.
- Android: Kotlin/Compose con Gradle Kotlin DSL, catálogo gradle/libs.versions.toml y módulo app. UI en RumboScreen/RumboViewModel; repositorio con Flows y modelos propios. `TransitRepositoryImpl` consume `MontevideoTransitData` local, no `MontevideoTransitApi`. Retrofit/Moshi y DTOs están declarados, sin acreditar conexión. Pruebas de dominio/selección/búsqueda en RumboTransitLogicTest, además de pruebas Robolectric, capturas e instrumentación. Temas en ui/theme. El mapa usa Canvas Compose, frente a Leaflet en Web.
- El snapshot Android tiene gradle-wrapper.properties pero no scripts gradlew/gradlew.bat ni wrapper JAR rastreados; la reproducibilidad de build requiere resolverlo en su repositorio. No se cambió su build ni firma.

## Plan aplicado

Conservar integración y cambios preexistentes; añadir únicamente dos skills; reforzar reglas globales; extraer contrato conceptual mínimo y diferencias reales; actualizar documentación obsoleta y exclusiones locales. Validar estructura, metadata, enlaces y ausencia de copia de código. Las compilaciones de clientes quedan fuera de esta modificación documental.

## Límites y próximos pasos

La inspección no demuestra equivalencia visual, accesibilidad ni navegación completa. Comparar escenarios ejecutados en una tarea posterior. Revisar por separado si corresponde promover el checkout Web al pin del padre. La presencia de dependencias o DTOs no demuestra funcionalidad activa.
