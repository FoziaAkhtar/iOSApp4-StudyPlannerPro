
import Foundation
import SwiftUI
import Combine

// =========================================
// VIEWMODEL
// =========================================
// PURPOSE:
//
// Manages all study sessions.
//
// RESPONSIBILITIES:
//
// ✔ Add sessions
// ✔ Delete sessions
// ✔ Track progress
// =========================================

class PlannerViewModel: ObservableObject {

    // =====================================
    // Published Sessions
    // =====================================

    @Published var sessions: [StudySession] = []

    // =====================================
    // Add Session
    // =====================================

    func addSession(subject: String, date: Date, hours: Double) {

        let session = StudySession(
            subject: subject,
            studyDate: date,
            hours: hours,
            completed: false
        )

        sessions.append(session)
    }

    // =====================================
    // Delete Session
    // =====================================

    func deleteSession(at offsets: IndexSet) {
        sessions.remove(atOffsets: offsets)
    }

    // =====================================
    // Mark Complete
    // =====================================

    func markSessionComplete(id: UUID) {

        if let index = sessions.firstIndex(where: { $0.id == id }) {
            sessions[index].completed.toggle()
        }
    }

    // =====================================
    // Progress Helpers
    // =====================================

    var totalSessions: Int {
        sessions.count
    }

    var completedCount: Int {
        sessions.filter { $0.completed }.count
    }

    var progress: Double {

        guard !sessions.isEmpty else { return 0 }

        return Double(completedCount) / Double(totalSessions)
    }
}
