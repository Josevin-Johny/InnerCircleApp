# InnerCircleApp

InnerCircleApp is a lightweight iOS assignment project that demonstrates a clean, scalable structure with UIKit and SwiftUI working together via a coordinator-driven navigation flow.

## Goals Covered
- iOS 16 target using UIKit, Swift, and Objective-C
- Root `UINavigationController` with coordinator-based flow
- UIKit login screen with fake authentication
- SwiftUI onboarding hosted inside UIKit
- Reuse of UIKit components inside SwiftUI via `UIViewControllerRepresentable`

## Project Structure
- `InnerCircleApp/App` – App/Scene delegates and app entry setup
- `InnerCircleApp/Coordinators ` – Coordinator protocol and `AppCoordinator`
- `InnerCircleApp/Modules/Login` – UIKit login screen + MVVM + fake data layer
- `InnerCircleApp/Modules/Onboarding` – SwiftUI onboarding flow + UIKit reuse
- `InnerCircleApp/Modules/Home` – UIKit home screen (Objective-C)
- `InnerCircleApp/Core` – Shared UI components, extensions, and models
- `InnerCircleApp/Resources` – Assets and launch screen

## Navigation & Flow
1. App starts in `SceneDelegate` with a root `UINavigationController`.
2. `AppCoordinator` starts the login flow.
3. Login success routes based on user type:
   - Approved user → Home (UIKit)
   - New user → Onboarding (SwiftUI)
4. Onboarding completion routes to Home.

## UIKit ↔ SwiftUI Transitions
- **UIKit → SwiftUI**: `OnboardingCoordinator` uses `UIHostingController` to present `OnboardingContainerView`.
- **SwiftUI → UIKit**: `LifestylesView` embeds `LifestylesViewController` via `LifestylesRepresentable` (`UIViewControllerRepresentable`).

## Scope Notes
- This was a 2‑day assignment; the onboarding flow is intentionally trimmed to core steps to focus on navigation, UIKit/SwiftUI integration, and architecture.

## Notes
- Login is a fake flow (no backend).
- Lifestyles uses existing UIKit UI and bridges it into SwiftUI.

## How to Run
Open `InnerCircleApp.xcodeproj` in Xcode 15+ and run the `InnerCircleApp` scheme on an iOS 16 simulator.
