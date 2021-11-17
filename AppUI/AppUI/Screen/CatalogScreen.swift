//
//  CatalogScreen.swift
//  AppUI
//
//  Created by Илья Проскурнев on 01.11.2021.
//

import SwiftUI
import AppSUI

struct CatalogScreen: View {
    var body: some View {
        NavControllerView(transition: .custom(.moveAndFade)) {
            FirstScreen()
        }
    }
}

struct FirstScreen: View {

    var body: some View {
        VStack {
            Text("1")
                .font(Font.system(size: 200))
            NavPushButton(destination: SecondScreen()) {
                Text("To 2 Screen")
                    .padding()
                    .background(Color.green)
            }
            CustomButton(action: {}) {
                VStack {
                    Text("OK Button")
                }
            }
        }
    }

}

struct SecondScreen: View {

    var body: some View {
        VStack {
            Text("2")
                .font(Font.system(size: 200))
            NavPushButton(destination: ThirdScreen()) {
                Text("To 3 Screen")
                    .padding()
                    .background(Color.blue)
            }
            NavPopButton(destination: .root) {
                Text("Back To Root")
                    .padding()
                    .background(Color.red)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

}

struct ThirdScreen: View {

    var body: some View {
        VStack {
            Text("3")
                .font(Font.system(size: 200))
            NavPopButton(destination: .previous) {
                Text("Back to Prev")
                    .padding()
                    .background(Color.yellow)
            }
            NavPopButton(destination: .root) {
                Text("Back To Root")
                    .padding()
                    .background(Color.red)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

}

struct CatalogScreen_Previews: PreviewProvider {
    static var previews: some View {
        CatalogScreen()
    }
}
