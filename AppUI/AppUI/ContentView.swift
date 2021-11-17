//
//  ContentView.swift
//  AppUI
//
//  Created by Илья Проскурнев on 01.11.2021.
//

import SwiftUI

struct ContentView: View {

    @State private var selection = 1
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        TabView(selection: $selection) {
            DashboardScreen() {
                viewModel.isNavigationList.toggle()
                selection = 4
                
            }
                .tabItem {
                    Image(systemName: "star")
                    Text("DashboardScreen")
                }
                .tag(0)
            CatalogScreen()
                .tabItem {
                    Image(systemName: "books.vertical")
                    Text("Catalog")
                }
                .tag(1)
            ProfileScreen()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(2)
            NewsScreen()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("News")
                }
                .tag(3)
            HomeworkScreen()
                .tabItem {
                    Image(systemName: "homekit")
                    Text("Homework")
                }
                .tag(4)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
