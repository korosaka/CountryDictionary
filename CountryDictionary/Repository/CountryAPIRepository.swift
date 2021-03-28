//
//  CountryAPIRepository.swift
//  CountryDictionary
//
//  Created by Koro Saka on 2021-03-27.
//

import Foundation
class CountryAPIRepository: CountryRepository {
    func fetchCountries(completion: @escaping ([CountryTop]?) -> Void) {
        Network.shared.apollo.fetch(query: CountryListQuery()) { result in
            switch result {
            case .success:
                guard let data = try? result.get().data else {
                    completion(nil)
                    return
                }
                completion(self.extractCountries(countriesData: data.countries))
                return
            case .failure:
                print("Failure! Error: \(result)")
                completion(nil)
                return
            }
        }
    }
    
    private func extractCountries(countriesData: [CountryListQuery.Data.Country]) -> [CountryTop] {
        var countries = [CountryTop]()
        countriesData.forEach {
            let country = CountryTop(code: $0.code, name: $0.name)
            countries.append(country)
        }
        return countries
    }
    
    func fetchCountry(code: String, completion: @escaping (CountryDetail?) -> Void) {
        Network.shared.apollo.fetch(query: CountryQuery(code: code)) { result in
            switch result {
            case .success:
                guard let data = try? result.get().data,
                      let country = data.country
                else {
                    completion(nil)
                    return
                }
                completion(self.extractCountryDetail(countryData: country))
                return
            case .failure:
                print("Failure! Error: \(result)")
                completion(nil)
                return
            }
        }
    }
    
    private func extractCountryDetail(countryData: CountryQuery.Data.Country) -> CountryDetail {
        return CountryDetail(
            name: countryData.name,
            continent: countryData.continent.name,
            flag: countryData.emoji,
            phoneCode: countryData.phone,
            states: self.extractStates(statesData: countryData.states),
            capitalCity: countryData.capital,
            currency: countryData.currency,
            languages: self.extractLanguages(languagesData: countryData.languages))
    }
    
    private func extractStates(statesData: [CountryQuery.Data.Country.State]) -> [String] {
        var states = [String]()
        statesData.forEach {
            states.append($0.name)
        }
        return states
    }
    
    private func extractLanguages(languagesData: [CountryQuery.Data.Country.Language]) -> [String?] {
        var languages = [String?]()
        languagesData.forEach {
            languages.append($0.name)
        }
        return languages
    }
}
