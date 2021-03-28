//
//  MyModifiers.swift
//  CountryDictionary
//
//  Created by Koro Saka on 2021-03-27.
//

import SwiftUI
extension View {
    func sidePadding(size: CGFloat) -> some View {
        self.padding(.init(top: 0,
                           leading: size,
                           bottom: 0,
                           trailing: size))
    }
    
    func upDownPadding(size: CGFloat) -> some View {
        self.padding(.init(top: size,
                           leading: 0,
                           bottom: size,
                           trailing: 0))
    }
    
    func wideStyle()  -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
}
