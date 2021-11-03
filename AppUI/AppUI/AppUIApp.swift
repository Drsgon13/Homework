//
//  AppUIApp.swift
//  AppUI
//
//  Created by Илья Проскурнев on 01.11.2021.
//

import SwiftUI

final class ViewModel: ObservableObject {
    @Published var isNavigationList: Bool = false
    @Published var selectedItem: UUID? = nil
}

@main
struct AppUIApp: App {
    @ObservedObject var viewModel: ViewModel = .init()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
