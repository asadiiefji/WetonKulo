//
//  OnBoardingAppView.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 10/06/23.
//

import SwiftUI

struct OnBoardingAppView: View {
    
    
    @State private var isCompatibility = false
    @State private var isFindDate = false
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 0){
                
                NavigationLink(destination: {
                    OnBoardingView()
                }, label: {
                    Text("Kecocokan Pasangan")
                        .frame(width: screenWidth, height: screenHeight * 0.2)
                        .background(Color("quaternary"))
                })
                
                
                NavigationLink(destination: {
                    OnBoardingView()
                }, label: {
                    Text("Tanggal Baik Pernikahan")
                        .frame(width: screenWidth, height: screenHeight * 0.2)
                        .background(Color("secondary"))
                })
                
                
            }
            .frame(width: screenWidth, height: screenHeight, alignment: .bottom)
            .background(Color("primary"))
            .ignoresSafeArea()
        }
    }
}

struct OnBoardingAppView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingAppView()
    }
}
