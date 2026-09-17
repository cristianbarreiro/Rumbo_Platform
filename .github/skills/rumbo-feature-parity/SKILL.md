---
name: rumbo-feature-parity
description: Compare or port Rumbo user-visible behavior between Web and Android, including flows, map interactions and loading/error/empty states. Use for cross-client feature parity or behavioral drift, not ordinary single-client visual edits or data-only schema changes.
---

# Rumbo feature parity

Parity means the same user intent, business behavior, domain meaning and important states; it does not mean the same files, classes, folders, libraries or framework patterns.

1. Identify the requested behavior and source client, if any. Start with the relevant entry point in `apps/web` or `apps/android`, then inspect the equivalent area in the other client.
2. Reuse `docs/product/features.md`, `docs/architecture/audit.md` and relevant `contracts/models/transit.md` sections. Verify their observations against the current commits.
3. Define common observable behavior: action, result, loading, error, empty, unavailable/stale data and return navigation. Separate legitimate native differences from unresolved drift; do not silently approve existing differences.
4. Inspect relevant models and adapters. If shared data meaning changes, also use `rumbo-contract-sync`.
5. Make minimum changes in affected clients only. Preserve React/TypeScript conventions and Kotlin/Compose conventions. Never blindly copy code, replace native patterns to resemble the other client, refactor unrelated areas, change working equivalent UX or add cross-platform abstraction layers without a demonstrated need.
6. Run affected tests/build/static checks using each client's own configuration. Report unavailable checks explicitly. Compare the same scenario and data provenance in both clients before claiming parity.
7. Report changes, evidence, intentional native differences and remaining gaps. Update only affected product documentation.

## Targeted entry points

- Web: `src/App.tsx`, `src/components/Map/TransitMap.tsx`, `src/components/BottomSheet/StopBottomSheet.tsx`, `src/services/api.ts`; checks in `package.json` and `test/`.
- Android: `app/src/main/java/com/example/ui/RumboScreen.kt`, `RumboViewModel.kt`, `ui/components/`, `ui/map/RumboMap.kt`; tests in `app/src/test/java/com/example/RumboTransitLogicTest.kt` and `app/src/androidTest/`.
- Android's audited repository supplies local transit data; its Retrofit declarations alone do not prove live connectivity. Web supports server normalization and GTFS fallback. Compare provenance as well as displayed minutes.

Do not scan both repositories completely by default. Follow imports only as needed and stop reading unrelated areas once the behavior is understood. Read child instructions if present. Check Git state before editing; a submodule may be detached or ahead of the parent's pin. Do not reset it or advance parent pins automatically.
