//
//  CountryDetailPage.swift
//  CountryDictionary
//
//  Created by Koro Saka on 2021-03-27.
//

import SwiftUI

struct CountryDetailPage: View {
    @ObservedObject var viewModel: CountryDetailPageViewModel
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    Text(viewModel.getEmoji())
                        .font(.largeTitle)
                        .wideStyle()
                    VStack(spacing: 0) {
                        if viewModel.hasCapital {
                            VStack(spacing: 0) {
                                Spacer().frame(height: 5)
                                Text("Capital City")
                                    .wideStyle()
                                Text(viewModel.getCapitalCity())
                                    .wideStyle()
                                    .background(Color.white)
                                    .padding(5)
                            }
                            .background(Color.green)
                            .padding(5)
                        }
                        VStack(spacing: 0) {
                            Spacer().frame(height: 5)
                            Text("Phone Code")
                                .wideStyle()
                            Text(viewModel.getPhoneCode())
                                .wideStyle()
                                .background(Color.white)
                                .padding(5)
                        }
                        .background(Color.blue)
                        .padding(5)
                        if viewModel.hasCurrency {
                            VStack(spacing: 0) {
                                Spacer().frame(height: 5)
                                Text("Currency")
                                    .wideStyle()
                                Text(viewModel.getCurrency())
                                    .wideStyle()
                                    .background(Color.white)
                                    .padding(5)
                            }
                            .background(Color.red)
                            .padding(5)
                        }
                        VStack(spacing: 0) {
                            Spacer().frame(height: 5)
                            Text("Continent")
                                .wideStyle()
                            Text(viewModel.getContinent())
                                .wideStyle()
                                .background(Color.white)
                                .padding(5)
                        }
                        .background(Color.yellow)
                        .padding(5)
                        
                        
                        if viewModel.hasStates {
                            VStack(spacing: 0) {
                                Spacer().frame(height: 5)
                                Text("States")
                                    .wideStyle()
                                ScrollView(.vertical) {
                                    ForEach(viewModel.getStates(), id: \.self) {
                                        Text($0).wideStyle()
                                    }
                                }
                                .frame(height: 150)
                                .background(Color.white)
                                .padding(5)
                            }
                            .background(Color.pink)
                            .padding(5)
                        }
                        if viewModel.hasLanguages {
                            VStack(spacing: 0) {
                                Text("Languages")
                                    .wideStyle()
                                Spacer().frame(height: 5)
                                ForEach(viewModel.getLanguages(), id: \.self) {
                                    Text($0).wideStyle()
                                }
                                .background(Color.white)
                            }
                            .padding(5)
                            .background(Color.purple)
                            .padding(5)
                        }
                        Spacer()
                    }
                }
            }
            .background(Color.gray)
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
