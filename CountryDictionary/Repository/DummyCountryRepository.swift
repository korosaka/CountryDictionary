//
//  DummyCountryRepository.swift
//  CountryDictionary
//
//  Created by Koro Saka on 2021-03-27.
//

import Foundation
class DummyCountryRepository: CountryRepository {
    func fetchCountries(completion: @escaping ([CountryTop]?) -> Void) {
        
        let dummyData = [CountryTop(code: "Canada_CODE", name: "Canada"),
                         CountryTop(code: "Japan_CODE", name: "Japan"),
                         CountryTop(code: "USA_CODE", name: "USA"),
                         CountryTop(code: "Korea_CODE", name: "Korea"),
                         CountryTop(code: "Brazil_CODE", name: "Brazil"),
                         CountryTop(code: "India_CODE", name: "India")
        ]
        completion(dummyData)
    }
    
    func fetchCountry(code: String, completion: @escaping (CountryDetail?) -> Void) {
        let dummyData = CountryDetail(
            name: "TEST_NAME",
            continent: "TEST_CONTINENT",
            flag: "🇯🇵",
            phoneCode: "TEST_PHONE_CODE",
            states: ["STATE_A", "STATE_B", "STATE_C", "STATE_D", "STATE_E", "STATE_F", "STATE_G", "STATE_H", "STATE_I", "STATE_J", "STATE_K", "STATE_L"],
            capitalCity: "TEST_CAPITAL",
            currency: "TEST_CURRENCY",
            languages: ["LANGUAGE_A", "LANGUAGE_B", "LANGUAGE_C", nil, "LANGUAGE_E"])
        completion(dummyData)
    }
}
