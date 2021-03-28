//
//  CountryListViewModel.swift
//  CountryDictionary
//
//  Created by Koro Saka on 2021-03-27.
//

import Foundation
class CountryListViewModel: ObservableObject {
    @Published var filterWord = ""
    @Published var countries = [CountryTop]()
    @Published var isFetching = false
    @Published var showingError = false
    
    let repository: CountryRepository
    
    init(repository: CountryRepository) {
        self.repository = repository
        fetchCountries()
    }
    
    func fetchCountries() {
        isFetching = true
        let completion = { (countries: [CountryTop]?) -> Void in
            self.isFetching = false
            guard let _countries = countries else {
                self.showingError = true
                return
            }
            self.countries = _countries
        }
        repository.fetchCountries(completion: completion)
    }
    
    func getFilteredCountries() -> [CountryTop] {
        if filterWord == "" {
            return countries
        }
        var filteredCountries = [CountryTop]()
        countries.forEach {
            if $0.name.lowercased().contains(filterWord.lowercased()) {
                filteredCountries.append($0)
            }
        }
        return filteredCountries
    }
}
