//
//  DashboardScreen.swift
//  AppUI
//
//  Created by Илья Проскурнев on 01.11.2021.
//

import SwiftUI

struct DashboardScreen: View {
    @EnvironmentObject var viewModel: ViewModel
    let action: () -> Void
    var body: some View {
        NavigationView {
            VStack {

                Button(action: action, label: {
                    Text("Второй таб")
                })
                Divider()
//                Button(action: {
//                    viewModel.isNavigationList.toggle()
//                }, label: {
//                    Text("NavigationList")
//                }).sheet(isPresented: $viewModel.isNavigationList) {
//                    CatalogScreen()
//                }

            }
            .navigationTitle("DashboardScreen")
        }

    }
}

//struct DashboardScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        DashboardScreen()
//    }
//}
