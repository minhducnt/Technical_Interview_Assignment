//
// Created by TMA on 02/20/25.
//
import Foundation

@MainActor
class RootViewModel: ObservableObject {
    // MARK: - Attributes

    @Published var isAppStartCompleted: Bool = false
    @Published var isUserDetailsFilled: Bool = UserPreferences.shared.isProfileComplete

    // MARK: - Functions

    func start() async throws {
        guard !isAppStartCompleted else { return }

        // All starting set up will be done here
        // testing load time 2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(Int(2 * 1000))) {
            self.isAppStartCompleted = true
        }
    }

    func setInitialScreenVisitedStatus() {
        isUserDetailsFilled = UserPreferences.shared.isProfileComplete
    }

    func markUserDetailsCompleted() {
        guard !isUserDetailsFilled else { return }

        UserPreferences.shared.isProfileComplete = true
        isUserDetailsFilled = true
    }
}
