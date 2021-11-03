//
//  ProfileScreen.swift
//  AppUI
//
//  Created by Илья Проскурнев on 01.11.2021.
//

import SwiftUI

final class ProfileViewModel: ObservableObject {
    @Published var isModal: Bool = false
}

struct ProfileScreen: View {
    @State var isNavigate: Bool = false
    @State var isModal: Bool = false

    @ObservedObject var viewModel: ProfileViewModel = .init()
    var body: some View {
        NavigationView {
            VStack {
                Button(action: { isNavigate.toggle() },
                label: {
                    Text("Navigate Button")
                })
                Divider()
                PersonInfoView(isNavigate: $isNavigate)
                    .environmentObject(viewModel)
            }
            .navigationTitle("Profile")
        }
    }
}

struct PersonInfoView: View {
    @Binding var isNavigate: Bool
//    @Binding var isModal: Bool

    @EnvironmentObject var profileViewModel: ProfileViewModel
    @State var isAnimating: Bool = false
    var body: some View {
        VStack {
            NavigationLink(destination: Text("Destination"),
                isActive: $isNavigate,
                label: {
                    Text("Navigate")
            })
            Spacer()
                .frame(height: 100)
            ScrollView(.horizontal) {
                HStack {
                    Group {
                        Image(systemName: "square.grid.3x3").font(.largeTitle)
                        Image(systemName: "square.grid.3x3").font(.largeTitle)
                        Image(systemName: "square.grid.3x3").font(.largeTitle)
                        Image(systemName: "square.grid.3x3").font(.largeTitle)
                        Image(systemName: "square.grid.3x3").font(.largeTitle)
                        Image(systemName: "square.grid.3x3").font(.largeTitle)
                        Image(systemName: "square.grid.3x3").font(.largeTitle)
                        Image(systemName: "square.grid.3x3").font(.largeTitle)
                        Image(systemName: "square.grid.3x3").font(.largeTitle)
                        Image(systemName: "square.grid.3x3").font(.largeTitle)
                    }
                }
            }
            Spacer()
            Image(systemName: "paperplane")
                .rotationEffect(.degrees(45))

            Image(systemName: "megaphone")
                .font(.largeTitle)
                .sheet(isPresented: $profileViewModel.isModal) {
                    VStack {

                        Toggle("Animating", isOn: $isAnimating)
                        ActivityIndikator(isAnimating: $isAnimating, style: .large)
                    }
                }
                .onTapGesture {
                    profileViewModel.isModal.toggle()
                }

            Spacer()
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
