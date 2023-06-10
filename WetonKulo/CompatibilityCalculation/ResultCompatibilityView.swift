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
    
    var body: some View {
        NavigationStack{
            
            VStack{
                Text("Compatibility Result")
                    .font(.system(size: 26, weight: .bold))
                    .padding(EdgeInsets(top: 60, leading: 0, bottom: 30, trailing: 0))
                
                Image("imgResult")
                    .resizable()
                    .frame(width: screenWidth, height: screenHeight * 0.65)
                    .padding(.bottom, 20)
                
                HStack(spacing: 20){
                    Button {
                        //
                    } label: {
                        Text("Menu")
                            .font(.system(size: 18, weight: .semibold))
                            .padding()
                            .frame(width: screenWidth * 0.36)
                            .background(Color("secondary"))
                            .cornerRadius(20, corners: .allCorners)
                            .foregroundColor(Color("textColor"))
                    }
                    Button {
                        //
                    } label: {
                        Text("Tips")
                            .font(.system(size: 18, weight: .semibold))
                            .padding()
                            .frame(width: screenWidth * 0.36)
                            .background(Color("secondary"))
                            .cornerRadius(20, corners: .allCorners)
                            .foregroundColor(Color("textColor"))
                    }
                }
                
            }
            .frame(width: screenWidth, height: screenHeight)
            .background(Color("primary"))
            
            
            
            
            
//            VStack{
//                Text("Hello, this is the result")
//                    .font(.system(size: 22, weight: .bold))
//                HStack {
//                    Text("\(weton.dateMan, formatter: dateFormatter)")
//                        .frame(width: screenWidth/2)
//
//                    Text("\(weton.dateWoman, formatter: dateFormatter)")
//                        .frame(width: screenWidth/2)
//                }
//
//                HStack{
//                    Text("5 Siklus")
//                        .frame(width: screenWidth / 3)
//                    Text("7 Siklus")
//                        .frame(width: screenWidth / 3)
//                    Text("8 Siklus")
//                        .frame(width: screenWidth / 3)
//                }
//                .background(Color.orange)
//                .foregroundColor(.black)
//                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
//
//                HStack{
//                    Text("\(weton.getFiveCycles().result)")
//                        .frame(width: screenWidth / 3)
//                    Text("\(weton.getSevenCycles().result)")
//                        .frame(width: screenWidth / 3)
//                    Text("\(weton.getEightCycles().result)")
//                        .frame(width: screenWidth / 3)
//                }
//                .background(Color.cyan)
//                .foregroundColor(.black)
//
//                HStack{
//                    Text("\(weton.getFiveCycles().interpretation)")
//                        .frame(width: screenWidth / 3)
//                    Text("\(weton.getSevenCycles().interpretation)")
//                        .frame(width: screenWidth / 3)
//                    Text("\(weton.getEightCycles().interpretation)")
//                        .frame(width: screenWidth / 3)
//                }
//                .background(Color.yellow)
//                .foregroundColor(Color("textColor"))
//            }
//            .padding()
        }
    }
}

struct ResultCompatibilityView_Previews: PreviewProvider {
    static var previews: some View {
        let weton = Weton()
        ResultCompatibilityView(weton: weton, profileType: .man)
    }
}
