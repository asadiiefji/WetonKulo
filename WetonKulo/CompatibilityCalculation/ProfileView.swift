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
    @Environment(\.dismiss) private var dismiss
    let profileType: ProfileType
    @ObservedObject var weton : Weton
    
    var body: some View {
        
        NavigationStack {
//            VStack {
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
                    .position(x: 40, y: 58)
                    .zIndex(4)

                    
                    VStack(spacing: -20) {
                        HStack{
                            Spacer()
                            Text("Swipe down")
                                .font(.system(size: 20, weight: .regular))
                                .foregroundColor(Color("primary"))
                            VStack{
                                Image(systemName: "chevron.down")
                                    .font(.system(size: 28, weight: .semibold))
                                    .foregroundColor((weton.isMaghribMan == true) ? Color("tertiary") : Color("secondary"))
                                Image(systemName: "chevron.down")
                                    .font(.system(size: 28, weight: .semibold))
                                    .padding(.top, 5)
                                    .foregroundColor((weton.isMaghribMan == true) ? Color("secondary") : Color("tertiary"))
                            }
                            
                            
                        }
                        .padding(.horizontal, 25)
                        .frame(width: screenWidth, height: screenHeight * 0.1)
                    
                        HStack{
                            
                            VStack{
                                Image(systemName: "chevron.up")
                                    .font(.system(size: 28, weight: .semibold))
                                    .foregroundColor((weton.isMaghribMan == true) ? Color("tertiary") : Color("secondary"))
                                Image(systemName: "chevron.up")
                                    .font(.system(size: 28, weight: .semibold))
                                    .padding(.top, 5)
                                    .foregroundColor((weton.isMaghribMan == true) ? Color("secondary") : Color("tertiary"))
                            }
                            
                            Text("Swipe up")
                                .font(.system(size: 20, weight: .regular))
                                .foregroundColor(Color("primary"))

                            Spacer()
                        }
                        .padding(.horizontal, 25)
                        .frame(width: screenWidth, height: screenHeight * 0.1)
                        
                        
                    }.zIndex(3)
                    
                    VStack {
                        Text( (weton.dateMan.description.components(separatedBy: " ")[0] != weton.currentDateMan.description.components(separatedBy: " ")[0] && weton.dateWoman.description.components(separatedBy: " ")[0] != weton.currentDateWoman.description.components(separatedBy: " ")[0]) ? "" : "Data Kelahiran \( (weton.dateMan.description.components(separatedBy: " ")[0] != weton.currentDateMan.description.components(separatedBy: " ")[0]  ) ? "" : "Pria" ) \( (weton.dateWoman.description.components(separatedBy: " ")[0] != weton.currentDateWoman.description.components(separatedBy: " ")[0]  ) ? "" : "Wanita" ) Belum Berisi")
                            .foregroundColor(Color("textColor"))
                            .font(.system(size: 18, weight: .semibold))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 65)
                            .padding(.top, 55)
                    }
                    .frame(width: screenWidth, height: screenHeight/2, alignment: .top)
                    .background(
                        (weton.isMaghribMan == true) ?
                        Image("NightCowo").resizable() :
                            Image("DayCowo").resizable()
                    )
                    .position(x: screenWidth/2, y: screenHeight * 0.25)
                    
                    
                    VStack {
    //                    Text("total weton: \( weton.getTotalWeton())")
    //                        .foregroundColor(Color("textColor"))
                    }
                    .frame(width: screenWidth, height: screenHeight/2)
                    .background(
                        (weton.isMaghribWoman == true) ?
                        Image("NightCewe").resizable() :
                            Image("DayCewe").resizable()
                    )
                    .position(x: screenWidth/2, y: screenHeight * 0.75)
                    
                    Text((weton.dateMan.description.components(separatedBy: " ")[0] != weton.currentDateMan.description.components(separatedBy: " ")[0] && weton.dateWoman.description.components(separatedBy: " ")[0] != weton.currentDateWoman.description.components(separatedBy: " ")[0]) ? "Lihat Hasil Perhitungan" : "Fitur Aktif Setelah Data Terisi")
                        .font(.system(size: 18, weight: .semibold))
                        .position(x: screenWidth/2, y: screenHeight * 0.87)
                        .foregroundColor(Color("textColor"))
    //                    .padding(.horizontal, 20)
                        .zIndex(3)
                    
                    
                    HStack(spacing: 10){
                        NavigationLink(destination: {
                            HasilKecocokan(weton: weton, categoryName: "Hasil Kecocokan")
                        }, label: {
    //                        Text( (weton.dateMan.description.components(separatedBy: " ")[0] != weton.currentDateMan.description.components(separatedBy: " ")[0]  )  ? "Kecocokan" : "Data Pria Kosong")
                            Text("Kecocokan")
                                .font(.system(size: 18, weight: .semibold))
                                .padding(15)
                                .frame(width: screenWidth * 0.45)
                                .background(Color((weton.dateMan.description.components(separatedBy: " ")[0] != weton.currentDateMan.description.components(separatedBy: " ")[0] && weton.dateWoman.description.components(separatedBy: " ")[0] != weton.currentDateWoman.description.components(separatedBy: " ")[0]) ? "primary" : "secondary")
                                    .opacity((weton.dateMan.description.components(separatedBy: " ")[0] != weton.currentDateMan.description.components(separatedBy: " ")[0] && weton.dateWoman.description.components(separatedBy: " ")[0] != weton.currentDateWoman.description.components(separatedBy: " ")[0] ) ? 1 : 0.6)
                                )
                                .cornerRadius(30, corners: .allCorners)
                                .foregroundColor(Color("tertiary"))
                        })
                        .disabled((weton.dateMan.description.components(separatedBy: " ")[0] != weton.currentDateMan.description.components(separatedBy: " ")[0] && weton.dateWoman.description.components(separatedBy: " ")[0] != weton.currentDateWoman.description.components(separatedBy: " ")[0] ) ? false : true)
                        
                        
                            NavigationLink(destination: {
                                GoodDateView(weton: weton, profileType: .man)
                            }, label: {
    //                                                Text("See Result")
    //                            Text( (weton.dateWoman.description.components(separatedBy: " ")[0] != weton.currentDateWoman.description.components(separatedBy: " ")[0] )  ? "Tanggal Baik" : "Data Wanita Kosong")
                                
                                Text("Tanggal Menikah")
                                    .font(.system(size: 18, weight: .semibold))
                                    .padding(15)
                                    .frame(width: screenWidth * 0.45)
                                    .background(Color((weton.dateMan.description.components(separatedBy: " ")[0] != weton.currentDateMan.description.components(separatedBy: " ")[0] && weton.dateWoman.description.components(separatedBy: " ")[0] != weton.currentDateWoman.description.components(separatedBy: " ")[0]) ? "primary" : "secondary")
                                        .opacity((weton.dateMan.description.components(separatedBy: " ")[0] != weton.currentDateMan.description.components(separatedBy: " ")[0] && weton.dateWoman.description.components(separatedBy: " ")[0] != weton.currentDateWoman.description.components(separatedBy: " ")[0] ) ? 1 : 0.6)
                                    )
                                    .cornerRadius(30, corners: .allCorners)
                                    .foregroundColor(Color("tertiary"))
                            })
                            .disabled((weton.dateMan.description.components(separatedBy: " ")[0] != weton.currentDateMan.description.components(separatedBy: " ")[0] && weton.dateWoman.description.components(separatedBy: " ")[0] != weton.currentDateWoman.description.components(separatedBy: " ")[0] ) ? false : true)
                            
                            
                    }
                    
                    
                    .position(x: screenWidth / 2, y: screenHeight * 0.93)
                    
                    
                    
                }
                .frame(width: screenWidth, height: screenHeight)
            .ignoresSafeArea()
            
            .navigationBarBackButtonHidden(true)
//            .navigationBarItems(leading: BackView())
//            .navigationBarBackButtonHidden(true); label: do {
//                Text("< Hasil")
//                    .font(.title3)
//
//                    .fontWeight(.semibold)
//                    .foregroundColor(Color("textColor"))
//                    .cornerRadius(20, corners: .allCorners)
//            }
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
