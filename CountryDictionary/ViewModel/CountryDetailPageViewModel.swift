//
//  CountryDetailPageViewModel.swift
//  CountryDictionary
//
//  Created by Koro Saka on 2021-03-27.
//

import Foundation
class CountryDetailPageViewModel: ObservableObject {
    @Published var detailInfo: CountryDetail?
    @Published var isFetching = false
    @Published var showingError = false
    
    let code: String
    let repository: CountryRepository
    var hasStates: Bool {
        return getStates().count > 0
    }
    var hasLanguages: Bool {
        return getLanguages().count > 0
    }
    
    init(code: String, repo: CountryRepository) {
        self.code = code
        repository = repo
    }
    
    func fetchCountry() {
        isFetching = true
        let completion = { (countryInfo: CountryDetail?) -> Void in
            self.isFetching = false
            guard let _countryInfo = countryInfo else {
                self.showingError = true
                return
            }
            self.detailInfo = _countryInfo
        }
        repository.fetchCountry(code: code, completion: completion)
    }
    
    func getName() -> String {
        guard let _detailInfo = detailInfo else { return "----" }
        return _detailInfo.name
    }
    
    func getCapitalCity() -> String {
        guard let capital = detailInfo?.capitalCity else { return "----" }
        return capital
    }
    
    func getCurrency() -> String {
        guard let currency = detailInfo?.currency else { return "----" }
        return currency
    }
    
    func getEmoji() -> String {
        guard let _detailInfo = detailInfo else { return "----" }
        return _detailInfo.flag
    }
    
    func getPhoneCode() -> String {
        guard let _detailInfo = detailInfo else { return "----" }
        return _detailInfo.phoneCode
    }
    
    func getContinent() -> String {
        guard let _detailInfo = detailInfo else { return "----" }
        return _detailInfo.continent
    }
    
    func getStates() -> [String] {
        guard let _detailInfo = detailInfo else { return [String]() }
        return _detailInfo.states
    }
    
    func getLanguages() -> [String] {
        var languages = [String]()
        guard let _detailInfo = detailInfo else { return languages }
        for language in _detailInfo.languages {
            guard let _language = language else { continue }
            languages.append(_language)
        }
        return languages
    }
}
