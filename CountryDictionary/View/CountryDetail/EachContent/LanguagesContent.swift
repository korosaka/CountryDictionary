//
//  LanguagesContent.swift
//  CountryDictionary
//
//  Created by Koro Saka on 2021-03-28.
//

import SwiftUI

struct LanguagesContent: View {
    let LANGUAGES = "Languages"
    let languages: [String]
    
    var body: some View {
        VStack(spacing: 0) {
            Text(LANGUAGES)
                .wideStyle()
            Spacer().frame(height: 5)
            VStack(spacing: 0) {
                ForEach(languages, id: \.self) {
                    Text($0).bold().wideStyle()
                }
            }
            .background(Color.white)
            .cornerRadius(10)
        }
        .padding(5)
        .background(Color.purple)
        .cornerRadius(10)
        .shadow(color: .black, radius: 1)
    }
}

struct LanguagesContent_Previews: PreviewProvider {
    static var previews: some View {
        LanguagesContent(languages: ["English", "Japanese"])
    }
}
