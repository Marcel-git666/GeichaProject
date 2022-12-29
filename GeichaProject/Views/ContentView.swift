//
//  ContentView.swift
//  Geicha
//
//  Created by Marcel Mravec on 14.03.2022.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var order: Order
    @State private var size: SizeOfTea = .medium
    @State private var type: TypeOfTea = .specialTeaPresso
    @State private var fruit: FruitTea = .passionFruit
    @State private var latte: TeaLatte = .matchaTeaLatte
    @State private var milk: MilkTea = .ceylonMilkTea
    @State private var mousse: MousseSeries = .matchaMousse
    @State private var special: SpecialTeaPresso = .osakaMilkTea
    @State private var ice: Bool = false
    @State private var sugar: Float = 30
    @State private var checkedTopping = [[Bool]](repeating: [false], count: 16).flatMap{$0}
    @State private var top: [Topping] = []
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .systemIndigo
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.darkText], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    }
    var body: some View {
        NavigationView {
            Form {
                Section(header:
                    Text("Size")
                    .foregroundColor(.purple)
                ) {
                    Picker("Size?", selection: $size ) {

                        Text("Medium").tag(SizeOfTea.medium)
                        Text("Large").tag(SizeOfTea.large)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header:
                    Text("Type of Tea: \(type.description)")
                        .foregroundColor(.purple)
                ) {
                    Picker("Type of Tea", selection: $type) {
                        ForEach(TypeOfTea.allCases, id: \.self) {
                            Text($0.description).tag($0)
                        }
                    }
                    .padding()
                    .frame(height: 55)
                    .border(Color.purple, width: 3)
                    displayCorrectView(type)
                        .padding()
                        .frame(height: 55)
                        .border(Color.purple, width: 3)
//
                }
                Section(header:
                    Text("Ice?")
                    .foregroundColor(.purple)
                ) {
                    Picker("Ice?", selection: $ice ) {

                        Text("No Ice").tag(false)
                        Text("With Ice").tag(true)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header:
                    Text("Sugar")
                    .foregroundColor(.purple)
                ) {
                    HStack {
                        Image(systemName: "circle")
                            .foregroundColor(.purple)
                        Slider(value: $sugar, in: 0...100, step: 10)
                            .padding(.horizontal)
                            .accentColor(.purple)
                        Image(systemName: "circle.fill")
                            .foregroundColor(.purple)
                        Text("\(Int(sugar))%")
                            .foregroundColor(.black)
                            .font(.callout)
                                            }
                }
                Section(header:
                    Text("Toppings")
                    .foregroundColor(.purple)
                ) {
                    ScrollView(.horizontal) {
                        HStack {
                            VStack(alignment: .leading) { // first column
                                HStack {
                                    CheckBoxView(checked: $checkedTopping[0])
                                        .onChange(of: checkedTopping[0]) { _ in
                                            if let index = top.firstIndex(of: .jellyCoconut) {
                                                top.remove(at: index)
                                            } else {
                                                top.append(.jellyCoconut)}
                                        }
                                    Text(Topping.jellyCoconut.description)
                                }
                                HStack {
                                    CheckBoxView(checked: $checkedTopping[1])
                                        .onChange(of: checkedTopping[1]) { _ in
                                            if let index = top.firstIndex(of: .jellyRainbow) {
                                                top.remove(at: index)
                                                
                                            } else {
                                                top.append(.jellyRainbow)
                                                
                                            }
                                        }
                                    Text(Topping.jellyRainbow.description)
                                }
                                HStack {
                                    CheckBoxView(checked: $checkedTopping[2])
                                        .onChange(of: checkedTopping[2]) { _ in
                                            if let index = top.firstIndex(of: .creamCheese) {
                                                top.remove(at: index)
                                                
                                            } else {
                                                top.append(.creamCheese)
                                                
                                            }
                                    }
                                    Text(Topping.creamCheese.description)
                                }
                                HStack {
                                    CheckBoxView(checked: $checkedTopping[3])
                                        .onChange(of: checkedTopping[3]) { _ in
                                            if let index = top.firstIndex(of: .mangoBoba) {
                                                top.remove(at: index)
                                                
                                            } else {
                                                top.append(.mangoBoba)
                                                
                                            }
                                    }
                                    Text(Topping.mangoBoba.description)
                                }
                            } // end of first column
                            Spacer()
                            VStack(alignment: .leading) {  // second column
                                HStack {
                                    CheckBoxView(checked: $checkedTopping[4])
                                        .onChange(of: checkedTopping[4]) { _ in
                                            if let index = top.firstIndex(of: .tapioca) {
                                                top.remove(at: index)
                                                
                                            } else {
                                                top.append(.tapioca)
                                                
                                            }
                                    }
                                    Text(Topping.tapioca.description)
                                }
                                HStack {
                                    CheckBoxView(checked: $checkedTopping[5])
                                        .onChange(of: checkedTopping[5]) { _ in
                                            if let index = top.firstIndex(of: .pudding) {
                                                top.remove(at: index)
                                                
                                            } else {
                                                top.append(.pudding)
                                                
                                            }
                                    }
                                    Text(Topping.pudding.description)
                                }
                                HStack {
                                    CheckBoxView(checked: $checkedTopping[6])
                                        .onChange(of: checkedTopping[6]) { _ in
                                            if let index = top.firstIndex(of: .strawberryBoba) {
                                                top.remove(at: index)
                                                
                                            } else {
                                                top.append(.strawberryBoba)
                                                
                                            }
                                    }
                                    Text(Topping.strawberryBoba.description)
                                }
                                HStack {
                                    CheckBoxView(checked: $checkedTopping[7])
                                        .onChange(of: checkedTopping[7]) { _ in
                                            if let index = top.firstIndex(of: .passionFruitBoba) {
                                                top.remove(at: index)
                                                
                                            } else {
                                                top.append(.passionFruitBoba)
                                                
                                            }
                                    }
                                    Text(Topping.passionFruitBoba.description)
                                }
                            } // end of second column
                            Spacer()
                            VStack(alignment: .leading) { // third column
                                HStack {
                                    CheckBoxView(checked: $checkedTopping[8])
                                        .onChange(of: checkedTopping[8]) { _ in
                                            if let index = top.firstIndex(of: .jellyCoffee) {
                                                top.remove(at: index)
                                                
                                            } else {
                                                top.append(.jellyCoffee)}
                                        }
                                    Text(Topping.jellyCoffee.description)
                                }
                                HStack {
                                    CheckBoxView(checked: $checkedTopping[9])
                                        .onChange(of: checkedTopping[9]) { _ in
                                            if let index = top.firstIndex(of: .jellyLychee) {
                                                top.remove(at: index)
                                                
                                            } else {
                                                top.append(.jellyLychee)
                                                
                                            }
                                        }
                                    Text(Topping.jellyLychee.description)
                                }
                                HStack {
                                    CheckBoxView(checked: $checkedTopping[10])
                                        .onChange(of: checkedTopping[10]) { _ in
                                            if let index = top.firstIndex(of: .lycheeBoba) {
                                                top.remove(at: index)
                                                
                                            } else {
                                                top.append(.lycheeBoba)
                                                
                                            }
                                    }
                                    Text(Topping.lycheeBoba.description)
                                }
                                HStack {
                                    CheckBoxView(checked: $checkedTopping[11])
                                        .onChange(of: checkedTopping[11]) { _ in
                                            if let index = top.firstIndex(of: .blueberryBoba) {
                                                top.remove(at: index)
                                                
                                            } else {
                                                top.append(.blueberryBoba)
                                                
                                            }
                                    }
                                    Text(Topping.blueberryBoba.description)
                                }
                            } // end of third column
                            Spacer()
                            VStack(alignment: .leading) { // fourth column
                                HStack {
                                    CheckBoxView(checked: $checkedTopping[12])
                                        .onChange(of: checkedTopping[12]) { _ in
                                            if let index = top.firstIndex(of: .passionBoba) {
                                                top.remove(at: index)
                                                
                                            } else {
                                                top.append(.passionBoba)}
                                        }
                                    Text(Topping.passionBoba.description)
                                }
                                HStack {
                                    CheckBoxView(checked: $checkedTopping[13])
                                        .onChange(of: checkedTopping[13]) { _ in
                                            if let index = top.firstIndex(of: .yoghurtBoba) {
                                                top.remove(at: index)
                                                
                                            } else {
                                                top.append(.yoghurtBoba)
                                                
                                            }
                                        }
                                    Text(Topping.yoghurtBoba.description)
                                }
                                HStack {
                                    CheckBoxView(checked: $checkedTopping[14])
                                        .onChange(of: checkedTopping[14]) { _ in
                                            if let index = top.firstIndex(of: .greenAppleBoba) {
                                                top.remove(at: index)
                                                
                                            } else {
                                                top.append(.greenAppleBoba)
                                                
                                            }
                                    }
                                    Text(Topping.greenAppleBoba.description)
                                }
                                HStack {
                                    CheckBoxView(checked: $checkedTopping[15])
                                        .onChange(of: checkedTopping[15]) { _ in
                                            if let index = top.firstIndex(of: .peachBoba) {
                                                top.remove(at: index)
                                                
                                            } else {
                                                top.append(.peachBoba)
                                                
                                            }
                                    }
                                    Text(Topping.peachBoba.description)
                                }
                            } // end of fourth column
                        }
                    }
                    
                }
                    
                Button() {
                    saveTea()
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .cornerRadius(10)
                }
            }
//            .navigationTitle("Geicha")
            .navigationBarItems(
                leading: HStack {
                    Text("Geicha")
                        .font(.title)
                        .foregroundColor(.purple)
                        .fontWeight(.bold)
                    Image("tea")
                        .resizable()
                    .frame(width: 64)
                },
                trailing:
                Button(action: saveTea,
                    label: {
                        Image(systemName: "plus")
                            .foregroundColor(.purple)
                    }
                )
            )
            
        }
        .environmentObject(order)

    }
    func saveTea() {
        order.add(item: Tea(id: UUID(), size: size, type: type, teaLattetype: latte, fruitTeatype: fruit, milkTeatype: milk, mousseTeatype: mousse, specialTeaPresso: special, topping: top, sugarLevel: sugar, withIce: ice))
    }
    
    func displayCorrectView(_ selectedOption: TypeOfTea) -> some View {
        
        switch type {
        case .specialTeaPresso:
            return AnyView(
                Picker("Special Tea Presso", selection: $special) {
                    ForEach(SpecialTeaPresso.allCases, id: \.self) {
                        Text($0.description).tag($0)
                    }
                }
            )
            
            
        case .milkTea:
            return AnyView(
                Picker("Milk Tea", selection: $milk) {
                    ForEach(MilkTea.allCases, id: \.self) {
                        Text($0.description).tag($0)
                    }
                }
            )
            
        case .mousseSeries:
            return AnyView(
                Picker("Mousse Series", selection: $mousse) {
                    ForEach(MousseSeries.allCases, id: \.self) {
                        Text($0.description).tag($0)
                    }
                }
            )
        case .fruitTea:
            return AnyView( Picker("Fruit Tea", selection: $fruit) {
                ForEach(FruitTea.allCases, id: \.self) {
                    Text($0.rawValue).tag($0)
                }
            })
        case .teaLatte:
            return AnyView(Picker("Tea Latte", selection: $latte) {
                ForEach(TeaLatte.allCases, id: \.self) {
                    Text($0.description).tag($0)
                }
            }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Order())


    }
}
