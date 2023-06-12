//
//  HasilKecocokan.swift
//  WetonKulo
//
//  Created by edi santoso on 10/06/23.
//

import SwiftUI


struct HasilKecocokan: View {
    
    let categoryName: String
    @State private var isButtonTapped = false
    
    var body: some View {
        NavigationStack{
            ZStack {
                //            Color.brown.edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Hasil Perhitungan")
                        .font(.system(size: 26, weight: .bold))
                        .fontWeight(.bold)
                        .foregroundColor(Color("textColor"))
                        .padding(EdgeInsets(top: 120, leading: 0, bottom: 20, trailing: 0))
//                    Spacer()
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack(alignment: .top, spacing: 70) {
                            ForEach(cards) { num in
                                GeometryReader { proxy in
                                    let scale = getScale(proxy: proxy)
                                    NavigationLink(
                                        destination: ModelDetailView(weton: Weton(), card: num),
                                        label: {
                                            ZStack{
                                                Rectangle()
                                                    .fill(Color.white)
                                                    .frame(width: 180, height: 180)
                                                    .padding(20)
                                                    .offset(x: -50, y: -150)
                                                
                                                Rectangle()
                                                    .fill(Color.white)
                                                    .frame(width: 180, height: 180)
                                                    .padding(20)
                                                    .offset(x: 50, y: 150)
                                                
                                                VStack(spacing: 0) {
                                                    
                                                    Text(num.title111)
                                                        .font(.system(size: 20, weight: .semibold))
                                                        .fontWeight(.semibold)
                                                        .multilineTextAlignment(.center)
                                                        .foregroundColor(Color("textColor"))
                                                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 10, trailing: 0))
                                                    
                                                    
                                                    Image(num.imageName)
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 200, height: 200)
                                                    
                                                    
                                                    Text(num.title222)
                                                        .font(.system(size: 18, weight: .semibold))
                                                        .fontWeight(.semibold)
                                                        .multilineTextAlignment(.center)
                                                        .foregroundColor(Color("textColor"))
                                                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 10, trailing: 0))
                                                    
                                                    Rectangle()
                                                        .fill(Color("secondary"))
                                                        .frame(width: 240,height: 2)
                                                    
                                                    
                                                    
                                                    Text(num.title333)
                                                        .fontWeight(.light)
                                                        .foregroundColor(Color("textColor"))
                                                        .multilineTextAlignment(.leading)
                                                        .font(.system(size: 12, weight: .semibold))
                                                        .frame(width: 240)
                                                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                                                    Spacer()
                                                }
                                                .frame(width: 280, height: 480)
                                                .background(Color.white)
                                                .foregroundColor(Color("textColor"))
                                                .cornerRadius(60)
//                                                .overlay(
//                                                    RoundedRectangle(cornerRadius: 40)
//                                                        .stroke(Color(white: 1))
//                                                )
//                                                .shadow(radius: 2)
//                                                .padding(25)
                                                
                                            }
                                            
                                        }).disabled(isButtonTapped)
                                    
                                        .scaleEffect(.init(width: scale, height: scale))
                                    //.animation(.spring(), value: 1)
                                        .animation(.easeOut(duration: 1))
                                    
                                    
                                        .padding(.vertical)
                                    
                                } //End Geometry
                                .frame(width: 160, height: 700)
                                .padding(.horizontal, 48)
                                .padding(.vertical, 60)
                            } //End ForEach
                            Spacer()
                                .frame(width: 60)
                        }
                    }//End HStack
                }
                .padding(.top, 20)
                
                if isButtonTapped {
                    NavigationLink(destination: {
                        OnBoardingAppView().navigationBarBackButtonHidden(true)
                        
                    }, label: {
                        Text("Menu")
                            .font(.system(size: 18, weight: .semibold))
                            .padding()
                            .frame(width: screenWidth * 0.36)
                            .background(Color("secondary"))
                            .cornerRadius(20, corners: .allCorners)
                            .foregroundColor(Color("textColor"))
                    })
                    .padding(20)
                    .offset(x: -90, y: 360)
                }
                
                if isButtonTapped {
                    NavigationLink(destination: {
                        TipsView(weton: weton).navigationBarBackButtonHidden(true)
                    }, label: {
                        Text("Tips")
                            .font(.system(size: 18, weight: .semibold))
                            .padding()
                            .frame(width: screenWidth * 0.36)
                            .background(Color("secondary"))
                            .cornerRadius(20, corners: .allCorners)
                            .foregroundColor(Color("textColor"))
                    })
                    .padding(20)
                    .offset(x: 90, y: 360)
                }
                
                // End ScrollView
            }
            .background(Color("primary"))
        }
        
        
        .onAppear {
            isButtonTapped = true
        }//End VStack
    }
    
    
    
    func getScale(proxy: GeometryProxy) -> CGFloat {
        let midPoint: CGFloat = 125
        
        let viewFrame = proxy.frame(in: CoordinateSpace.global)
        
        var scale: CGFloat = 1.0
        let deltaXAnimationThreshold: CGFloat = 125
        
        let diffFromCenter = abs(midPoint - viewFrame.origin.x - deltaXAnimationThreshold / 2)
        if diffFromCenter < deltaXAnimationThreshold {
            scale = 1 + (deltaXAnimationThreshold - diffFromCenter) / 500
        }
        
        return scale
    }
}



struct HasilKecocokan_Previews: PreviewProvider {
    static var previews: some View {
        HasilKecocokan(categoryName: "Hasil Kecocokan")
    }
}
