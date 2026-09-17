---
type: Domain Contract
title: Contrato conceptual de transporte
description: Significado de paradas, líneas, vehículos y llegadas; diferencias de representación.
sources:
  - id: mapping
    resource: https://github.com/cristianbarreiro/Rumbo_Platform/blob/c1ddc42e4c31d7e1c5fc5b0ade2df62165c6db2e/contracts/models/transit.md
  - id: web
    resource: https://github.com/cristianbarreiro/Rumbo-v1.0/blob/eca370d312d073864a81efab6274bf562958119c/src/types.ts
  - id: android
    resource: https://github.com/cristianbarreiro/Rumbos/blob/7511c4c61a923bbf03f03c77110d2b5446714203/app/src/main/java/com/example/data/model/BusArrival.kt
---

# Contrato conceptual de transporte

Base semántica extraída de los snapshots de ambos clientes, migrada desde contracts/models/transit.md. No es un payload IMM ni un esquema interoperable. La tabla conserva diferencias observadas; no declara paridad completa ni aprobación funcional.[^mapping]

| Concepto y significado | Web (`src/types.ts`) | Android (`data/model/`) | Diferencia que debe preservarse o resolverse explícitamente |
| --- | --- | --- | --- |
| Parada: identidad, código visible, nombre, ubicación y líneas que la sirven | `Stop`: `id`, `code`, `name`, `lat`, `lng`, `lines`, `street1`, `street2` obligatorios; dirección, refugio y accesibilidad opcionales | `BusStop`: `id: Long`, `code`, `name`, `street`, `intersection`, `latitude`, `longitude`; `lines` por defecto vacía | ID Web string frente a Long; no hay conversión de identidad acordada. Código visible no sustituye ID. Web tiene atributos opcionales sin equivalente Android. |
| Coordenadas geográficas | `lat`, `lng`; ruta como pares `[lat, lng]` | `GeoPoint(latitude, longitude)` y listas de puntos | Orden latitud/longitud; `GeoPoint.distanceTo` devuelve metros. Es distinto del orden GeoJSON. |
| Línea y recorrido | `TransitLine`: ID, nombre, operador, color y `variants`; cada `LineVariant` tiene ID, origen, destino, path y stopIds | `TransitLine`: ID, nombre, origen, destino, company, colorHex, routePoints, stopIds | Web contiene varias variantes; Android una ruta por objeto. IDs de parada string frente a Long. Color CSS string frente a Long ARGB. |
| Vehículo en recorrido | `ActiveBus`: ID, línea, variantId, destino, unidad, operador, coordenadas, lastUpdate y equipamiento; bearing y speedKmH opcionales | `ActiveBus`: ID, línea, variant, coordenadas, heading, speedKmh, destino y lastUpdatedEpochMs; varios valores por defecto | `lastUpdate` ISO frente a epoch ms. Android tiene defaults de rumbo/velocidad; no equivalen a medición. `unit` no equivale automáticamente a ID. |
| Próxima llegada de una línea a una parada | `UpcomingArrival`: line, destination, etaMinutes nullable, isImminent, subsequentEtas; source y scheduledTime opcionales | `BusArrival`: line, etaMinutes entero, destination; company, busId, isLowFloor, variant, subsequentEtas, isRealTime con defaults | ETA en minutos; null Web significa línea sin próximo vehículo. Android no representa ese estado con null. La falta de predicción no significa llegada inmediata. |

## Llegadas

Ambos usan un umbral configurable de cinco minutos por defecto para destacar próximas llegadas. Android `DefaultArrivalPolicy` acepta 0..umbral; Web calcula `isImminent` en normalización. El tratamiento de negativos y ausencia de ETA no queda unificado por ese umbral.

Web agrupa resultados en `StopArrivals` con stopId, stopName, updatedAt, isLive y arrivals; lines y hasError son opcionales. Android expone `Flow<Result<List<BusArrival>>>` y estado de UI, sin sobre equivalente.

La procedencia y los límites de los indicadores se describen en [datos de transporte](transport-data.md). `isLowFloor` y `wheelchairAccessible` tampoco prueban exactamente la misma prestación.

## Límites del acuerdo

No hay esquema de intercambio común aprobado, equivalencia global de IDs ni zona horaria compartida verificada. Las representaciones del cuadro describen Web `eca370d` y Android `7511c4c`, no todas sus versiones futuras. Las definiciones nativas respaldan la nulabilidad de ETA y los indicadores mencionados.[^web][^android]

[^mapping]: Mapeo auditado del padre, preservado sin duplicar su contenido en contracts/.
[^web]: Tipos Web del commit inspeccionado.
[^android]: BusArrival del commit Android inspeccionado.
