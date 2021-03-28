//
//  StatesContent.swift
//  CountryDictionary
//
//  Created by Koro Saka on 2021-03-28.
//

import SwiftUI

struct StatesContent: View {
    let STATES = "States"
    let states: [String]
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: 5)
            Text(STATES)
                .wideStyle()
            ScrollView(.vertical) {
                ForEach(states, id: \.self) {
                    Text($0).wideStyle()
                }
            }
            .frame(height: 150)
            .background(Color.white)
            .padding(5)
        }
        .background(Color.pink)
    }
}

struct StatesContent_Previews: PreviewProvider {
    static var previews: some View {
        StatesContent(states: ["Tokyo", "Osaka", "Fukuoka", "Hokkaido", "Kyoto", "Nagoya", "Chiba", "Aomori", "Hiroshima"])
    }
}
