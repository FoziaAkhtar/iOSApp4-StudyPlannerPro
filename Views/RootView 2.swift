//
//  RootView 2.swift
//  iOSApp4-StudyPlannerPro
//
//  Created by Fozia on 2026-06-28.
//


//
//  RootView.swift
//  StudyPlannerPro
//

import SwiftUI

// ======================================================
// VIEW: RootView
// ======================================================
// PURPOSE:
//
// Main navigation for iPad.
//
// Demonstrates:
// ✔ NavigationSplitView
// ✔ Sidebar Navigation
// ======================================================

struct RootView: View {

    var body: some View {

        NavigationSplitView {

            List {

                NavigationLink("🏠 Dashboard") {

                    DashboardView()

                }

                NavigationLink("📅 Planner") {

                    PlannerView()

                }

                NavigationLink("📈 Progress") {

                    ProgressView()

                }

                NavigationLink("⚙️ Settings") {

                    SettingsView()

                }

            }

            .navigationTitle("Study Planner")

        }

        detail: {

            DashboardView()

        }

    }

}

#Preview {

    RootView()

}
