
import SwiftUI

// =====================================================
// VIEW: PlannerView
// =====================================================
// PURPOSE:
// Allows students to create study sessions.
//
// NOW CONNECTED TO VIEWMODEL (MVVM)
//
// ✔ Saves sessions properly
// ✔ Uses shared PlannerViewModel
// ✔ Clean separation of logic
// ✔ Swipe to delete working
// =====================================================

struct PlannerView: View {

    // =====================================================
    // VIEWMODEL 
    // =====================================================

    @EnvironmentObject var viewModel: PlannerViewModel

    // =====================================================
    // STATE
    // =====================================================

    @State private var subject = "Programming"
    @State private var studyDate = Date()
    @State private var studyHours = 2.0
    @State private var reminders = true

    let subjects = [
        "Programming",
        "Math",
        "Science",
        "Networking",
        "History"
    ]

    var body: some View {

        Form {

            // =====================================================
            // SUBJECT
            // =====================================================

            Section("Course") {

                Picker("Subject", selection: $subject) {

                    ForEach(subjects, id: \.self) {
                        Text($0)
                    }
                }
            }

            // =====================================================
            // DATE
            // =====================================================

            Section("Study Date") {

                DatePicker(
                    "Select Date",
                    selection: $studyDate,
                    displayedComponents: [.date, .hourAndMinute]
                )
            }

            // =====================================================
            // HOURS
            // =====================================================

            Section("Study Hours") {

                Slider(
                    value: $studyHours,
                    in: 1...8,
                    step: 1
                )

                Text("Hours: \(Int(studyHours))")
            }

            // =====================================================
            // REMINDER
            // =====================================================

            Section("Reminder") {

                Toggle(
                    "Enable Reminder",
                    isOn: $reminders
                )
            }

            // =====================================================
            // SAVE BUTTON
            // =====================================================

            Section {

                Button("Save Session") {
                    saveSession()
                }
                .buttonStyle(.borderedProminent)
            }

            // =====================================================
            // LIST OF SAVED SESSIONS (FIXED)
            // =====================================================

            if !viewModel.sessions.isEmpty {

                Section("Saved Sessions") {

                    List {

                        ForEach(viewModel.sessions) { session in

                            VStack(alignment: .leading) {

                                Text(session.subject)
                                    .font(.headline)

                                Text("Hours: \(Int(session.hours))")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .onDelete(perform: viewModel.deleteSession)
                    }
                    .frame(height: 250)
                }
            }
        }
        .navigationTitle("Planner")
    }

    // =====================================================
    // SAVE FUNCTION
    // =====================================================

    private func saveSession() {

        viewModel.addSession(
            subject: subject,
            date: studyDate,
            hours: studyHours
        )
    }
}
