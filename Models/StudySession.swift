
// =======================================
// StudySession.swift
// StudyPlannerPro
// ========================================

import Foundation

// =========================================
// MODEL: StudySession
// =========================================
// PURPOSE:
// Represents one study session.
//
// Each study session stores:
// ✔ Subject
// ✔ Study Date
// ✔ Study Hours
// ✔ Completion Status
// =========================================

struct StudySession: Identifiable {

    // Unique ID

    let id = UUID()

    // Subject name

    var subject: String

    // Date selected

    var studyDate: Date

    // Hours to study

    var hours: Double

    // Finished?

    var completed: Bool

}
