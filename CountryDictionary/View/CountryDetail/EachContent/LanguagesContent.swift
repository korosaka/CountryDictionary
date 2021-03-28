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
            ForEach(languages, id: \.self) {
                Text($0).wideStyle()
            }
            .background(Color.white)
        }
        .padding(5)
        .background(Color.purple)
    }
}

struct LanguagesContent_Previews: PreviewProvider {
    static var previews: some View {
        LanguagesContent(languages: ["English", "Japanese"])
    }
}
