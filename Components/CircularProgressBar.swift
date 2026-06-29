
// ===================================================
//  CircularProgressBar.swift
//  StudyPlannerPro
// ====================================================
//  Created by Fozia Akhtar
// ====================================================

import SwiftUI

// =====================================================
// COMPONENT: CircularProgressBar
// =====================================================
// PURPOSE:
// Displays study completion as an animated circle.
//
// WEEK 6 TOPICS:
// ✔ Custom Component
// ✔ Trim
// ✔ Animation
// ✔ Accessibility
// =====================================================

struct CircularProgressBar: View {

    // Progress value between 0.0 and 1.0
    var progress: Double

    var body: some View {

        ZStack {

            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: 18)

            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: [.blue, .green]),
                        center: .center
                    ),
                    style: StrokeStyle(
                        lineWidth: 18,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 1), value: progress)

            Text("\(Int(progress * 100))%")
                .font(.largeTitle)
                .bold()
        }

        .frame(width: 180, height: 180)

        .accessibilityLabel("Study Progress")

    }

}

#Preview {

    CircularProgressBar(progress: 0.75)

}
