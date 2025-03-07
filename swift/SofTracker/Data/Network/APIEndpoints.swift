//
//  Created by TMA on 02/20/25.
//
import Alamofire

enum APIEndpoints {
    case getWeather(city: String, appId: String)
    case updateUser(user: User)

    var data: (HTTPMethod, String) {
        switch self {
        case .getWeather: return (.get, "/data/2.5/weather")
        case .updateUser: return (.put, "/api/v1/users")
        }
    }

    // MARK: - Parameters

    var urlParameters: [String: String?] {
        switch self {
        case let .getWeather(city, appId):
            return ["q": city, "appid": appId]
        default:
            return [:]
        }
    }

    var parameters: Encodable? {
        switch self {
        case let .updateUser(user):
            return user
        default:
            return nil
        }
    }
}
