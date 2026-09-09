# PETROV - NFPA 25 Fire Pump Inspection App 

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)
![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)

A professional, offline-first mobile application built with Flutter, designed exclusively for field technicians performing centrifugal fire pump performance tests. 

The application digitizes the **F-SER-034** reporting standard, applies pump affinity laws in real-time, validates results against **NFPA 25** criteria, and generates digitally signed PDF reports directly from the field.

---

## Key Features

*   **Offline-First Architecture:** Powered by Isar Database, ensuring technicians can capture data in pump rooms with zero internet connectivity. Data is stored locally and securely.
*   **Real-Time Mathematical Engine:** Automatically calculates Net Pressure and Adjusted Pressure (using affinity laws) as field data is entered.
*   **Instant NFPA 25 Validation:** Visual indicators (PASS/FAIL) alert the technician immediately if the pump falls below the required -5% factory nominal curve threshold.
*   **Performance Curve Plotting:** Dynamic line charts rendering the nominal curve, the NFPA limit curve, and the actual measured performance curve.
*   **Digital Signatures:** Integrated signature pad for technicians and clients to sign off on the inspection.
*   **Automated PDF Generation:** Compiles all nominal data, captured hydraulic points, and signatures into a formally formatted F-SER-034 PDF document ready for sharing or printing.

---

## Tech Stack

*   **Framework:** Flutter (Cross-platform iOS/Android)
*   **State Management:** [Riverpod](https://riverpod.dev/) (Reactive, immutable state)
*   **Local Database:** [Isar](https://isar.dev/) (High-performance NoSQL)
*   **Data Visualization:** `fl_chart`
*   **Report Generation:** `pdf` & `printing`
*   **Biometric Capture:** `signature`

---

## Architecture & Standards

This project adheres to strict software engineering practices to ensure scalability and maintainability:

1.  **Language:** All source code, including variables, classes, methods, and database schemas, is written strictly in **English**.
2.  **Clean Code:** The codebase avoids unnecessary comments. Code is structured to be self-documenting through clear, descriptive naming conventions and modular widget composition.
3.  **Immutability:** State changes are handled via Riverpod's `StateNotifier` and `.copyWith()` pattern, preventing unintended data mutations during complex form navigations.
4.  **UI/UX:** Designed with a clean, industrial-friendly interface using a vertical layout approach (`StepperType.vertical`) to prevent overflow issues on small devices and improve readability during fieldwork.

---

## Getting Started

### Prerequisites

*   [Flutter SDK](https://docs.flutter.dev/get-started/install) (latest stable version)
*   Dart SDK
*   Xcode (for iOS development) / Android Studio (for Android development)

### Installation

1. Clone the repository:
   ```bash
   git clone [https://github.com/your-organization/pump_inspector.git](https://github.com/your-organization/pump_inspector.git)