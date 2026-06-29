
import SwiftUI

// =====================================================
// VIEW: SettingsPopoverView
// =====================================================

struct SettingsPopoverView: View {

    @Binding var isPresented: Bool

    var body: some View {

        VStack(spacing:20){

            Text("Study Planner Pro")
                .font(.title)

            Text("Version 1.0")

            Button("Close"){

                isPresented = false

            }

            .buttonStyle(.borderedProminent)

        }

        .padding()

        .frame(width:250)

    }

}

#Preview{

    SettingsPopoverView(isPresented: .constant(true))

}
