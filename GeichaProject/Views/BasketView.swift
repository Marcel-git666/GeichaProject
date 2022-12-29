//
//  BasketView.swift
//  Geicha
//
//  Created by Marcel Mravec on 20.11.2022.
//

import SwiftUI

struct BasketView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            List {
                ForEach(order.chosenTea) { tea in
                    ItemRow(item: tea)
                }
                .onDelete(perform: order.deleteItems)
            }
           .navigationTitle("Your basket")
           .navigationBarItems(leading: EditButton())
        }
    }
    
}

struct BasketView_Previews: PreviewProvider {

    static var previews: some View {
        BasketView()
            .environmentObject(Order())
    }
}
