# Instrucciones para trabajar en Rumbo Platform

## Alcance

Este repositorio coordina `apps/web` (Rumbo-v1.0) y `apps/android` (Rumbos). Son submódulos independientes. Leer las instrucciones propias de cada aplicación antes de modificarla.

## Método

- Leer primero README.md y la documentación pertinente a la tarea; evitar cargar ambos repositorios completos para cambios pequeños.
- Conservar los cambios del usuario y revisar el estado Git del padre y del submódulo afectado.
- Compartir comportamiento, vocabulario, contratos y criterios de diseño. Respetar las convenciones nativas de TypeScript y Kotlin.
- No importar código de una aplicación mediante rutas relativas a la otra.
- Distinguir en la documentación lo observado, lo propuesto y lo pendiente de verificar.
- Actualizar solamente la documentación afectada por cada cambio. Cambiar este archivo cuando cambien las reglas de trabajo o la estructura.
- Para cambios transversales, indicar impacto en ambas plataformas y registrar pendientes de paridad.
- Ejecutar las verificaciones relevantes del proyecto afectado. No afirmar validación si no se ejecutó.
- Mantener secretos, archivos .env, credenciales, keystores y configuración local fuera del repositorio.
- No mover punteros a versiones remotas automáticamente. Revisar los commits seleccionados.
- No presentar datos simulados como transporte en tiempo real verificado.

## Mapa

`docs/architecture`: arquitectura; `docs/product`: alcance y paridad; `docs/design`: criterios visuales; `docs/api`: integración externa; `contracts`: modelos y ejemplos compartidos; `design`: tokens y recursos aprobados; `scripts`: preparación del repositorio.

## Reglas de alcance y contratos

Rumbo Platform es la fuente de verdad del producto: comportamiento -> contrato conceptual compartido -> implementaciones Web y Android independientes. Paridad significa comportamiento visible equivalente, no código o arquitectura idénticos.

Antes de cambiar una función: inspeccionar su implementación, comprobar si existe el concepto en el otro cliente, consultar contratos/documentación relevantes y cambiar solo lo solicitado. No refactorizar, renombrar, rediseñar ni añadir dependencias ajenas al objetivo. No modificar ambos clientes si solo uno lo requiere.

No inventar endpoints, campos, identificadores, relaciones ni comportamiento del proveedor de transporte: verificar la integración existente. No introducir npm workspaces, builds Gradle compuestos ni capas compartidas de UI.

## Skills bajo demanda

- [.github/skills/rumbo-feature-parity/SKILL.md](.github/skills/rumbo-feature-parity/SKILL.md): equivalencia funcional, flujos y estados entre clientes.
- [.github/skills/rumbo-contract-sync/SKILL.md](.github/skills/rumbo-contract-sync/SKILL.md): significado de datos, modelos y normalización.

Leer únicamente la skill correspondiente; ambas solo si el trabajo combina comportamiento y datos. Estas rutas son la fuente canónica y pueden abrirse explícitamente si el agente no descubre .github/skills automáticamente. No cargar ambos repositorios completos por defecto.
