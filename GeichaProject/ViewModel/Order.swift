//
//  Order.swift
//  Geicha
//
//  Created by Marcel Mravec on 20.11.2022.
//

import SwiftUI

class Order: ObservableObject {
    @Published var chosenTea = [Tea]() {
        didSet {
            save()
        }
    }
    let teaKey = "Geicha"
    init() {
        getData()
    }
    func getData() {
        guard
            let decodedData = UserDefaults.standard.data(forKey: teaKey),
            let decodedItems = try?JSONDecoder().decode([Tea].self, from: decodedData)
        else { return }
        self.chosenTea = decodedItems
    }
    func add(item: Tea) {
        chosenTea.append(item)
    }
    func deleteItems(at offsets: IndexSet) {
        chosenTea.remove(atOffsets: offsets)
    }
    func save() {
        if let encodedData = try?JSONEncoder().encode(chosenTea) {
            UserDefaults.standard.set(encodedData, forKey: teaKey)
        }
    }
}
