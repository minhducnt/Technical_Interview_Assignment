//
// Created by TMA on 02/20/25.
//
import SwiftUI

struct CountryView: View {
    @Binding var selectedCountry: String

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(AppStrings.SelectCountry)
                    .font(.notoSansMedium16)
                    .foregroundColor(.primarySof)
                Picker(AppStrings.SelectCountryPlaceHolder, selection: $selectedCountry) {
                    ForEach(Constants.countriesOptions, id: \.self) {
                        country in
                        Text(getLocalString(country))
                    }
                }
                .pickerStyle(DefaultPickerStyle())

                Spacer()
            }
        }
    }
}

struct GenderView: View {
    @Binding var selectedGender: Gender

    var body: some View {
        VStack(alignment: .leading) {
            Text(AppStrings.Gender)
                .font(.notoSansMedium16)
                .foregroundColor(.primarySof)
            Picker(AppStrings.GenderPlaceHolder, selection: $selectedGender) {
                ForEach(Gender.allCases) { gender in
                    Text(getLocalString(gender.rawValue)).tag(gender)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}
