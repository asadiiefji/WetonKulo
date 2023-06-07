//
//  ProfileView.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 07/06/23.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var weton : Weton
    @State var isModal = false
    @State var isToggle = false
    
    let profileType: ProfileType
    
    var body: some View {
        ZStack {
            
            Text("Pick a date of birth")
                .position(x: screenWidth / 2, y: 40)
            
            VStack {
                Text("tanggal: \(weton.getJavaDay(for: profileType == .man ? weton.dateMan : weton.dateWoman))")
                
                Toggle(isOn: $isToggle) {
                    Text("Konfirmasi Data")
                }
                .navigationDestination(isPresented: $isToggle, destination: {
                    OnBoardingView()
                })
                .padding(20)
                .position(x: screenWidth/2, y: screenHeight * 0.7)
            }
            
            Image(profileType.image)
                .resizable()
                .frame(width: screenWidth * 0.7, height: screenHeight * 0.4)
            
            Button {
                isModal = true
                print("before pick date")
                print("dayMan: \(weton.dayMan)")
                print("dayWoman: \(weton.dayWoman)")
            } label: {
                Text("Pick a date for \(profileType.text)")
                    .padding(12)
                    .frame(width: screenWidth * 0.8)
                    .background(Color.blue)
                    .cornerRadius(15)
                    .foregroundColor(.white)
                
            }
            .position(x: screenWidth/2, y: screenHeight * 0.8)
            
        }
        .sheet(isPresented: $isModal) {
            CalendarView(weton: weton, profileType: profileType)
                .presentationDetents([.fraction(0.6)])
                .transition(.move(edge: .bottom))
                .animation(.easeInOut, value: 10)
                .presentationCornerRadius(40)
                .zIndex(2)
        }
        .animation(.spring(), value: 0)
    }

}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let weton = Weton()
        ProfileView(weton: weton, profileType: .man)
    }
}
