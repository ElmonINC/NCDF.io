# ncdf_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the

# NCDF Connect

Cross-platform Flutter prototype for the Nigeria Capital Development Fund. The prototype demonstrates shared sign-in, persona-based workspaces, responsive Android/Windows layouts, administrator access review, security controls, and audit activity.

## Run locally

```powershell
flutter pub get
flutter run -d windows
flutter run -d <android-device-id>
```

The current sign-in and audit data are local demo state. No real identity provider or backend is connected yet.

## Release locally

The release script validates, builds, and packages both platforms into `dist/<version>`:

```powershell
.\tool\release.ps1 -Version 1.0.0 -BuildNumber 1
```

Use an annotated Git tag to publish through GitHub Actions:

```powershell
git tag v1.0.0
git push origin v1.0.0
```

The release workflow runs analysis and tests, builds a Windows ZIP and Android APK, and attaches both artifacts to a GitHub Release. Pull requests and pushes to `main` run the validation workflow.

## Production security requirements

The UI is only a client. Production authorization must be enforced by the backend on every request using short-lived access tokens, refresh-token rotation, server-side role and permission checks, and tenant/module scoping. Never grant administrator access because a client selected the Administrator persona.

Before production, connect an identity provider with MFA and implement:

- deny-by-default RBAC or permission-based authorization
- step-up authentication for privileged actions
- immutable, append-only audit events with actor, target, action, timestamp, request ID, and outcome
- server-side session listing and revocation, device tracking, and timeout policies
- login throttling, breached-password checks, account lockout, and suspicious-login detection
- encrypted transport, encrypted secrets, managed key rotation, and secure database backups
- admin approval or dual control for exports, role changes, session revocation, and emergency read-only mode
- validation at the API boundary, parameterized queries, malware scanning for uploads, and output encoding
- dependency scanning, secret scanning, signed builds, protected branches, required reviews, and release approvals
- privacy retention rules and an incident response process for audit data

The administrator screens in the prototype are a product surface for these capabilities; they are not a substitute for backend enforcement.
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
