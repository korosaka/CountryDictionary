//
//  CountryListItem.swift
//  CountryDictionary
//
//  Created by Koro Saka on 2021-03-27.
//

import SwiftUI

struct CountryListItem: View {
    let countryName: String
    var body: some View {
        HStack(spacing: 0) {
            Text(countryName)
            Spacer()
        }
    }
}

struct CountryListitem_Previews: PreviewProvider {
    static var previews: some View {
        let dummyCountry = CountryTop(code: "Dummy_Code", name: "Dummy_Country")
        CountryListItem(countryName: dummyCountry.name)
    }
}

