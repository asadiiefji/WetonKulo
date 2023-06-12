//
//  ResultCompatibilityView.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 09/06/23.
//

import SwiftUI

struct ResultCompatibilityView: View {
    @ObservedObject var weton : Weton
    let profileType: ProfileType
    
    @State var nextPage: Bool = false
    
    @StateObject private var navigateManager = NavigationManager()
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.brown
                VStack{
                    Text("Hasil Perhitungan")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    VStack{
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20){
                                VStack(alignment: .center, spacing: 20){
                                    Text("5 Siklus")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .frame(height: screenHeight / 10)
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                                        )
                                    Text("\(weton.getFiveCycles().result)")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .frame(width: screenWidth / 2, height: screenHeight / 20)
                                        .padding(EdgeInsets(top: 100, leading: 0, bottom: 35, trailing: 0))
                                    
                                    
                                    Text("\(weton.getFiveCycles().tips)")
                                        .multilineTextAlignment(.leading)
                                        .frame(width: 300)
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                    Spacer()
                                    
                                }
                                .frame(width: 340, height: 560)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color(white: 0.4))
                                )
                                .shadow(radius: 3)
                                .padding(25)
                                Spacer()
                                VStack(spacing: 20){
                                    Text("7 Siklus")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .frame(height: screenHeight / 10)
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                                        )
                                    
                                    Text("\(weton.getSevenCycles().result)")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .frame(width: screenWidth / 2, height: screenHeight / 20)
                                        .padding(EdgeInsets(top: 100, leading: 0, bottom: 35, trailing: 0))
                                    
                                    
                                    Text("\(weton.getSevenCycles().tips)")
                                        .multilineTextAlignment(.leading)
                                        .frame(width: 300)
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                    Spacer()
                                    
                                }
                                .frame(width: 340, height: 560)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                .cornerRadius(20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color(white: 0.4))
                                )
                                .shadow(radius: 3)
                                
                                Spacer()
                                VStack(spacing: 20){
                                    Text("8 Siklus")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .frame(height: screenHeight / 10)
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                                        )
                                    
                                    Text("\(weton.getEightCycles().result)")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .frame(width: screenWidth / 2, height: screenHeight / 20)
                                        .padding(EdgeInsets(top: 100, leading: 0, bottom: 35, trailing: 0))
                                    
                                    
                                    Text("\(weton.getEightCycles().interpretation)")
                                        .multilineTextAlignment(.leading)
                                        .frame(width: 300)
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                    Spacer()
                                }
                                .frame(width: 340, height: 560)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color(white: 0.4))
                                )
                                .shadow(radius: 3)
                                .padding(25)
                            }
                        }
                        
                        
                    }
                    HStack(alignment: .bottom, spacing: 0) {
                        Spacer()
                        Button("Tips") {
                            navigateManager.navigateTo(.card)
                        }
                        .buttonStyle(NavigationButtonStyle(color: Color(hue: 0.084, saturation: 0.419, brightness: 0.456)))
                        Button("Tips") {
                            navigateManager.navigateTo(.compabilityTips)
                        }
                        .buttonStyle(NavigationButtonStyle(color: Color(hue: 0.084, saturation: 0.419, brightness: 0.456)))
                        NavigationLink(
                            destination: TipsView(weton: weton).navigationBarBackButtonHidden(false),
                            tag: .compabilityTips,
                            selection: $navigateManager.currentView,
                            label: {EmptyView()}
                            
                            
                        )
                        
                    }
                }
            }.ignoresSafeArea()
        }.navigationBarBackButtonHidden(false)
    }
}

struct ResultCompatibilityView_Previews: PreviewProvider {
    static var previews: some View {
        let weton = Weton()
        ResultCompatibilityView(weton: weton, profileType: .man)
    }
}
