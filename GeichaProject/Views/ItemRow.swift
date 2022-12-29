//
//  ItemRow.swift
//  Geicha
//
//  Created by Marcel Mravec on 22.11.2022.
//

import SwiftUI

struct ItemRow: View {
    var item: Tea
    var body: some View {
        VStack {
            HStack {
                Image(systemName: item.size == .large ? "l.square" : "m.square")
                VStack(alignment: .leading) {
                    switch item.type {
                    case .fruitTea:
                        HStack {
                            Text(item.fruitTeatype.description)
                            Text(item.type.description)
                                .font(.headline)
                        }
                    case .specialTeaPresso:
                        HStack {
                            Text(item.specialTeaPresso.description)
                            Text(item.type.description)
                                .font(.headline)
                        }
                    case .teaLatte:
                        HStack {
                            Text(item.teaLattetype.description)
                            Text(item.type.description)
                                .font(.headline)
                        }
                    case .milkTea:
                        HStack {
                            Text(item.milkTeatype.description)
                            Text(item.type.description)
                                .font(.headline)
                        }
                    case .mousseSeries:
                        HStack {
                            Text(item.mousseTeatype.description)
                            Text(item.type.description)
                                .font(.headline)
                        }
                    }
                    HStack {
                        Text("\(Int(item.sugarLevel))% sugar, ")
                        Text(item.withIce ? "Ice" :  "no Ice")
                    }
                }
                Spacer()
            }
            HStack {
                Text("Toppings:")
                    .font(.headline)
                VStack {
                    ForEach(item.topping, id: \.self) { top in
                        Text(top.description)
                    }
                }
                Spacer()
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: Tea.example)
    }
}
