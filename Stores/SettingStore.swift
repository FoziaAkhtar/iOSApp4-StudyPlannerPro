
import Foundation
import SwiftUI
import Combine

// =========================================
// SETTINGS STORE
// =========================================
// PURPOSE:
// Stores user preferences globally.
// Used across the app via EnvironmentObject
// =========================================

class SettingsStore: ObservableObject {

    // Dark Mode
    @Published var darkMode: Bool = false

    // Notifications
    @Published var notifications: Bool = true

    // Font Size
    @Published var fontSize: Double = 20.0
}
