//
//  HomeworkScreen.swift
//  AppUI
//
//  Created by Илья Проскурнев on 17.11.2021.
//

import SwiftUI

struct Spisok: Identifiable {
    let name: String
    let id = UUID()
}

struct HomeworkScreen: View {
    @State var spisok = [Spisok(name: "1"), Spisok(name: "2"), Spisok(name: "3"), Spisok(name: "4")]
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        NavigationView {

                List(spisok) { spis in
                    NavigationLink(destination: listInfoView(str: spis.name), label: {
                        Text(spis.name)
                    })
                    if(viewModel.isNavigationList) {

                    }
                }.overlay(
                    NavigationLink(destination: listInfoView(str: "2"), isActive: $viewModel.isNavigationList){EmptyView()}.hidden())
        }
    }
}

struct listInfoView: View {
    @State var str: String
    var body: some View {
        Text(str)
    }
}

struct HomeworkScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeworkScreen()
    }
}
