//
//  Created by TMA on 02/20/25.
//
import SwiftUI

extension Color {
    // Add colors here

    static let primarySof = fromHexString("#f48024")
    static let secondarySof = fromHexString("#50cfff")

    // Other colors

    static func fromHexString(_ hex: String) -> Color {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0

        return Color(red: r, green: g, blue: b)
    }
}
