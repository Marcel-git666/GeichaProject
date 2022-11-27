//
//  GeichaProjectApp.swift
//  GeichaProject
//
//  Created by Marcel Mravec on 27.11.2022.
//

import SwiftUI

@main
struct GeichaProjectApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
