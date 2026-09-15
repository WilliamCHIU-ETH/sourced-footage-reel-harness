# GTA interest v0.2 evidence

This directory is immutable evidence for the measurement announced at `2026-08-30T12:46:51Z`.

- The locked premeasurement SHA-256 matched before any request.
- Batch A item A01 was attempted exactly once with public unauthenticated curl and failed with curl exit `56` / HTTP `403`.
- `-fL` retained response headers but produced no raw body on the HTTP error; the body path is intentionally absent rather than fabricated.
- A02–A04 and both Batch B items were not run under the declared stop condition.
- The normalized TSVs preserve null measured fields and `NOT_VALIDATED`; they are not successful post identity records.
- Response `Set-Cookie` fields, if present, are server-sent raw headers. No request cookie or authentication material was supplied.
- No retry, alternate endpoint, alternate source, login, or credential was used.
