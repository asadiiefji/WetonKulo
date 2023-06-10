//
//  DisclosureGroupView.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 10/06/23.
//

import SwiftUI

struct CustomDisclosureGroupStyle<Label: View>: DisclosureGroupStyle {
    let button: Image
    let title1: Label
    let title2: Label
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            VStack(alignment: .leading) {
                title1
                    .font(.system(size: 22, weight: .bold))
                //                        .padding(.horizontal, 10)
                    .padding(.init(top: 10, leading: 10, bottom: 0, trailing: 10))
                title2
                    .font(.system(size: 15, weight: .regular))
                    .padding(.init(top: 0, leading: 10, bottom: 10, trailing: 0))
            }
            Spacer()
            button
                .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 10))
                .rotationEffect(.degrees(configuration.isExpanded ? 180 : 0))
                .font(.system(size: 28, weight: .regular))
        }
        .contentShape(Rectangle())
        
        .background(Color("quaternary"))
        .onTapGesture {
            configuration.isExpanded.toggle()
        }
        .animation(.easeOut(duration: 0.35))
        if configuration.isExpanded {
            configuration.content
                .font(.system(size: 16, weight: .regular))
                .padding()
                .frame(width: screenWidth * 0.7)
                .multilineTextAlignment(.leading)
                .background(Color("quaternary").opacity(0.8))
                .foregroundColor(Color("textColor"))
                .disclosureGroupStyle(self)
        }
    }
}
