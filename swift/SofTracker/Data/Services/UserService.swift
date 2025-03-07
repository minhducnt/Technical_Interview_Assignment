//
// Created by TMA on 02/20/25.
//
import Foundation

class UserService {
    static func updateUser(user: User) async throws -> User {
        try await NetworkManager.shared.request(.updateUser(user: user), type: User.self)
    }
}
