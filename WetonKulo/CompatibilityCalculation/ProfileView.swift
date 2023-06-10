//
//  ProfileView.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 07/06/23.
//

import SwiftUI

struct ProfileView: View {
    
    @State var activeView: currentView
    
    @State private var offsetY1: CGFloat = 0
    @State private var offsetY2: CGFloat = 0
    @State private var isReversed = false
    @State private var isNavigate = false
    
    let profileType: ProfileType
    @ObservedObject var weton : Weton
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("tanggal man: \( weton.dateMan, formatter: dateFormatter)")
                    .foregroundColor(Color("textColor"))
                Image("imgPria")
                    .resizable()
                    .frame(width: screenWidth * 0.55, height: screenHeight * 0.3)
                
                Text("tanggal woman: \( weton.dateWoman, formatter: dateFormatter)")
                    .foregroundColor(Color("textColor"))
                Image("imgWanita")
                    .resizable()
                    .frame(width: screenWidth * 0.55, height: screenHeight * 0.3)
                
                
                NavigationLink(destination: {
                    ResultCompatibilityView(weton: weton, profileType: .man)
                }, label: {
                    Text("See Result")
                        .padding(15)
                        .frame(width: screenWidth * 0.8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20, corners: .allCorners)
                })
                
                
                
            }
            .frame(width: screenWidth, height: screenHeight)
            .background(Image("bgGender").resizable()).ignoresSafeArea()
        }
        
    }
    
    func startAnimation() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            withAnimation(Animation.linear(duration: 1.0)) {
                if isReversed {
                    offsetY1 = 0
                    offsetY2 = 50
                } else {
                    offsetY1 = 50
                    offsetY2 = 0
                }
                isReversed.toggle()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let weton = Weton()
        ProfileView(activeView: .center, profileType: .man, weton: weton)
    }
}
