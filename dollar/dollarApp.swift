//
//  dollarApp.swift
//  dollar
//
//  Created by Ева Фельдман on 11.04.2023.
//

import SwiftUI

@main
struct dollarApp: App {
    var banks = Banks()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(banks)
        }
    }
}
