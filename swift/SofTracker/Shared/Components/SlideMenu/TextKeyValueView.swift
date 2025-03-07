//
// Created by TMA on 02/20/25.
//
import SwiftUI

struct TextKeyValueView: View {
    var key: LocalizedStringKey
    var value: String?

    var body: some View {
        Text(value ?? "name")
    }
}

#Preview("Data found", traits: .sizeThatFitsLayout) {
    TextKeyValueView(key: "Name", value: "Nguyễn Thanh Minh Đức")
}

#Preview("Data not found", traits: .sizeThatFitsLayout) {
    TextKeyValueView(key: "Name", value: "User Name")
}
