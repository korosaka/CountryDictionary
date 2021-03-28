//
//  Network.swift
//  CountryDictionary
//
//  Created by Koro Saka on 2021-03-27.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
   
    private(set) lazy var apollo = ApolloClient(
        url: URL(string: "https://countries.trevorblades.com")!)
}
