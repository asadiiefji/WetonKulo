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
                Text("Hello, this is the result")
                HStack {
                    Text("\(weton.dateMan, formatter: dateFormatter)")
                        .frame(width: screenWidth/2)
                    
                    Text("\(weton.dateWoman, formatter: dateFormatter)")
                        .frame(width: screenWidth/2)
                }
                
                HStack{
                    Text("5 Siklus")
                        .frame(width: screenWidth / 3)
                    Text("7 Siklus")
                        .frame(width: screenWidth / 3)
                    Text("8 Siklus")
                        .frame(width: screenWidth / 3)
                }
                .background(Color.orange)
                .foregroundColor(.black)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                
                HStack{
                    Text("\(weton.getFiveCycles().result)")
                        .frame(width: screenWidth / 3)
                    Text("\(weton.getSevenCycles().result)")
                        .frame(width: screenWidth / 3)
                    Text("\(weton.getEightCycles().result)")
                        .frame(width: screenWidth / 3)
                }
                .background(Color.cyan)
                .foregroundColor(.black)
                
                HStack{
                    Text("\(weton.getFiveCycles().interpretation)")
                        .frame(width: screenWidth / 3)
                    Text("\(weton.getSevenCycles().interpretation)")
                        .frame(width: screenWidth / 3)
                    Text("\(weton.getEightCycles().interpretation)")
                        .frame(width: screenWidth / 3)
                }
                .background(Color.gray)
                .foregroundColor(.black)
            }
            .padding()
        }
    }
}

struct ResultCompatibilityView_Previews: PreviewProvider {
    static var previews: some View {
        let weton = Weton()
        ResultCompatibilityView(weton: weton, profileType: .man)
    }
}
