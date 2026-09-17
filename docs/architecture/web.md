# Web

[Auditoría y versión inspeccionada](audit.md). React 19, TypeScript, Vite 6, Express 4 y Leaflet 1.9. Entradas: index.html, src/App.tsx y server.ts. Componentes de mapa, búsqueda y paneles en src/components; modelos en src/types.ts; acceso HTTP en src/services/api.ts; normalización en server.ts y horarios en gtfsScheduleService.ts.

Proyecto independiente en apps/web. No tiene README rastreado en el snapshot auditado: consultar package.json, .env.example y configuración del propio repositorio. Existen package-lock.json y bun.lock; usar el gestor acordado allí. Scripts: dev, build, start, preview, lint y test. `lint` ejecuta TypeScript sin emitir; `test` ejecuta test/*.test.ts con tsx. No se ejecutaron builds o pruebas de aplicación en esta tarea documental.
