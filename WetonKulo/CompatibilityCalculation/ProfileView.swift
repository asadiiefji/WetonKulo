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
            ZStack {
                
                
                VStack {
                    Text("tanggal man: \( weton.dateMan, formatter: dateFormatter)")
                        .foregroundColor(Color("textColor"))
                }
                .frame(width: screenWidth, height: screenHeight/2)
                .background(
                    (weton.isMaghribMan == true) ?
                    Image("NightCowo").resizable() :
                        Image("DayCowo").resizable()
                )
                .position(x: screenWidth/2, y: screenHeight * 0.25)
                
                VStack {
                    Text("tanggal woman: \( weton.dateWoman, formatter: dateFormatter)")
                        .foregroundColor(Color("textColor"))
                }
                .frame(width: screenWidth, height: screenHeight/2)
                .background(
                    (weton.isMaghribWoman == true) ?
                    Image("NightCewe").resizable() :
                        Image("DayCewe").resizable()
                )
                .position(x: screenWidth/2, y: screenHeight * 0.75)
                
                
                NavigationLink(destination: {
                    HasilKecocokan(categoryName: "Hasil Kecocokan")
                }, label: {
//                    Text("See Result")
                    Text( (weton.dateMan.description.components(separatedBy: " ")[0] != weton.currentDateMan.description.components(separatedBy: " ")[0] && weton.dateWoman.description.components(separatedBy: " ")[0] != weton.currentDateWoman.description.components(separatedBy: " ")[0] )  ? "See Result" : "Tanggal Lahir Belum Terpilih")
                    
                    
                        .font(.system(size: 18, weight: .semibold))
                        .padding(15)
                        .frame(width: screenWidth * 0.8)
                        .background(Color("primary").opacity(0.4))
                        .cornerRadius(30, corners: .allCorners)
                        .foregroundColor(Color("tertiary"))
                    
                    
                    
                })
                .disabled((weton.dateMan.description.components(separatedBy: " ")[0] != weton.currentDateMan.description.components(separatedBy: " ")[0] && weton.dateWoman.description.components(separatedBy: " ")[0] != weton.currentDateWoman.description.components(separatedBy: " ")[0] ) ? false : true)
                .position(x: screenWidth / 2, y: screenHeight * 0.93)
                
                
                
            }
            .frame(width: screenWidth, height: screenHeight)
//            .background(
//                (weton.isMaghribMan == true) ?
//                Image("NightAtas").resizable() :
//                    Image("DayAtas").resizable()
//            )
            .ignoresSafeArea()
//            .background(Image("bgGender").resizable()).ignoresSafeArea()
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
