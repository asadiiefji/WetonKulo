//
//  OnBoardingView.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 07/06/23.
//

import SwiftUI

struct OnBoardingView: View {
    
    @State var activeView = currentView.center
    @State var viewState = CGSize.zero
    
    @ObservedObject var weton = Weton()
    
    var body: some View {
        NavigationStack{
            ZStack {
                ProfileView(activeView: activeView, profileType: .man, weton: weton)
                    .offset(y: self.activeView == currentView.top ? screenHeight : 0)
                    .offset(y: self.activeView == currentView.bottom ? -screenHeight : 0)
                    .offset(y: activeView != .bottom || activeView != .top ? viewState.height : 0)
                    .animation(.easeInOut, value: activeView)
                
                ManView(activeView: activeView, weton: weton, profileType: .man)
                    .offset(y: self.activeView == currentView.top ? 0 : -screenHeight)
                    .offset(y: activeView != .bottom ? viewState.height : 0)
                    .animation(.easeInOut, value: activeView)
                
                WomanView(activeView: self.activeView, weton: weton, profileType: .woman)
                    .offset(y: self.activeView == currentView.bottom ? 0 : screenHeight)
                    .offset(y: activeView != .top ? viewState.height : 0)
                    .animation(.easeInOut, value: activeView)
            }
            .ignoresSafeArea()
            .gesture(
                
                (self.activeView == currentView.center) ?
                
                DragGesture().onChanged { value in
                    
                    self.viewState = value.translation
                    _ = abs(value.translation.height) / (screenHeight / 2)
                }
                    .onEnded { value in
                        if value.predictedEndTranslation.height > screenHeight / 2 {
                            withAnimation{
                                self.activeView = currentView.top
                                self.viewState = .zero
                            }
                        }
                        else if value.predictedEndTranslation.height < -screenHeight / 2 {
                            withAnimation {
                                self.activeView = currentView.bottom
                                self.viewState = .zero
                            }
                        }
                        else {
                            withAnimation {
                                self.viewState = .zero
                            }
                        }
                    }
                : DragGesture().onChanged { value in
                    switch self.activeView {
                    case .top:
                            guard value.translation.height < 1 else { return }
                            self.viewState = value.translation
                        
                    case .bottom:
                            guard value.translation.height > 1 else { return }
                            self.viewState = value.translation
                        
                    case.center:
                            self.viewState = value.translation
                    }
                }
                    .onEnded { value in
                        switch self.activeView {
                        case .top:
                            if value.predictedEndTranslation.height < -screenHeight / 2 {
                                withAnimation {
                                    self.activeView = .center
                                    self.viewState = .zero
                                }
                            }
                            else {
                                withAnimation {
                                    self.viewState = .zero
                                }
                            }
                            
                        case .bottom:
                            if value.predictedEndTranslation.height > screenHeight / 2 {
                                withAnimation {
                                    self.activeView = .center
                                    self.viewState = .zero
                                }
                                
                            }
                            else {
                                withAnimation {
                                    self.viewState = .zero
                                }
                                
                            }
                            
                        case .center:
                            withAnimation {
                                self.viewState = .zero
                            }
                        }
                    }
            )
        }
        
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
