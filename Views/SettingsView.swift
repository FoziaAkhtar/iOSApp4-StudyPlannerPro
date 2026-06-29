
import SwiftUI

// =====================================================
// VIEW: Settings
// =====================================================
// PURPOSE:
// Allows users to customize the app.
// =====================================================

struct SettingsView: View {

    @EnvironmentObject var settings: SettingsStore

    var body: some View {

        Form {

            // Dark Mode
            Toggle("Dark Mode", isOn: $settings.darkMode)

            // Notifications
            Toggle("Notifications", isOn: $settings.notifications)

            // Font Size
            VStack(alignment: .leading) {

                Text("Font Size")

                Slider(
                    value: $settings.fontSize,
                    in: 16...36
                )

                Text("\(Int(settings.fontSize))")
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView()
        .environmentObject(SettingsStore())
}
