//
//  TopCountryList.swift
//  CountryDictionary
//
//  Created by Koro Saka on 2021-03-27.
//

import SwiftUI

struct CountryList: View {
    @ObservedObject var viewModel: CountryListViewModel
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    TextField("enter country name",
                              text: $viewModel.filterWord)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .sidePadding(size: 20)
                        .upDownPadding(size: 10)
                        .background(Color.green)
                    List(viewModel.getFilteredCountries(), id: \.id) { country in
                        NavigationLink(destination: CountryDetailPage(viewModel: .init(code: country.code, repo: viewModel.repository))) {
                            CountryListItem(countryName: country.name)
                        }
                    }
                    Spacer()
                }
                .alert(isPresented: $viewModel.showingError) {
                    Alert(title: Text("ERROR"),
                          message: Text("Loding data was failed."),
                          dismissButton: .default(Text("CLOSE"))
                    )
                }
                if viewModel.isFetching {
                    MyIndicator()
                }
            }
            .navigationBarTitle("Country Dictionary", displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CountryList_Previews: PreviewProvider {
    static var previews: some View {
        let repo = DummyCountryRepository()
        let vm = CountryListViewModel(repository: repo)
        CountryList(viewModel: vm)
    }
}

