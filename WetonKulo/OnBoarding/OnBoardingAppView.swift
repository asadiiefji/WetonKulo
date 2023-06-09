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
                    
                    Group {
                        Text("Informasi Weton")
                            .padding(.top, 50)
                            .font(.system(size: 20, weight: .semibold))
                        Image(systemName: "chevron.down")
                            .font(.system(size: 20, weight: .semibold))
                            .padding(.top, 10)
                        Image(systemName: "chevron.down")
                            .font(.system(size: 20, weight: .semibold))
                            .padding(.top, 5)
                            .foregroundColor(Color("secondary"))
                    }
                    .foregroundColor(Color("tertiary"))
                    
                    
                    Spacer()
                    Image("logo")
                        .resizable()
                        .frame(width: screenWidth * 0.8, height: screenWidth * 0.8)
                        .padding(.bottom, 20)
                    Spacer()
                    Spacer()
                    NavigationLink(destination: {
                        OnBoardingView()
                    }, label: {
                        Text("Klik dan Isi Data Kelahiran untuk Menghitung Weton")
                            .padding(.horizontal, 25)
                            .frame(width: screenWidth, height: screenHeight * 0.2)
                            .background(Color("quaternary"))
                            .foregroundColor(Color("textColor"))
                            .font(.system(size: 20, weight: .semibold))
                    })
                    
                    
//                    NavigationLink(destination: {
//                        OnBoardingView()
//                    }, label: {
//                        Text("Tanggal Baik Pernikahan")
//                            .frame(width: screenWidth, height: screenHeight * 0.2)
//                            .background(Color("secondary"))
//                            .foregroundColor(Color("textColor"))
//                            .font(.system(size: 24, weight: .semibold))
//                    })
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
