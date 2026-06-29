
import SwiftUI

// ============================================
// APP ENTRY POINT
// ============================================
// PURPOSE:
// Launches the app and injects shared state
// ============================================

@main
struct StudyPlannerProApp: App {

    // =========================================
    // Shared Settings Object
    // =========================================
    // This object stores user preferences.
    // Every screen can access it.
    // =========================================

    @StateObject private var settings = SettingsStore()

    // =========================================
    // Shared Planner ViewModel (NEW)
    // =========================================
    // This stores ALL study sessions across the app.
    // Now Planner + Progress + Dashboard share data.
    // =========================================

    @StateObject private var plannerVM = PlannerViewModel()

    var body: some Scene {

        WindowGroup {

            // RootView handles navigation flow
            RootView()
                .environmentObject(settings)
                .environmentObject(plannerVM)
        }
    }
}
