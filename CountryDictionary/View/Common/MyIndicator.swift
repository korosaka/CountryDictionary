//
//  MyIndicator.swift
//  CountryDictionary
//
//  Created by Koro Saka on 2021-03-27.
//

import SwiftUI

struct MyIndicator: View {
    var body: some View {
        ProgressView("DATA LODING.....")
            .foregroundColor(.white)
            .sidePadding(size: 30)
            .upDownPadding(size: 15)
            .background(Color.blue)
            .cornerRadius(20)
    }
}

struct MyIndicator_Previews: PreviewProvider {
    static var previews: some View {
        MyIndicator()
    }
}
