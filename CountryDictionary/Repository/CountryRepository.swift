//
//  CountryRepository.swift
//  CountryDictionary
//
//  Created by Koro Saka on 2021-03-27.
//

import Foundation
protocol CountryRepository {
    func fetchCountries(completion: @escaping ([CountryTop]?) -> Void)
    func fetchCountry(code: String, completion: @escaping (CountryDetail?) -> Void)
}
