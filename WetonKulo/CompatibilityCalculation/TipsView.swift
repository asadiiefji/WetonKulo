//
//  TipsView.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 09/06/23.
//

import SwiftUI

struct TipsView: View {
    
    //    @State var isExpanded = false
    @State var label = "uhuy"
    @State var content = "isinya uhuy"
    
    @State private var collapsedA: Bool = false
    @State private var collapsedB: Bool = false
    @State private var collapsedC: Bool = false
    @ObservedObject var weton : Weton
    
    var body: some View {
        
        NavigationStack{
            ScrollView(showsIndicators: false){
                VStack{
                    Text("Tips")
                        .font(.system(size: 26, weight: .bold))
                        .padding(EdgeInsets(top: 60, leading: 0, bottom: 30, trailing: 0))
                        .foregroundColor(Color("textColor"))
                    
                    Image("imgTips")
                        .resizable()
                        .frame(width: screenWidth * 0.8, height: screenWidth * 0.4)
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
                    
                    
                }
            }
            .padding(.horizontal, screenWidth * 0.1)
            .frame(width: screenWidth, height: screenHeight, alignment: .top)
            .background(Color("primary"))
        }
        
    }
}

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        let weton = Weton()
        TipsView(weton: weton)
    }
}
