//
// Created by TMA on 02/20/25.
//
import SwiftUI

struct UserInfoView: View {
    // MARK: - Properties

    @Binding var name: String
    @Binding var email: String

    @State var presentSettingsPage = false

    // MARK: - Body

    var body: some View {
        VStack {
            // MARK: - Image

            Image(systemName: "person.crop.rectangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 100)
                .clipShape(Circle())
                .foregroundColor(.primarySof)

            // MARK: - Title & Email

            TextKeyValueView(key: AppStrings.Name, value: name)
                .padding(.vertical, 8)
                .font(.notoSansBold24)
                .foregroundColor(.primarySof)

            TextKeyValueView(key: AppStrings.Email, value: email)
                .font(.notoSansRegular16)
                .foregroundStyle(.secondary)
                .italic()

            // MARK: - Settings

            HStack {
                Image(systemName: "gearshape")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text(AppStrings.Settings)
                    .font(.notoSansRegular16)
            }
            .padding(.horizontal)
            .frame(height: 40)
            .onTapGesture {
                AnalyticsManager.logButtonClickEvent(buttonType: .secondary, label: "Settings")
                presentSettingsPage = true
            }
            .fullScreenCover(
                isPresented: $presentSettingsPage,
                onDismiss: {
                    updateUserInfo()
                },
                content: {
                    SettingsScreen()
                }
            )
            .foregroundColor(.secondarySof)
        }
    }

    // MARK: - Functions

    func updateUserInfo() {
        name = UserPreferences.shared.getUser()?.name ?? ""
        email = UserPreferences.shared.getUser()?.email ?? ""
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    UserInfoView(
        name: Binding.constant("name"),
        email: Binding.constant("email")
    )
}
