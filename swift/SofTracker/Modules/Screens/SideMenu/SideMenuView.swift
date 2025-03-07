//
// Created by TMA on 02/20/25.
//
import SwiftUI

struct SideMenuView: View {
    // MARK: - Properties

    @Binding var selectedSideMenuTab: Tab
    @Binding var presentSideMenu: Bool

    @State var screenWidth: CGFloat = 0
    @State private var userName: String = UserPreferences.shared.getUser()?.name ?? ""
    @State private var userEmail: String = UserPreferences.shared.getUser()?.email ?? ""
    @State var presentSettingsPage: Bool = false

    // MARK: - Body

    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                Rectangle()
                    .fill(.gray)
                    .frame(width: screenWidth * (2 / 3))
                    .shadow(color: .primarySof.opacity(0.9), radius: 5, x: 0, y: 3)

                VStack(alignment: .center, spacing: 0) {
                    UserInfoView(name: $userName, email: $userEmail)
                        .padding(.top, 100)
                        .padding(.bottom, 40)

                    menuItems

                    Spacer()
                }
                .frame(width: screenWidth * (2 / 3))
                .background(
                    .background.opacity(0.9)
                )
            }
            Rectangle()
                .opacity(0.1)
                .onTapGesture {
                    presentSideMenu.toggle()
                }
        }
        .ignoresSafeArea(.all)
        .onAppear {
            screenWidth = UIScreen.main.bounds.width
            AnalyticsManager.logScreenView(screenName: String(describing: Self.self))
        }
    }

    // MARK: - Menu items

    var menuItems: some View {
        VStack {
            RowView(
                isSelected: $selectedSideMenuTab.wrappedValue == Tab.tab1,
                imageName: "1.circle.fill",
                title: getLocalString("Home"),
                action: {
                    AnalyticsManager.logButtonClickEvent(buttonType: .text, label: "Tab1")
                    selectedSideMenuTab = .tab1
                    presentSideMenu.toggle()
                }
            )
            RowView(
                isSelected: $selectedSideMenuTab.wrappedValue == Tab.tab2,
                imageName: "2.circle.fill",
                title: getLocalString("Profile"),
                action: {
                    AnalyticsManager.logButtonClickEvent(buttonType: .text, label: "Tab2")
                    selectedSideMenuTab = .tab2
                    presentSideMenu.toggle()
                }
            )
        }
    }

    // MARK: - Functions

    func RowView(isSelected: Bool, imageName: String, title: String, hideDivider _: Bool = false,
                 action: @escaping (() -> Void)) -> some View
    {
        Button {
            action()
        } label: {
            VStack(alignment: .leading) {
                HStack(spacing: 20) {
                    Rectangle()
                        .fill(isSelected ? Color.primarySof : .clear)
                        .frame(width: 5)

                    Image(systemName: imageName)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(isSelected ? Color.primarySof : .gray)
                        .frame(width: 26, height: 26)

                    Text(title)
                        .font(.notoSansBold16)
                        .foregroundColor(isSelected ? Color.primarySof.opacity(0.8) : .gray)
                    Spacer()
                }
            }
        }
        .frame(height: 50)
        .background(
            LinearGradient(colors: [isSelected ? .primarySof.opacity(0.2) : .clear, .clear], startPoint: .leading, endPoint: .trailing)
        )
    }

    func updateUserInfo() {
        userName = UserPreferences.shared.getUser()?.name ?? ""
        userEmail = UserPreferences.shared.getUser()?.email ?? ""
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    SideMenuView(selectedSideMenuTab: Binding.constant(Tab.tab1), presentSideMenu: Binding.constant(true))
}
