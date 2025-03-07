//
//  Created by TMA on 02/20/25.
//
import Foundation

enum AppError: Error, Identifiable {
    var id: String { localizedDescription }

    case apiError(String)
    case networkError(Error)
    case serverError(String)
    case decodingError(Error)
    case otherError(String)
    case genericError
    case unauthorizedAccess
    case failedToLoadToken
    case tokenStoringFailed

    var localizedDescription: String {
        switch self {
        case let .apiError(message):
            return message
        case let .networkError(error):
            return "Network error: \(error.localizedDescription)"
        case let .serverError(message):
            return "Server error - \(message)"
        case let .decodingError(error):
            return "Data decoding error: \(error.localizedDescription)"
        case let .otherError(message):
            return message
        case .genericError:
            return "Something went wrong! Please try again."
        case .unauthorizedAccess:
            return "Access denied."
        case .failedToLoadToken:
            return "Something went wrong! Please try again."
        case .tokenStoringFailed:
            return "Failed to store token."
        }
    }
}
