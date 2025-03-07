//
//  Created by TMA on 02/20/25.
//
import FirebaseCrashlytics

class ErrorHandler {
    static func logError(message: String, error: Error) {
        Crashlytics.crashlytics().log(message)

        let nsError = error as NSError
        Crashlytics.crashlytics().record(error: nsError)
    }
}
