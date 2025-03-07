//
// Created by TMA on 02/20/25.
//
import SwiftUI

struct CustomTitleTextFieldView: View {
    var label: LocalizedStringKey
    var placeholder: LocalizedStringKey
    @Binding var inputText: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.notoSansMedium16)
                .foregroundColor(.primarySof)
            CustomTextField(inputText: $inputText, placeholder: placeholder, cornerRadius: 10, borderColor: .primarySof)
        }
    }
}

#Preview {
    CustomTitleTextFieldView(label: "Title", placeholder: "Enter title", inputText: Binding.constant(""))
}
