//
//  DisclaimerView.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 10/06/23.
//

import SwiftUI

struct DisclaimerView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("Informasi Weton")
                    .font(.system(size: 26, weight: .bold))
                    .padding(EdgeInsets(top: 60, leading: 0, bottom: 30, trailing: 0))
                    .foregroundColor(Color("textColor"))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: screenWidth * 0.1) {
                        
                        VStack{
                            Text("Definisi Weton")
                                .font(.system(size: 22, weight: .medium))
                                .padding(EdgeInsets(top: 40, leading: 0, bottom: 30, trailing: 0))
                                .padding(.horizontal, 10)
                                .multilineTextAlignment(.center)
                    
                            Image("logo")
                                .resizable()
                                .frame(width: screenWidth * 0.6, height: screenWidth * 0.6)
                            
                            Text("Weton adalah suatu kombinasi, penyatuan, atau penjumlahan dari hari kelahiran seseorang yaitu Minggu, Senin, Selasa, Rabu, Kamis, Jumat, Sabtu dengan hari 'Pasaran' yaitu Kliwon, Legi, Pon, Pahing, Wage.")
                                .padding(.horizontal, 20)
                                .padding(.top, 30)
                                .font(.system(size: 16, weight: .regular))
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: screenWidth * 0.75, height: screenHeight * 0.65, alignment: .top)
                        .background(Color.white)
                        .cornerRadius(80, corners: .bottomLeft)
                        .cornerRadius(80, corners: .topRight)
                        .padding(.bottom, 30)
                        
                        VStack{
                            Text("Metode Perhitungan Weton")
                                .font(.system(size: 22, weight: .medium))
                                .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                                .padding(.horizontal, 25)
                                .multilineTextAlignment(.center)
                            
                            Image("logo")
                                .resizable()
                                .frame(width: screenWidth * 0.6, height: screenWidth * 0.6)
                            Text("8 Siklus")
                                .font(.system(size: 20, weight: .semibold))
                            
                            Text("Metode 8 siklus adalah metode menghitung Weton untuk menentukan perhitungan kondisi hubungan rumah tangga jika menikah.")
                                .padding(.horizontal, 20)
                                .padding(.top, 5)
                                .font(.system(size: 16, weight: .regular))
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: screenWidth * 0.7, height: screenHeight * 0.65, alignment: .top)
                        .background(Color.white)
                        .cornerRadius(80, corners: .bottomLeft)
                        .cornerRadius(80, corners: .topRight)
                        .padding(.bottom, 30)

                        
                        VStack{
                            Text("Metode Perhitungan Weton")
                                .font(.system(size: 22, weight: .medium))
                                .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                                .padding(.horizontal, 25)
                                .multilineTextAlignment(.center)
                            
                            Image("logo")
                                .resizable()
                                .frame(width: screenWidth * 0.6, height: screenWidth * 0.6)
                            Text("7 Siklus")
                                .font(.system(size: 20, weight: .semibold))
                            
                            Text("Metode 7 siklus adalah metode menghitung Weton untuk menentukan keadaan rezeki pasangan jika menikah.")
                                .padding(.horizontal, 20)
                                .padding(.top, 5)
                                .font(.system(size: 16, weight: .regular))
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: screenWidth * 0.7, height: screenHeight * 0.65, alignment: .top)
                        .background(Color.white)
                        .cornerRadius(80, corners: .bottomLeft)
                        .cornerRadius(80, corners: .topRight)
                        .padding(.bottom, 30)
                        
                        VStack{
                            Text("Metode Perhitungan Weton")
                                .font(.system(size: 22, weight: .medium))
                                .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                                .padding(.horizontal, 25)
                                .multilineTextAlignment(.center)
                            
                            Image("logo")
                                .resizable()
                                .frame(width: screenWidth * 0.6, height: screenWidth * 0.6)
                            Text("5 Siklus")
                                .font(.system(size: 20, weight: .semibold))
                            
                            Text("Metode 5 siklus adalah metode menghitung Weton untuk menentukan kondisi kesehatan dan rezeki pasangan jika menikah.")
                                .padding(.horizontal, 20)
                                .padding(.top, 5)
                                .font(.system(size: 16, weight: .regular))
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: screenWidth * 0.7, height: screenHeight * 0.65, alignment: .top)
                        .background(Color.white)
                        .cornerRadius(80, corners: .bottomLeft)
                        .cornerRadius(80, corners: .topRight)
                        .padding(.bottom, 30)
                        
                        VStack{
                            Text("Disclaimer")
                                .font(.system(size: 22, weight: .medium))
                                .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                                .padding(.horizontal, 25)
                                .multilineTextAlignment(.center)
                            
                            Image("logo")
                                .resizable()
                                .frame(width: screenWidth * 0.6, height: screenWidth * 0.6)
                            
                            Text("Setiap hasil interpretasi weton dalam aplikasi ini kembali lagi kepada kepercayaan pengguna. Perhitungan ini hanyalah sebuah upaya untuk mencari berkah dari Tuhan. Ketika hasil perhitungan baik, jangan mengaitkannya semata-mata hanya pada kualitas perhitungan weton, dan ketika hasilnya kurang baik, jangan menyalahkannya.")
                                .padding(.horizontal, 20)
                                .padding(.top, 5)
                                .font(.system(size: 16, weight: .regular))
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: screenWidth * 0.7, height: screenHeight * 0.65, alignment: .top)
                        .background(Color.white)
                        .cornerRadius(80, corners: .bottomLeft)
                        .cornerRadius(80, corners: .topRight)
                        .padding(.bottom, 30)
                        
                        
                    }
                    .padding(.horizontal, screenWidth * 0.1)
                    
                    
                }
                .frame(width: screenWidth)
                
                Group {
                    Image(systemName: "chevron.up")
                        .font(.system(size: 20, weight: .semibold))
                        .padding(.top, 20)
                        .foregroundColor(Color("secondary"))
                    Image(systemName: "chevron.up")
                        .font(.system(size: 20, weight: .semibold))
                        .padding(.top, 5)
                    Text("Dashboard")
                        .padding(.top, 10)
                        .font(.system(size: 20, weight: .semibold))

                }
                .foregroundColor(Color("tertiary"))
                
                
//                NavigationLink(destination: {
//                    DashboardView()
//                }, label: {
//                    Text("OnBoarding Menu")
//                        .font(.system(size: 18, weight: .semibold))
//                        .padding(15)
//                        .frame(width: screenWidth * 0.8)
//                        .background(Color("secondary"))
//                        .cornerRadius(20, corners: .allCorners)
//                })
                
            }
            .frame(width: screenWidth, height: screenHeight, alignment: .top)
            .background(Color("primary"))
            .foregroundColor(Color("textColor"))
        }
    }
}

struct DisclaimerView_Previews: PreviewProvider {
    static var previews: some View {
        DisclaimerView()
    }
}
