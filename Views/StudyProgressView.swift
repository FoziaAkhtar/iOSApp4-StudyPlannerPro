
import SwiftUI

// =====================================================
// VIEW: StudyProgressView
// =====================================================
// PURPOSE:
// Displays the student's overall study progress.
//
// WEEK 6 CONCEPTS DEMONSTRATED
// ✔ SwiftUI ProgressView
// ✔ Custom Circular Progress Bar
// ✔ withAnimation
// ✔ Button
// ✔ VStack Layout
// ✔ Accessibility
// =====================================================

struct StudyProgressView: View {

    // =====================================================
    // VIEWMODEL (SHARED)
    // =====================================================

    @EnvironmentObject var viewModel: PlannerViewModel

    var progress: Double {
        viewModel.progress
    }

    var body: some View {

        VStack(spacing: 35) {

            // Screen Title
            Text("Study Progress")
                .font(.largeTitle)
                .fontWeight(.bold)

            // Empty State
            if viewModel.sessions.isEmpty {

                Text("No study sessions yet")
                    .foregroundColor(.secondary)

            } else {

                // Circular Progress
                CircularProgressBar(progress: progress)

                // Linear Progress
                ProgressView(value: progress)
                    .padding(.horizontal)

                // Percentage
                Text("\(Int(progress * 100))% Completed")
                    .font(.title3)
                    .foregroundColor(.secondary)
            }

            // Button
            Button {

                withAnimation(.easeInOut(duration: 0.6)) {

                    if let session = viewModel.sessions.first(where: { !$0.completed }) {
                        viewModel.markSessionComplete(id: session.id)
                    }
                }

            } label: {

                Label("Mark Session Complete", systemImage: "checkmark.circle.fill")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal)
            .accessibilityLabel("Mark Study Session Complete")

            Spacer()
        }
        .padding()
        .navigationTitle("Progress")
    }
}
