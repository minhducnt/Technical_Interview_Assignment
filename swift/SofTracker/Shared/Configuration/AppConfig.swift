//
//  Created by TMA on 02/20/25.
//
import Foundation

enum AppConfig {
    // MARK: - Private

    private static let configDict: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("File `info.plist` not found")
        }

        return dict
    }()

    // MARK: - Public

    static let BASE_URL: URL = {
        guard let urlString = configDict[Constants.BASE_URL] as? String else {
            fatalError("Base url not found")
        }

        guard let url = URL(string: urlString) else {
            fatalError("Invalid url")
        }

        return url
    }()

    static let EXAMPLE_KEY: String = {
        guard let key = configDict[Constants.EXAMPLE_KEY] as? String else {
            fatalError("Example key not found")
        }

        return key
    }()
}
