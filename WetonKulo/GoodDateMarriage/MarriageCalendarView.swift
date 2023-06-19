//
//  MarriageCalendarView.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 18/06/23.
//

import SwiftUI

struct MarriageCalendarView: View {
    
    @State var selectedDate: Date = Date()
    
    let days: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    var body: some View {
        
        
        NavigationStack {
            VStack(spacing: 0){
                
                
                
                VStack(spacing: 30) {
                    Text(selectedDate.formatted(date: .abbreviated, time: .standard))
                        .font(.system(size: 28))
                        .bold()
                        .foregroundColor(Color.accentColor)
                        .padding()
                        .animation(.spring(), value: selectedDate)
                    
                    HStack{
                        ForEach(days, id: \.self) { day in
                            Text(day)
                                .fontWeight(.regular)
                                .font(.system(size: 15))
                                .frame(maxWidth: .infinity)
                        }
                    }
                    
                    
                }
                .frame(width: screenWidth, height: screenHeight * 0.2)
                .background(Color("primary"))
                Divider()
                
//                Spacer()
                
                ScrollView {
                    Text("Ini Calendar ya")
                }
                .frame(width: screenWidth, height: screenHeight * 0.55)
                
                Divider()
                VStack(spacing: 30) {
                    
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        
                        HStack(spacing: 10) {
                            
                            Group {
                                Text("Hari Terbaik")
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 15)
                                    .background(Color("warnaTerbaik"))
                                
                                Text("Hari Baik")
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 15)
                                    .background(Color("warnaBaik"))
                                
                                Text("Hari Cukup")
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 15)
                                //                                    .background(Color("warnaTerbaik"))
                                    .border(Color("tertiary"), width: 2)
                                
                                
                                Text("Hari Buruk")
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 15)
                                //                                    .background(Color("warnaTerbaik"))
                                    .border(Color("tertiary"), width: 2)
                                
                                Text("Hari Terburuk")
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 15)
                                //                                    .background(Color("warnaTerbaik"))
                                    .border(Color("tertiary"), width: 2)
                            }
                            .fontWeight(.regular)
                            .font(.system(size: 15))
                            
                            
                        }
                        
                        
                        
                    }
                    
                    HStack{
                        
                        Text("Hari, Tanggal Bulan")
                            .font(.title3)
                        Spacer()
                        Text("lihat artinya")
                        
                    }
                    
                    NavigationLink(destination: {
                        //Call View Here
                    }, label: {
                        Text("Kecocokan")
                            .font(.system(size: 18, weight: .semibold))
                            .padding(15)
                            .frame(width: screenWidth * 0.8)
                            .background(Color("secondary"))
                            .cornerRadius(30, corners: .allCorners)
                            .foregroundColor(Color("tertiary"))
                    })
                    .disabled(true) //delete this
                    
                    
                }
                .padding(15)
                
                .frame(width: screenWidth, height: screenHeight * 0.25)
                .background(Color("primary"))
                .padding(.bottom, 20)
                
            }
            .frame(width: screenWidth, height: screenHeight)
        }
        
    }
}

struct MarriageCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        MarriageCalendarView()
    }
}
