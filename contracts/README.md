# Contratos compartidos

Rumbo Platform mantiene el significado común; cada cliente mantiene sus modelos y adaptadores nativos.

- [Transporte](models/transit.md): parada, ubicación, línea/recorrido, vehículo y llegada, extraídos de ambas implementaciones con diferencias explícitas.
- `schemas/` y `examples/`: áreas preexistentes pendientes; no hay esquema de intercambio aprobado ni validación compartida configurada.

No importar estos documentos desde las aplicaciones ni confundirlos con payloads del proveedor. Antes de cambiar significado, evaluar identificadores, nulabilidad, unidades, tiempo, procedencia, cachés/persistencia, pruebas y documentación mediante `rumbo-contract-sync`.
