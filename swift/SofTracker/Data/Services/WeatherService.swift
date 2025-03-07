//
// Created by TMA on 02/20/25.
//
import Foundation

class WeatherService {
    func getWeather(city: String, appId: String) async throws -> WeatherData {
        try await NetworkManager.shared.request(.getWeather(city: city, appId: appId), type: WeatherData.self)
    }
}
