//
//  HasilKecocokan.swift
//  WetonKulo
//
//  Created by edi santoso on 10/06/23.
//

import SwiftUI


struct HasilKecocokan: View {
    @ObservedObject var weton : Weton
    let categoryName: String
    @State private var isButtonTapped = false
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        NavigationStack{
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
                .position(x: 35, y: screenWidth - 255)
                .zIndex(4)
                
                VStack{
                    Text("Hasil Perhitungan ")
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .frame(width: screenWidth)
                        .padding(.top, 120)
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(Color("textColor"))
                        .frame(width: nil)
                    Text("Kecocokan Pasangan")
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .frame(width: screenWidth)
//                        .padding(.top, 1)
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(Color("textColor"))
                        .frame(width: nil)
                        
//                    Spacer()
//                    Text("total weton: \( weton.getTotalWeton())")
//                        .foregroundColor(Color("textColor"))
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack(alignment: .top, spacing: 70) {
                            var cards = [
                                Card(weton: Weton(), id: 0, title111: "Aspek Rumah Tangga", imageName: "\(weton.getFiveCycles().image)", title222: "\(weton.getFiveCycles().result)", title333: "\(weton.getFiveCycles().interpretation)"),
                                Card(weton: Weton(), id: 1, title111: "Aspek Rezeki", imageName: "\(weton.getSevenCycles().image)", title222: "\(weton.getSevenCycles().result)", title333: "\(weton.getSevenCycles().interpretation)"),
                                Card(weton: Weton(), id: 2, title111: "Aspek Kesehatan", imageName: "\(weton.getEightCycles().image)", title222: "\(weton.getEightCycles().result)", title333: "\(weton.getEightCycles().interpretation)"),
                                         ]
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
                                                        .font(.system(size: 18, weight: .regular))
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
                                                        .multilineTextAlignment(.center)
                                                        .font(.system(size: 12, weight: .semibold))
                                                        .frame(width: 240)
                                                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                                                    Spacer()
                                                }
                                                .frame(width: 280, height: 480)
                                                .background(Color.white)
                                                .foregroundColor(Color("textColor"))
                                                .cornerRadius(60)
                                                
                                            }
                                            
                                        }).disabled(isButtonTapped)
                                    
                                        .scaleEffect(.init(width: scale, height: scale))
                                    //.animation(.spring(), value: 1)
                                        .animation(.easeOut(duration: 1))
                                    
                                    
                                        .padding(.vertical)
                                    
                                } //End Geometry
                                .frame(width: 160, height: 700)
                                .padding(.horizontal, 48)
                                .padding(.vertical, 50)
                            } //End ForEach
                            Spacer()
                                .frame(width: 60)
                        }
                    }//End HStack
                }
//                .padding(.top, 10)
                
                if isButtonTapped {
                    
                    
                    HStack {
                        Button(action: {
                            dismiss()
                            
                        }, label: {
                            Text("Menu")
                                .font(.system(size: 18, weight: .semibold))
                                .padding()
                                .frame(width: screenWidth * 0.36)
                                .background(Color("secondary"))
                                .cornerRadius(20, corners: .allCorners)
                                .foregroundColor(Color("textColor"))
                        })
                        .padding(.horizontal, 10)
                        NavigationLink(destination: {
                            TipsView(weton: weton)
    //                            .navigationBarBackButtonHidden(true)
                        }, label: {
                            Text("Tips")
                                .font(.system(size: 18, weight: .semibold))
                                .padding()
                                .frame(width: screenWidth * 0.36)
                                .background(Color("secondary"))
                                .cornerRadius(20, corners: .allCorners)
                                .foregroundColor(Color("textColor"))
                        })
                    }.position(x: screenWidth/2, y:screenHeight)
                }
                
            }
            .background(Color("primary"))
        }
        .navigationBarBackButtonHidden(true)
        
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
        let weton = Weton()
        HasilKecocokan(weton: weton, categoryName: "Hasil Kecocokan")
    }
}
