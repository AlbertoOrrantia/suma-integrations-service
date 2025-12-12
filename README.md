# 🤠 Howdy! 🚀 Suma Connect Backend: Integrations Service (V1.0.0)

[![Vapor](https://img.shields.io/badge/Vapor-333333?style=for-the-badge&logo=vapor)](https://vapor.codes/) 
[![Swift](https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift)](https://www.swift.org/)
[![Storage](https://img.shields.io/badge/Storage-InMemory-ff69b4?style=for-the-badge&logo=github)](https://github.com/AlbertoOrrantia)

Hello, I'm **Alberto Orrantia**, the lead developer for the **Suma Connect** integration service.

This repository holds the **Vapor backend** for the service. It provides the RESTful API endpoints, business logic, and database persistence required by the iOS client. This is the **Minimum Viable Product (MVP)**, establishing the core architecture for future development.

---

## 🌟 Highlights

* **100% Swift:** Uniform language stack with the iOS client.
* **Semantic Versioning (SemVer):** Follows the `MAJOR.MINOR.PATCH` convention for predictable releases.
* **Clear Development Host:** Configured for seamless testing with physical iOS devices.
* **Architecture:** Uses a clean, component-based structure (e.g., Controllers, Models, Repositories).
* **In-Memory Storage:** Uses dictionaries for rapid prototyping and testing, simplifying the MVP setup.

## ⬇️ Installation and Setup

### Prerequisites & Dependencies

| Requirement | Minimal Specs | Recommended (Developer System) | Dependencies |
| :--- | :--- | :--- | :--- |
| **Swift** | Swift 5.8+ | Swift 5.9+ | Vapor, FluentKit, SQLiteNIO |
| **Operating System** | macOS 13+ | macOS 14 (Sonoma) | N/A |
| **IDE** | Xcode 14+ | Xcode 15+ | N/A |

### Quick Start (Cloning & Running)

Follow these steps to get the service running locally:

1.  **Clone the Repository:**
    ```bash
    git clone https://github.com/AlbertoOrrantia/suma-integrations-service
    ```

2.  **Generate Xcode Project:**
    ```bash
    swift package generate-xcodeproj
    ```

3.  **Open in Xcode:**
    ```bash
    open suma-integrations-service.xcodeproj
    ```
4.  **Run Server:** Select the **Run** scheme in Xcode and press **Command + R** (or the Play button).

---

## 💻 Architecture Overview

The backend uses a standard **Model-View-Controller (MVC)** pattern (adapted as **Route-Controller-Model** for API services) to efficiently separate concerns.

| Component | Role | Location | Quick Find |
| :--- | :--- | :--- | :--- |
| **Models** | Data structures and ORM definitions (Fluent). | `Sources/App/Models/` | Database schema and Swift structs (e.g., `User`). |
| **Controllers** | Handle API requests and core business logic. | `Sources/App/Controllers/` | Logic for specific endpoints (e.g., `LoginController`). |
| **Routes** | Defines the API endpoints. | `Sources/App/routes.swift` | Maps URLs to Controller functions. |

## 🚨 Critical Development Note

The `Entrypoint.swift` file sets the server hostname to **`0.0.0.0`**. This is **REQUIRED** for physical iOS devices (using a local IP like `192.168.x.x`) to connect to the server running on your Mac.

* *Note:* This configuration does **not** affect local testing via `127.0.0.1` or the iOS Simulator.

---

## 🧪 Testing Strategy (V1.0.0 State)

Due to MVP timelines and necessary trade-offs, testing for the V1.0.0 release was limited:

* **Integration/Manual Testing:** Primary testing focused on manual console validation and client-server integration tests via the iOS application.
* **Unit Tests (Future):** Unit test coverage was deferred to the V2 roadmap. Future developers must establish full unit testing across the Services, Controllers, and Repositories layers to ensure code quality and prevent regression.

---

## 🌱 Branching Strategy

This repository utilizes a simple, professional flow based on **Git Feature Branching**.

### Branch Structure

| Branch Name | Role | Purpose |
| :--- | :--- | :--- |
| **main** | Stable/Production | Contains tagged, stable release versions (v1.0.0, v1.1.0...). |
| **development** | Integration/Active | The active branch for continuous integration and testing. |
| **feature/\*** | Work-in-Progress | Branches for single modules, features, or fixes (e.g., `feature/login-ui`, `fix/networking-bug`). |

### Workflow

1.  **Create:** Create a new branch (e.g., `feature/module-name`) from `development`.
2.  **Commit:** Implement changes with incremental commits.
3.  **Review:** Open a Pull Request (PR) when complete.
4.  **Merge:** Merge the PR into `development`.
5.  **Release:** When a version is complete, merge `development` into `main` and create a corresponding Git Tag (e.g., `v1.1.0`).

---

## 🛣️ Future Roadmap (V2.0.0 Goals)

This is the **V1.0.0** foundation. The next major version (V2.0.0) will focus on essential architectural upgrades for production readiness:

* **Implement `async/await`:** Integrate modern Swift concurrency for improved performance and code readability. (The current MVP does not utilize `async/await`).
* **Real Database Connection:** Migrate from SQLite to a robust production database (e.g., PostgreSQL or MySQL) to handle scalability and real data.
* **Security and Authentication:** Implement real JWT authentication instead of the current mock logic.

## 🏷️ Versioning

This project strictly adheres to **Semantic Versioning (SemVer): `MAJOR.MINOR.PATCH`**.

* **MAJOR (X.0.0):** Breaking changes, API incompatibilities (e.g., V1.0.0 -> V2.0.0).
* **MINOR (0.X.0):** Addition of new, backward-compatible features (e.g., V1.0.0 -> V1.1.0).
* **PATCH (0.0.X):** Small, backward-compatible bug fixes (e.g., V1.0.0 -> V1.0.1).

## 💬 Feedback and Contribution

We encourage feedback on the project's architecture and performance. If you have suggestions or encounter an issue, please open an Issue or start a Discussion.
