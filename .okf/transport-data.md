---
type: Integration Reference
title: Procedencia de datos de transporte
description: Límites entre datos locales, horarios, normalización y conexión verificada.
sources:
  - id: web
    resource: https://github.com/cristianbarreiro/Rumbo-v1.0/blob/eca370d312d073864a81efab6274bf562958119c/server.ts
  - id: android
    resource: https://github.com/cristianbarreiro/Rumbos/blob/7511c4c61a923bbf03f03c77110d2b5446714203/app/src/main/java/com/example/data/repository/TransitRepositoryImpl.kt
  - id: arrival
    resource: https://github.com/cristianbarreiro/Rumbos/blob/7511c4c61a923bbf03f03c77110d2b5446714203/app/src/main/java/com/example/data/model/BusArrival.kt
  - id: audit
    resource: https://github.com/cristianbarreiro/Rumbo_Platform/blob/c1ddc42e4c31d7e1c5fc5b0ade2df62165c6db2e/docs/architecture/audit.md
---

# Procedencia de datos de transporte

## Dominio y proveedor

El significado Rumbo se expresa en el [contrato conceptual](transport-model.md). Un payload externo y un modelo interno tienen responsabilidades distintas: campos o defaults internos no demuestran que el proveedor haya entregado esa información. Web ya normaliza paradas, vehículos y llegadas antes de exponerlos a su UI.[^web]

## Evidencia y significado

En Web `eca370d`, el servidor contempla llegadas en vivo y fallback de horarios GTFS; `source` puede distinguir live/scheduled. Un horario calculado no constituye una posición medida ni una predicción en vivo. La inspección del código no certifica disponibilidad del proveedor.[^web]

En Android `7511c4c`, TransitRepositoryImpl obtiene datos de MontevideoTransitData local, sin conectar sus declaraciones Retrofit. El default `BusArrival.isRealTime = true` no acredita procedencia remota. Los indicadores de ambos clientes no son intercambiables sin considerar sus productores.[^android][^arrival]

## Límite de integración

No existe un contrato IMM validado en el superproyecto. Endpoints, autenticación, unidades, identificadores, licencias, límites y errores del proveedor carecen aquí de verificación oficial y funcional. Las declaraciones de API no constituyen esa evidencia. Los datos locales o calculados no prueban conexión en tiempo real.[^audit]

Esta diferencia de implementación es un gap observado, no una decisión de que Android deba permanecer local. La [matriz de paridad](../docs/product/features.md) registra seguimiento; las notas de ejecución o debugging no forman parte de este concepto.

[^web]: Normalizadores y manejo de llegadas en el servidor Web inspeccionado.
[^android]: Productor local del repositorio Android inspeccionado.
[^arrival]: Default del modelo Android; no evidencia de una llamada al proveedor.
[^audit]: Auditoría estática; no incluyó certificación de conectividad.
