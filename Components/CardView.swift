
// ====================================================
//  CardView.swift
//  StudyPlannerPro
// ===================================================
//  Created by Fozia Akhtar
//
// =====================================================
// COMPONENT: CardView
// =====================================================
// PURPOSE:
// Displays a reusable dashboard card.
//
// This component is used throughout the app to provide
// quick navigation to different sections.
//
// BENEFITS:
// ✔ Reusable UI
// ✔ Consistent Design
// ✔ Hover Animation (iPad)
// ✔ Accessibility Support
// ✔ Easy Maintenance
// =====================================================

import SwiftUI

struct CardView: View {

    // =====================================================
    // CARD PROPERTIES
    // =====================================================

    let title: String

    let icon: String

    // =====================================================
    // STATE
    // =====================================================
    // Tracks whether the mouse pointer is hovering over
    // the card (iPad pointer / Mac Catalyst).
    // =====================================================

    @State private var isHovering = false

    var body: some View {

        HStack(spacing: 20) {

            // =====================================================
            // Card Icon
            // =====================================================

            Image(systemName: icon)

                .font(.system(size: 40))

                .foregroundStyle(.blue)

                .frame(width: 60, height: 60)

                .background(

                    Circle()

                        .fill(Color.blue.opacity(0.15))

                )

            // =====================================================
            // Card Text
            // =====================================================

            VStack(alignment: .leading, spacing: 6) {

                Text(title)

                    .font(.headline)

                    .fontWeight(.bold)

                Text("Tap to open this section")

                    .font(.caption)

                    .foregroundStyle(.secondary)

            }

            Spacer()

            // =====================================================
            // Navigation Arrow
            // =====================================================

            Image(systemName: "chevron.right")

                .font(.headline)

                .foregroundStyle(.gray)

        }

        .padding()

        // =====================================================
        // CARD BACKGROUND
        // =====================================================

        .background(

            RoundedRectangle(cornerRadius: 20)

                .fill(Color(.systemBackground))

        )

        // =====================================================
        // CARD BORDER
        // =====================================================

        .overlay(

            RoundedRectangle(cornerRadius: 20)

                .stroke(Color.blue.opacity(0.20), lineWidth: 1)

        )

        // =====================================================
        // SHADOW
        // =====================================================

        .shadow(

            color: .black.opacity(0.08),

            radius: isHovering ? 12 : 6,

            x: 0,

            y: 6

        )

        // =====================================================
        // HOVER EFFECT
        // =====================================================
        // Demonstrates Week 6 onHover modifier.
        // On iPhone this has no visible effect, but it
        // works on iPad with a pointer and Mac Catalyst.
        // =====================================================

        .scaleEffect(isHovering ? 1.03 : 1.0)

        .animation(

            .easeInOut(duration: 0.25),

            value: isHovering

        )

        .onHover { hovering in

            isHovering = hovering

        }

        // =====================================================
        // ACCESSIBILITY
        // =====================================================

        .accessibilityElement(children: .combine)

        .accessibilityLabel(title)

        .accessibilityHint("Double tap to open")

    }

}

// =====================================================
// PREVIEW
// =====================================================

#Preview {

    VStack(spacing: 20) {

        CardView(

            title: "Study Planner",

            icon: "calendar"

        )

        CardView(

            title: "Study Progress",

            icon: "chart.bar.fill"

        )

        CardView(

            title: "Settings",

            icon: "gearshape.fill"

        )

    }

    .padding()

}
