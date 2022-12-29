//
//  DataModel.swift
//  Geicha
//
//  Created by Marcel Mravec on 14.03.2022.
//

import Foundation

enum SizeOfTea: String, CustomStringConvertible, CaseIterable, Codable {
    case medium = "Medium"
    case large = "Large"
    var description: String { rawValue }
}

enum TypeOfTea: String, CustomStringConvertible, CaseIterable, Codable {
    case specialTeaPresso = "Special Tea Presso"
    case teaLatte = "Tea Latte"
    case mousseSeries = "Mousse Series"
    case milkTea = "Milk Tea"
    case fruitTea = "Fruit Tea"
    var description: String { rawValue }
}

enum SpecialTeaPresso: String, CaseIterable, Codable {
    case tokyoMilkTea = "Tokyo Milk Tea"
    case osakaMilkTea = "Osaka Milk Tea"
    case sendaiMilkTea = "Sendai Milk Tea"
    case honshuMilkTea = "Honshu Milk Tea"
    case okinawaMilkTea = "Okinawa Milk Tea"
    var description: String { rawValue }
}

enum TeaLatte: String, CustomStringConvertible, CaseIterable, Codable {
    case matchaTeaLatte = "Matcha tea latte"
    case winterMellonLatte = "Winter mellon latte"
    case brownSugarFreshMilk = "Brown sugar Fresh Milk"
    case brewedTeaLatte = "Brewed Tea Latte"
    var description: String { rawValue }
}

enum FruitTea: String, CustomStringConvertible, CaseIterable, Codable {
    case peach = "Peach"
    case passionFruit = "Passion Fruit"
    case mango = "Mango"
    case greenApple = "Green Apple"
    case pineapple = "Pineapple"
    case kumquat = "Kumquat"
    case strawberry = "Strawberry"
    case redguave = "Red Guave"
    case wintermellon = "Winter Mellon"
    case grapefruit = "Grapefruit"
    case lychee = "Lychee"
    var description: String { rawValue }
}

enum MilkTea: String, CustomStringConvertible, CaseIterable, Codable {
    case geichaSignature = "Geicha Milk Tea"
    case hazelnutMilkTea = "Chocolate Hazelnut Milk Tea"
    case thaiMilkTea = "Thai Milk Tea"
    case ceylonMilkTea = "Ceylon Milk Tea"
    case hokkaidoMilkTea = "Hokkaido Milk Tea"
    case taroMilkTea = "Taro Milk Tea"
    case matchaMilkTea = "Matcha Milk Tea"
    var description: String { rawValue }

}

enum MousseSeries: String, CustomStringConvertible, CaseIterable, Codable {
    case matchaMousse = "Matcha mousse"
    case chocoMousse = "Chocolate mousse"
    case melonMousse = "Winter mellon mousse"
    var description: String { rawValue }
}

enum Topping: String, CaseIterable, Codable {
    case tapioca = "Tapioca"
    case pudding = "Pudding"
    case jellyCoconut = "Jelly Coconut"
    case jellyRainbow = "Jelly Rainbow"
    case creamCheese = "Cream Cheese"
    case strawberryBoba = "Strawberry Boba"
    case mangoBoba = "Mango Boba"
    case passionFruitBoba = "Passion F. Boba"
    case jellyCoffee = "Jelly Coffee"
    case jellyLychee = "Jelly Lychee"
    case lycheeBoba = "Lychee Boba"
    case blueberryBoba = "Blueberry Boba"
    case passionBoba = "Passion Boba"
    case yoghurtBoba = "Yoghurt Boba"
    case greenAppleBoba = "Green A. Boba"
    case peachBoba = "Peach Boba"
    var description: String { rawValue }
}

struct Tea: Codable, Equatable, Identifiable {
    let id: UUID
    let size: SizeOfTea
    let type: TypeOfTea
    let teaLattetype: TeaLatte
    let fruitTeatype: FruitTea
    let milkTeatype: MilkTea
    let mousseTeatype: MousseSeries
    let specialTeaPresso: SpecialTeaPresso
    let topping: [Topping]
    let sugarLevel: Float
    let withIce: Bool

    static let example = Tea(id: UUID(), size: .medium, type: .fruitTea, teaLattetype: .matchaTeaLatte, fruitTeatype: .peach, milkTeatype: .geichaSignature, mousseTeatype: .matchaMousse, specialTeaPresso: .osakaMilkTea, topping: [.jellyCoconut], sugarLevel: 30, withIce: true)
}
