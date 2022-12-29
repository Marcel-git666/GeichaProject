//
//  MainView.swift
//  Geicha
//
//  Created by Marcel Mravec on 20.11.2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView() {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            BasketView()
                .tabItem {
                    Label("Basket", systemImage: "basket")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Order())
    }
}
