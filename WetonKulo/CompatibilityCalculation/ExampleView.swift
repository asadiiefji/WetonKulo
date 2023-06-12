//
//  ExampleView.swift
//  WetonKulo
//
//  Created by edi santoso on 10/06/23.
//

import SwiftUI

struct ExampleView: View {
    var body: some View {
        ZStack{
            
            Color.red
            VStack{
                Text("ashnasj")
                VStack(spacing: 20){
                    Text("7 Siklus")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(height: screenHeight / 10)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                        )
                    
                    Text("sdnsjd")
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(width: screenWidth / 2, height: screenHeight / 20)
                        .padding(EdgeInsets(top: 100, leading: 0, bottom: 35, trailing: 0))
                    
                    
                    Text("sdbsjhbdn")
                        .multilineTextAlignment(.leading)
                        .frame(width: 300)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    Spacer()
                    
                }
                .frame(width: 340, height: 560)
                .background(Color.orange)
                .foregroundColor(.black)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .cornerRadius(20)
                
                Button("Tips") {
                    
                }
                .buttonStyle(NavigationButtonStyle(color: .brown))
                
                
            }
            
            
            
            
        }.ignoresSafeArea()
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
