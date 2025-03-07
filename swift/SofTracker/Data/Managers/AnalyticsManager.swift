//
// Created by TMA on 02/20/25.
//
import FirebaseAnalytics
import Foundation

// MARK: - Analytics Manager

class AnalyticsManager {
    static let shared = AnalyticsManager()

    private init() {}

    // Log custom event

    static func logCustomEvent(eventType: EventType, properties: [String: Any]) {
        let event = BaseEvent(eventType: eventType.rawValue, eventProperties: properties)
        shared.track(event: event)
    }

    // Log event

    func track(event: BaseEvent) {
        Analytics.logEvent(event.eventType, parameters: event.eventProperties)
    }

    // Log button click

    static func logButtonClickEvent(buttonType: ButtonType, label: String) {
        let event = BaseEvent(
            eventType: EventType.buttonClick.rawValue,
            eventProperties: ["button_type": buttonType.rawValue, "label": label]
        )
        AnalyticsManager.shared.track(event: event)
    }

    // Log screen view

    static func logScreenView(screenName: String, screenClass: String? = nil) {
        let parameters: [String: Any] = [
            AnalyticsParameterScreenName: screenName,
            AnalyticsParameterScreenClass: screenClass ?? screenName,
        ]
        Analytics.logEvent(AnalyticsEventScreenView, parameters: parameters)
    }
}

// MARK: - Properties

enum ButtonType: String {
    case primary = "Primary"
    case secondary = "Secondary"
    case text = "Text"
    case back = "Back"
    case navigationTab = "Navigation Tab"
}

enum EventType: String {
    case login
    case updateUser = "update_user"
    case buttonClick = "button_click"
}

struct BaseEvent {
    let eventType: String
    let eventProperties: [String: Any]
}
