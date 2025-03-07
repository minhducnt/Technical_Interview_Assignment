//
// Created by TMA on 02/20/25.
//
import Foundation
import SwiftUI

class MainTabViewModel: ObservableObject {
    @Published var selectedTab: Tab = .tab1

    let tabs: [Tab] = [.tab1, .tab2]

    func switchToNextTab() {
        if let currentIndex = tabs.firstIndex(of: selectedTab), currentIndex < tabs.count - 1 {
            withAnimation {
                selectedTab = tabs[currentIndex + 1]
            }
        }
    }

    func switchToPreviousTab() {
        if let currentIndex = tabs.firstIndex(of: selectedTab), currentIndex > 0 {
            withAnimation {
                selectedTab = tabs[currentIndex - 1]
            }
        }
    }
}

enum Tab: CaseIterable {
    case tab1
    case tab2
}
