# Rumbo — reglas operativas

## Alcance

Rumbo Platform coordina `apps/web` y `apps/android`, implementaciones independientes del mismo producto.
Paridad significa comportamiento y significado equivalentes, con arquitectura y UI nativas.
No compartir implementación entre clientes ni acoplar sus builds.

## Antes de editar

- Revisar el estado Git del padre y del cliente afectado; conservar trabajo existente.
- Leer las instrucciones locales del área y el código pertinente antes de cambiarlo.
- Si cambia comportamiento o significado compartido, determinar el impacto en el otro cliente.
- Modificar solo las capas afectadas; evitar refactors, renombres, rediseños y dependencias ajenos al pedido.
- No restablecer checkouts ni avanzar pins de submódulos automáticamente; revisar los commits seleccionados.

## Fuentes y lectura bajo demanda

- Reglas operativas: este archivo; procedimientos especializados: las skills enlazadas abajo.
- Conocimiento duradero: [.okf/index.md](.okf/index.md), solo para dudas de arquitectura, semántica, integración o decisiones.
- Implementación real: código y configuración del cliente; README es la entrada humana, no lectura obligatoria de cada tarea.
- Para cambios ordinarios, empezar en la entrada de la función y seguir solo las dependencias necesarias.
- No cargar todo OKF, todas las skills ni escanear ambos clientes por defecto.
- Si código y conocimiento discrepan, investigar intención e historial antes de corregir la fuente desactualizada.
  No cambiar código de producción únicamente para satisfacer documentación obsoleta.

## Integridad y verificación

- No inventar comportamiento, endpoints, campos, identificadores o relaciones del proveedor de transporte.
  Verificar la integración relevante; distinguir datos locales, horarios y mediciones reales.
- Mantener secretos, credenciales, keystores y configuración local fuera del repositorio.
- Ejecutar comprobaciones pertinentes y reportar cuáles se ejecutaron, sus resultados y sus límites.
- Distinguir hechos observados, decisiones adoptadas y propuestas pendientes en la documentación.
- Actualizar solo conocimiento afectado por cambios duraderos de arquitectura, semántica, integración o decisiones.
  Ediciones ordinarias no requieren reescribir OKF; no guardar hipótesis, trazas o notas de sesión allí.

## Skills

- [rumbo-feature-parity](.github/skills/rumbo-feature-parity/SKILL.md): comparación o traslado de comportamiento, flujos y estados entre clientes.
- [rumbo-contract-sync](.github/skills/rumbo-contract-sync/SKILL.md): cambios de significado de datos, modelos o normalización compartida.

Leer solo la skill cuyo propósito coincida; combinar ambas únicamente si cambian comportamiento y datos.
Las rutas son canónicas: abrirlas explícitamente si el agente no descubre `.github/skills`.
