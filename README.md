# 📘 StudyPlannerPro

A SwiftUI-based iOS study planning application designed to help students organize study sessions, track progress, and manage learning goals efficiently using the MVVM architecture.

---

# 🚀 Features

- 📅 Create study sessions with subject, date, and duration  
- 📊 Track overall study progress in real-time  
- ✅ Mark sessions as completed  
- 🗑 Swipe to delete study sessions  
- 🎯 Progress visualization with circular + linear progress bars  
- ⚙️ Settings panel (Dark Mode, Notifications, Font Size)  
- 💾 Persistent settings using AppStorage  
- 📱 Clean iPad-friendly NavigationSplitView layout  

---

# 🧠 Architecture (MVVM)

This project follows the **MVVM (Model–View–ViewModel)** design pattern.

---

## 📦 Model

**StudySession.swift**

Represents a single study session:

- Subject  
- Study date  
- Study hours  
- Completion status  

---

## 🧠 ViewModel

**PlannerViewModel.swift**

Handles all app logic:

- Add sessions  
- Delete sessions  
- Mark completion  
- Calculate progress  

---

## 🖼 Views

- DashboardView  
- PlannerView  
- StudyProgressView  
- SettingsView  
- RootView  
- WelcomeView  

---

## ⚙️ Store

**SettingsStore.swift**

Manages user preferences using `@AppStorage`:

- Dark Mode  
- Notifications  
- Font Size  

---

# 🧩 Tech Stack

- Swift 5  
- SwiftUI  
- MVVM Architecture  
- Combine (ObservableObject)  
- Xcode 15+  

---

# 📊 Progress Tracking Logic

Progress is automatically calculated:

```swift
progress = completedSessions / totalSessions
