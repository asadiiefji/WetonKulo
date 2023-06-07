//
//  OnBoardingView.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 07/06/23.
//

import SwiftUI

struct OnBoardingView: View {
    @State var isMan = false
    @State var isWoman = false
    
    @ObservedObject var weton = Weton()
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                VStack{
                    
                    Image("imgPria")
                        .resizable()
                        .frame(width: screenWidth * 0.7, height: screenHeight * 0.4)
                        .onTapGesture {
                            isMan = true
                        }
                        .navigationDestination(isPresented: $isMan) {
                            ProfileView( weton: weton, profileType: .man)
                        }
                        .navigationBarBackButtonHidden(false)
                    
                    Image("imgWanita")
                        .resizable()
                        .frame(width: screenWidth * 0.7, height: screenHeight * 0.4)
                        .onTapGesture {
                            isWoman = true
                        }
                        .navigationDestination(isPresented: $isWoman) {
                            
                            ProfileView(weton: weton, profileType: .woman)
                        }
                        .navigationBarBackButtonHidden(false)
                    
                }
                
                Text("-----------------------------------------")
            }
            .frame(width: screenWidth, height: screenHeight)
            .background(Color("quaternary"))
        }
    }

}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
