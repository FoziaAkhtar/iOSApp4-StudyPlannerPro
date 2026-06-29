
import SwiftUI

// =====================================================
// VIEW: RootView
// =====================================================
// PURPOSE:
// Acts as the main navigation hub of the application.
//
// RESPONSIBILITIES:
// ✔ Display the sidebar menu (iPad)
// ✔ Navigate between screens
// ✔ Display the selected screen
//
// WEEK 6 CONCEPTS
// ✔ NavigationSplitView
// ✔ NavigationLink
// ✔ List
// ✔ Sidebar Navigation
// =====================================================

struct RootView: View {

    // =====================================================
    // MAIN VIEW
    // =====================================================

    var body: some View {

        // =====================================================
        // NAVIGATION CONTAINER 
        // =====================================================

        NavigationSplitView {

            // =====================================================
            // SIDEBAR MENU
            // =====================================================

            List {

                // ==========================================
                // Dashboard
                // ==========================================

                NavigationLink {

                    DashboardView()

                } label: {

                    Label("Dashboard", systemImage: "house.fill")
                }

                // ==========================================
                // Study Planner
                // ==========================================

                NavigationLink {

                    PlannerView()

                } label: {

                    Label("Study Planner", systemImage: "calendar")
                }

                // ==========================================
                // Progress
                // ==========================================

                NavigationLink {

                    StudyProgressView()

                } label: {

                    Label("Study Progress", systemImage: "chart.bar.fill")
                }

                // ==========================================
                // Settings
                // ==========================================

                NavigationLink {

                    SettingsView()

                } label: {

                    Label("Settings", systemImage: "gearshape.fill")
                }
            }

            // =====================================================
            // SIDEBAR TITLE
            // =====================================================

            .navigationTitle("Study Planner")

        } detail: {

            // =====================================================
            // DEFAULT SCREEN
            // =====================================================

            DashboardView()
        }
    }
}

// =====================================================
// PREVIEW
// =====================================================

#Preview {

    RootView()
        .environmentObject(SettingsStore())
}
