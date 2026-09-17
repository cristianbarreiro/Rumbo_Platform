# Android

[Auditoría y versión inspeccionada](audit.md). Kotlin/Jetpack Compose, Gradle Kotlin DSL, módulo app, minSdk 24 y targetSdk 36. Capas data, domain y ui con RumboViewModel y Flows; pruebas de transporte en app/src/test. Tema en ui/theme y mapa Canvas en ui/map/RumboMap.kt.

TransitRepositoryImpl utiliza MontevideoTransitData local. Retrofit, Moshi, OkHttp y Room declarados no prueban integración remota o persistencia activa. No hay paridad de procedencia con Web acreditada.

Abrir apps/android como proyecto independiente. No tiene README rastreado; consultar app/build.gradle.kts, settings.gradle.kts, catálogo Gradle y .env.example. Faltan scripts y JAR del wrapper en el snapshot rastreado; resolver reproducibilidad en el cliente antes de dar comandos de wrapper por disponibles. No se ejecutó compilación ni pruebas Android en esta tarea documental.
