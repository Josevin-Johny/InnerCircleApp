# InnerCircleApp

InnerCircleApp is a lightweight iOS assignment project that demonstrates a clean, scalable structure with UIKit and SwiftUI working together via a coordinator-driven navigation flow.

## Goals Covered

* iOS 16 target using UIKit, Swift, and Objective-C
* Root `UINavigationController` with coordinator-based flow
* UIKit login screen with fake authentication
* SwiftUI onboarding inside UIKit
* Reuse of UIKit components inside SwiftUI via `UIViewControllerRepresentable`

## Project Structure

* `InnerCircleApp/App` – App/Scene delegates and app entry setup
* `InnerCircleApp/Coordinators` – Coordinator protocol and `AppCoordinator`
* `InnerCircleApp/Modules/Login` – UIKit login screen + MVVM + fake data layer
* `InnerCircleApp/Modules/Onboarding` – SwiftUI onboarding flow + UIKit reuse
* `InnerCircleApp/Modules/Home` – UIKit home screen (Objective-C)
* `InnerCircleApp/Core` – Shared UI components, extensions, and models
* `InnerCircleApp/Resources` – Assets and launch screen

Each module follows **Clean Architecture** with Domain/Data/Presentation layers for better separation of concerns and testability.

## Architecture Approach

**MVVM-C (Model-View-ViewModel with Coordinators)**

* **ViewModels** handle business logic and state
* **Coordinators** handle all navigation decisions
* **Dependency Injection** throughout - all dependencies passed via initializers
* **Protocol-oriented** design with repository abstractions

This makes the code testable and follows SOLID principles.

## Navigation & Flow

1. Login success routes based on user type:
   * Approved user → Home (UIKit)
   * New user → Onboarding (SwiftUI)
2. Onboarding completion routes to Home.

## Transitions

**UIKit to SwiftUI:** `OnboardingCoordinator` uses `UIHostingController` to present `OnboardingContainerView`.
```swift
let hostingController = UIHostingController(rootView: onboardingView)
navigationController.pushViewController(hostingController, animated: true)
```

**SwiftUI to UIKit:** `LifestylesView` embeds `LifestylesViewController` via `LifestylesRepresentable` (`UIViewControllerRepresentable`).
```swift
struct LifestylesRepresentable: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(onSelection: onSelection)
    }
    
    func makeUIViewController(context: Context) -> LifestylesViewController {
        let vc = LifestylesViewController()
        vc.delegate = context.coordinator
        return vc
    }
}
```

## Technical Stack

* **Frameworks:** UIKit, SwiftUI, Combine
* **Patterns:** MVVM-C, Clean Architecture, Dependency Injection
* **Languages:** Swift, Objective-C
* **iOS Target:** 16.0+

## Scope Notes

This was a 2-day assignment with specific requirements:

**Required:** 12 onboarding steps (intro, connect social, name, job, birthday, height, children, dating intentions, gender, photo selection, lifestyles, confirmation)

**Implemented:** 4 representative screens (Intro, Name, Lifestyles, Confirmation)

Focus was on demonstrating the architectural patterns and UIKit/SwiftUI integration rather than building all screens. The remaining screens would follow identical patterns already established.

## Design Decisions

**Why no dedicated Network Layer?**

Since this uses fake authentication with simulated delays, I kept the auth logic in the Data layer (`FakeAuthDataSource`). In production, this would be refactored to:
* Dedicated Network Manager with URLSession
* API endpoint configuration
* Proper error handling and retry logic
* Response caching

The current structure makes this refactoring straightforward without touching Domain or Presentation layers.

## How to Run

Open `InnerCircleApp.xcodeproj` in Xcode 15+ and run the `InnerCircleApp` scheme on an iOS 16 simulator.

**Test different flows:**
* Email containing "new" (e.g., "new@test.com") + Login → Onboarding flow
* Any other email + Login → Home screen
* "Continue as New User" button → Direct to Onboarding

