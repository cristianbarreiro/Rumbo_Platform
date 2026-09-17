---
name: rumbo-contract-sync
description: Maintain Rumbo domain and data compatibility when changing models, field semantics, API normalization or shared contracts across TypeScript and Kotlin. Use for schema drift and data changes, not purely visual edits or behavior-only UX comparisons.
---

# Rumbo contract sync

Platform owns conceptual meaning; clients own language-specific representations. Start with real names, not hypothetical models. Read `contracts/models/transit.md` for the audited mapping and its unresolved differences.

1. Identify the changed concept and locate its Web and Android representations with targeted searches for model names, interfaces, data classes, DTOs, serializers and tests.
2. Inspect relevant external mapping and platform contracts. Web uses `src/types.ts`, `src/services/api.ts`, normalization in `server.ts` and schedules in `gtfsScheduleService.ts`. Android uses `app/src/main/java/com/example/data/model/`, `data/remote/MontevideoTransitApi.kt`, `data/repository/TransitRepositoryImpl.kt` and `domain/ArrivalPolicy.kt` under that same package root.
3. Compare required/optional fields, nullability, defaults, IDs, relationships, coordinate order, units, timestamps, provenance and unavailable-data behavior. Equal names do not establish compatibility.
4. Classify the change as platform documentation only, client implementation only or shared contract change. Before a shared change, assess Web, Android, external integrations, cached/persisted data, tests and documentation; record migration or compatibility consequences where relevant.
5. Update only genuinely affected layers and appropriate tests. Update conceptual documentation/schema when shared meaning changes. Do not create unused models or require clients to import platform files.
6. Detect accidental drift by checking both representations and affected consumers against the intended meaning. Run relevant client tests/static checks; report omissions and unresolved differences.

## Rumbo-specific boundaries

- `Stop.id` is a Web string; Android `BusStop.id` is a Long. Do not strip prefixes or leading zeros without verifying the real identity mapping.
- Web `UpcomingArrival.etaMinutes` can be null; Android `BusArrival.etaMinutes` cannot. Missing ETA is not zero. Web `source` and Android `isRealTime` do not by themselves prove live provenance.
- Web line variants contain paths and stop IDs; Android `TransitLine` has one route and stop list. Do not flatten variants silently.
- Web bus timestamps are ISO strings; Android uses epoch milliseconds. Verify timezone and conversion at any actual interchange boundary.
- Provider payloads are not automatically domain models. Preserve existing adapters/normalizers where they exist; do not invent endpoints, fields, identifiers or relationships, or introduce a new adapter architecture solely for consistency. Android's declared DTOs are not wired into its audited repository.

Reuse platform documentation, then follow only relevant mappings and consumers. Do not load unrelated UI unless the data change affects it. Use `rumbo-feature-parity` additionally only when user-visible behavior needs cross-client comparison.
