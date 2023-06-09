//
//  TipsView.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 09/06/23.
//

import SwiftUI

struct TipsView: View {
    
    @State private var collapsedA: Bool = false
    @State private var collapsedB: Bool = false
    @State private var collapsedC: Bool = false
    @ObservedObject var weton : Weton
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        NavigationStack{
            
            ZStack {
                Button {
                    dismiss()
                } label: {
//                        HStack(spacing: 0){
                        Image(systemName: "chevron.backward.circle")
                            .font(.system(size: 30, weight: .regular))
//                            Text("Back")
//                        }
                    .foregroundColor(Color("tertiary"))
                    
                }
                .position(x: 0, y: 60)
                .zIndex(4)
                
                ScrollView(showsIndicators: false){
                    VStack{
                        Text("Tips")
                            .font(.system(size: 24, weight: .semibold))
                            .padding(EdgeInsets(top: 60, leading: 0, bottom: 30, trailing: 0))
                            .foregroundColor(Color("textColor"))
                        
                        Image("tips")
                            .resizable()
                            .frame(width: screenWidth * 0.8, height: screenHeight * 0.3)
                            .padding(.bottom, 20)
                        
                        VStack(spacing: 10) {
                            DisclosureGroup(
                                "label",
                                isExpanded: $collapsedA
                            ) {
                                Text("\(weton.getFiveCycles().tips)")
                            }
                            .disclosureGroupStyle(
                                CustomDisclosureGroupStyle(
                                    button: Image(systemName: "chevron.down.circle"),
                                    title1: Text("\(weton.getFiveCycles().result)"),
                                    title2: Text("Metode 5 Siklus")
                                )
                            )
                            .cornerRadius(10, corners: .allCorners)
                            .foregroundColor(Color("textColor"))
                            
                            DisclosureGroup(
                                "label",
                                isExpanded: $collapsedB
                            ) {
                                Text("\(weton.getSevenCycles().tips)")
                            }
                            .disclosureGroupStyle(
                                CustomDisclosureGroupStyle(
                                    button: Image(systemName: "chevron.down.circle"),
                                    title1: Text("\(weton.getSevenCycles().result)"),
                                    title2: Text("Metode 7 Siklus")
                                )
                            )
                            .cornerRadius(10, corners: .allCorners)
                            .foregroundColor(Color("textColor"))
                            
                            DisclosureGroup(
                                "label",
                                isExpanded: $collapsedC
                            ) {
                                Text("\(weton.getEightCycles().tips)")
                            }
                            .disclosureGroupStyle(
                                CustomDisclosureGroupStyle(
                                    button: Image(systemName: "chevron.down.circle"),
                                    title1: Text("\(weton.getEightCycles().result)"),
                                    title2: Text("Metode 8 Siklus")
                                )
                            )
                            .cornerRadius(10, corners: .allCorners)
                            .foregroundColor(Color("textColor"))
                            
                        }
                        .padding(.bottom, 80)
                        
                    }
                }
            }
            
            .padding(.horizontal, screenWidth * 0.1)
            .frame(width: screenWidth, height: screenHeight, alignment: .top)
            
        .background(Color("primary"))
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        let weton = Weton()
        TipsView(weton: weton)
    }
}
