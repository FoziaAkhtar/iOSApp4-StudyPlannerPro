
import SwiftUI

struct DashboardView: View {

    // =====================================================
    // ENVIRONMENT
    // =====================================================

    @EnvironmentObject var viewModel: PlannerViewModel

    // =====================================================
    // STATE
    // =====================================================

    @State private var showSettings = false

    var body: some View {

        ScrollView {

            VStack(spacing: 25) {

                // App Logo
                Image(systemName: "graduationcap.fill")
                    .font(.system(size: 90))
                    .foregroundColor(.blue)

                // Welcome Title
                Text("Welcome Back!")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                // Subtitle
                Text("Stay organized and achieve your study goals.")
                    .font(.title3)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)

                // =====================================================
                // LIVE DATA (NEW - IMPORTANT)
                // =====================================================

                VStack(spacing: 10) {

                    Text("Total Sessions: \(viewModel.totalSessions)")
                        .font(.headline)

                    Text("Completed: \(viewModel.completedCount)")
                        .font(.subheadline)

                    Text("Progress: \(Int(viewModel.progress * 100))%")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)

                // Dashboard Cards
                Group {

                    NavigationLink {
                        PlannerView()
                    } label: {
                        CardView(title: "Study Planner", icon: "calendar")
                    }

                    NavigationLink {
                        StudyProgressView()
                    } label: {
                        CardView(title: "Study Progress", icon: "chart.bar.fill")
                    }

                    NavigationLink {
                        SettingsView()
                    } label: {
                        CardView(title: "App Settings", icon: "gearshape.fill")
                    }
                }
                .buttonStyle(.plain)

                Spacer(minLength: 20)
            }
            .padding()
        }

        .navigationTitle("Dashboard")

        .toolbar {

            ToolbarItem(placement: .topBarTrailing) {

                Button {
                    showSettings.toggle()
                } label: {
                    Image(systemName: "gearshape.fill")
                }
                .popover(isPresented: $showSettings) {
                    SettingsPopoverView(isPresented: $showSettings)
                }
            }
        }
    }
}
