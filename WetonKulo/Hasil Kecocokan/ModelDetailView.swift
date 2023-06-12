//
//  ModelDetailView.swift
//  WetonKulo
//
//  Created by edi santoso on 10/06/23.
//

import SwiftUI
 
struct ModelDetailView: View {
    @ObservedObject var weton : Weton
     
    let card: Card
     
    var body: some View {
        
        Image(card.imageName)
            .resizable()
            .scaledToFill()
            .navigationTitle(card.title111)
        
    }
}
 
struct ModelDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ModelDetailView(weton: Weton(), card: Card(weton: Weton(), id: 0, title111: "Siklus 1", imageName: "image0", title222: "Siklus 1", title333: "Siklus 1"))
            }
}
