//
//  ContentView.swift
//  dollar
//
//  Created by Ева Фельдман on 11.04.2023.
//

import SwiftUI

struct Bank: Identifiable {
    var name: String
    var price: Float = 0
    let id = UUID()
    var loaded: Bool = false
}

class Banks: ObservableObject {
    @Published var data: [Bank] = [
        Bank(name:"Сбербанк"),
        Bank(name:"ВТБ"),
        Bank(name:"Газпромбанк"),
        Bank(name:"Альфа-банк"),
        Bank(name:"Россельхозбанк"),
        Bank(name:"Совкомбанк"),
        Bank(name:"Промсвязьбанк"),
    ]
    func load() {
    }
}

struct ContentView: View {
    @EnvironmentObject var banks: Banks
    var body: some View {
        VStack {
            Text("Курс доллара")
                .bold()
            List(banks.data){ item in
                HStack {
                    Text(item.name)
                    if item.loaded {
                        Text(String(item.price))
                            .frame(maxWidth: .infinity, alignment:.trailing)
                            .bold()
                    } else {
                        ProgressView()
                            .frame(maxWidth: .infinity, alignment:.trailing)
                    }
                }
            }
        }.onAppear() {
            banks.load()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
