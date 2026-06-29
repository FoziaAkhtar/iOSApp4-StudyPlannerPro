
// ====================================================
//  WelcomeView.swift
//  StudyPlannerPro
//
//  Created by Fozia Akhtar
// ====================================================

import SwiftUI

// ======================================================
// VIEW: WelcomeView
// ======================================================
// PURPOSE:
// First screen users see.
//
// RESPONSIBILITIES:
// ✔ Introduce the app
// ✔ Show app logo
// ✔ Navigate to the Dashboard
// ======================================================

struct WelcomeView: View {

    // Animation state
    @State private var animateLogo = false

    var body: some View {

        VStack(spacing: 30) {

            Spacer()

            // ===================================
            // App Logo
            // ===================================

            Image(systemName: "book.closed.fill")
                .font(.system(size: 120))
                .foregroundColor(.blue)
                .scaleEffect(animateLogo ? 1.1 : 0.9)
                .animation(.easeInOut(duration: 1).repeatForever(), value: animateLogo)

            // ===================================
            // App Title
            // ===================================

            Text("Study Planner Pro")
                .font(.largeTitle)
                .bold()

            // ===================================
            // Subtitle
            // ===================================

            Text("Organize • Plan • Achieve")
                .font(.title3)
                .foregroundColor(.secondary)

            // ===================================
            // Description
            // ===================================

            Text("""
Keep track of study sessions,
set goals,
and monitor your progress.
""")
            .multilineTextAlignment(.center)

            // ===================================
            // Start Button
            // ===================================

            NavigationLink(destination: RootView()) {

                Text("Get Started")

                    .font(.headline)

                    .frame(maxWidth: .infinity)

                    .padding()

                    .background(Color.blue)

                    .foregroundColor(.white)

                    .cornerRadius(15)

            }

            .padding(.horizontal)

            Spacer()

            Text("Created by Fozia Akhtar")

                .foregroundColor(.gray)

                .font(.caption)

        }

        .padding()

        .onAppear {

            animateLogo = true

        }

        .navigationBarBackButtonHidden(true)

    }

}

#Preview {

    WelcomeView()

}
