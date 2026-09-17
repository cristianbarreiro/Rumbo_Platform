# Matriz de paridad

Observaciones estáticas de los [commits auditados](../architecture/audit.md), no certificación funcional. Paridad significa igual intención, significado y estados importantes, con implementación nativa.

| Área | Web | Android | Pendiente |
| --- | --- | --- | --- |
| Mapa | Leaflet, TransitMap | Canvas, RumboMap | Comparar selección, encuadre, gestos y estados con mismo escenario |
| Búsqueda | API y fallback local; tipo permite line/stop/place | Repositorio local; LineResult/StopResult | Comparar cobertura, orden y vacío; tipo place no prueba implementación equivalente |
| Llegadas | Normalización servidor, ETA nullable, origen live/scheduled y horarios GTFS | Datos locales, ETA entero, isRealTime con default true | Resolver procedencia y ausencia de predicción antes de declarar paridad |
| Líneas | Variantes con rutas y stopIds | Una ruta y stopIds por TransitLine | Acordar representación de variantes sin perder significado |
| Navegación | App.tsx y paneles React | ViewModel con jerarquía Atrás probada en código | Ejecutar escenarios de retorno y selección |
| Diseño/accesibilidad | CSS/Tailwind y componentes | Material/Compose y ui/theme | Comparar capturas, lectores de pantalla y estados; no se aprobó paridad visual |

Consultar [contrato conceptual](../../contracts/models/transit.md). No corregir automáticamente estas diferencias al realizar cambios ajenos a ellas.
