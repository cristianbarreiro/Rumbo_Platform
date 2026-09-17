# Contrato conceptual de transporte

Base inicial extraída del código, no contrato de red IMM ni esquema JSON interoperable. Fuentes y commits: [auditoría](../../docs/architecture/audit.md). El acuerdo compartido es el significado; las representaciones siguen siendo propias de cada cliente. Las diferencias registradas no certifican compatibilidad completa.

| Concepto y significado | Web (`src/types.ts`) | Android (`data/model/`) | Diferencia que debe preservarse o resolverse explícitamente |
| --- | --- | --- | --- |
| Parada: identidad, código visible, nombre, ubicación y líneas que la sirven | `Stop`: `id`, `code`, `name`, `lat`, `lng`, `lines`, `street1`, `street2` obligatorios; dirección, refugio y accesibilidad opcionales | `BusStop`: `id: Long`, `code`, `name`, `street`, `intersection`, `latitude`, `longitude`; `lines` por defecto vacía | ID Web string frente a Long; no convertir sin verificar identidad. Código visible no sustituye ID. Web tiene atributos opcionales sin equivalente Android. |
| Coordenadas geográficas | `lat`, `lng`; ruta como pares `[lat, lng]` | `GeoPoint(latitude, longitude)` y listas de puntos | Mantener latitud/longitud y su orden; `GeoPoint.distanceTo` devuelve metros. No tratar pares como orden GeoJSON. |
| Línea y recorrido | `TransitLine`: ID, nombre, operador, color y `variants`; cada `LineVariant` tiene ID, origen, destino, path y stopIds | `TransitLine`: ID, nombre, origen, destino, company, colorHex, routePoints, stopIds | Web contiene varias variantes; Android una ruta por objeto. IDs de parada string frente a Long. Color CSS string frente a Long ARGB. |
| Vehículo en recorrido | `ActiveBus`: ID, línea, variantId, destino, unidad, operador, coordenadas, lastUpdate y equipamiento; bearing y speedKmH opcionales | `ActiveBus`: ID, línea, variant, coordenadas, heading, speedKmh, destino y lastUpdatedEpochMs; varios valores por defecto | `lastUpdate` ISO frente a epoch ms. Android tiene defaults de rumbo/velocidad; no equivalen a medición. `unit` no equivale automáticamente a ID. |
| Próxima llegada de una línea a una parada | `UpcomingArrival`: line, destination, etaMinutes nullable, isImminent, subsequentEtas; source y scheduledTime opcionales | `BusArrival`: line, etaMinutes entero, destination; company, busId, isLowFloor, variant, subsequentEtas, isRealTime con defaults | ETA en minutos; null Web significa línea sin próximo vehículo. Android no representa ese estado con null. No convertir falta de predicción en llegada inmediata. |

## Llegadas y procedencia

Ambos usan un umbral configurable de cinco minutos por defecto para destacar próximas llegadas. Android `DefaultArrivalPolicy` acepta 0..umbral; Web calcula `isImminent` en normalización. Verificar negativos y ausencia de ETA antes de trasladar políticas.

Web agrupa resultados en `StopArrivals` con stopId, stopName, updatedAt, isLive y arrivals; lines y hasError son opcionales. Android expone `Flow<Result<List<BusArrival>>>` y estado de UI, sin sobre equivalente.

Web distingue `live`/`scheduled` mediante `source` opcional y contempla GTFS. Android usa datos locales en el repositorio auditado; `isRealTime = true` por defecto no acredita datos reales. Estos indicadores no son intercambiables sin revisar productores. Tampoco `isLowFloor` y `wheelchairAccessible` prueban exactamente la misma prestación.

## Uso y evolución

Los contratos documentan semántica sin acoplar compilaciones ni generar modelos. Para cambios compartidos revisar ambas representaciones, normalizadores, consumidores, cachés/persistencia y pruebas. Registrar campos afectados, compatibilidad y diferencias deliberadas. No hay esquema de intercambio común aprobado, equivalencia global de IDs, zona horaria compartida ni contrato IMM verificado. No introducirlos por inferencia.
