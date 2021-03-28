//
//  CountryDetailPage.swift
//  CountryDictionary
//
//  Created by Koro Saka on 2021-03-27.
//

import SwiftUI

struct CountryDetailPage: View {
    let CAPITAL = "Capital City"
    let PHONE = "Phone Code"
    let CURRENCY = "Currency"
    let CONTINENT = "Continent"
    
    @ObservedObject var viewModel: CountryDetailPageViewModel
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    Text(viewModel.getEmoji())
                        .font(.largeTitle)
                        .wideStyle()
                    if viewModel.hasCapital {
                        CountrySingleContent(title: CAPITAL,
                                             data: viewModel.getCapitalCity(),
                                             color: .green)
                            .padding(5)
                    }
                    CountrySingleContent(title: PHONE,
                                         data: viewModel.getPhoneCode(),
                                         color: .blue)
                        .padding(5)
                    if viewModel.hasCurrency {
                        CountrySingleContent(title: CURRENCY,
                                             data: viewModel.getCurrency(),
                                             color: .red)
                            .padding(5)
                    }
                    CountrySingleContent(title: CONTINENT,
                                         data: viewModel.getContinent(),
                                         color: .yellow)
                        .padding(5)
                    
                    if viewModel.hasStates {
                        StatesContent(states: viewModel.getStates())
                            .padding(5)
                    }
                    if viewModel.hasLanguages {
                        LanguagesContent(languages: viewModel.getLanguages())
                            .padding(5)
                    }
                    Spacer()
                }
            }
            .background(Color.gray)
            .alert(isPresented: $viewModel.showingError) {
                Alert(title: Text(Constants.TITLE_ERROR),
                      message: Text(Constants.LOADING_ERROR_MESSAGE),
                      dismissButton: .default(Text(Constants.CLOSE))
                )
            }
            if viewModel.isFetching {
                MyIndicator()
            }
        }
        .navigationBarTitle(viewModel.getName(), displayMode: .inline)
        .onAppear {
            viewModel.fetchCountry()
        }
    }
}

struct CountryDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        let repo = DummyCountryRepository()
        let vm = CountryDetailPageViewModel(code: "test", repo: repo)
        CountryDetailPage(viewModel: vm)
    }
}
