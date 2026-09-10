# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.0] - 2026-09-10

### Added

- French and English localization with a persisted language setting in Settings
- Semantic labels and tooltips on navigation, favorites, images, and form controls
- `flutter_hooks` on Search, Notifications, and Sign up for local UI state
- Integration tests for the sign-in/favorite flow and the add-recipe flow
- Image decode limits (`cacheWidth` / `cacheHeight`) and a fallback when an asset fails to load

### Changed

- Recipe screens now subscribe with `context.select` and `Selector` instead of watching the whole provider
- Notifications, Profile, Reviews, and Settings lists use `ListView.builder`

## [1.1.0] - 2026-08-01

### Added

- Unit and widget tests for repository, provider, validators, reusable widgets, and named routes
- GitHub Actions workflow for `flutter analyze` and `flutter test`
- README screenshots and a requirements mapping in `docs/REQUIREMENTS.md`

### Fixed

- Reviews route resolution

## [1.0.0] - 2026-08-01

### Added

- Recipe Hub screens: splash, sign in, sign up, home, search, detail, reviews, favorites, notifications, profile, settings, and add recipe
- go_router navigation with a shell, bottom nav, and tablet NavigationRail
- RecipeProvider, ThemeProvider, mock repository, and form validation
