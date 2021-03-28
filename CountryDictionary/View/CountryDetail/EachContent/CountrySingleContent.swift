//
//  CountrySingleContent.swift
//  CountryDictionary
//
//  Created by Koro Saka on 2021-03-28.
//

import SwiftUI

struct CountrySingleContent: View {
    let title: String
    let data: String
    let color: Color
    var body: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: 5)
            Text(title)
                .wideStyle()
            Text(data)
                .bold()
                .wideStyle()
                .background(Color.white)
                .cornerRadius(10)
                .padding(5)
        }
        .background(color)
        .cornerRadius(10)
        .shadow(color: .black, radius: 1)
    }
}

struct CountrySingleContent_Previews: PreviewProvider {
    static var previews: some View {
        CountrySingleContent(title: "test title",
                             data: "test data",
                             color: .orange)
    }
}
