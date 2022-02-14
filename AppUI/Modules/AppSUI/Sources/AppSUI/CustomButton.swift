//
//  SwiftUIView.swift
//  
//
//  Created by Илья Проскурнев on 17.11.2021.
//

import SwiftUI

public struct CustomButton<Content>: View where Content: View {

    private let action: () -> Void
    private let label: () -> Content

    public init(action: @escaping () -> Void, @ViewBuilder label: @escaping () -> Content) {
        self.action = action
        self.label = label

    }

    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius:  6)
                .foregroundColor(.gray)
            HStack {
                label()
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 14)
        }
        .fixedSize(horizontal: true, vertical: true)
        .simultaneousGesture(
            TapGesture().onEnded {
                action()
            }
        )
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(action: {}) {
            VStack {
                Text("I'm button")
                    .foregroundColor(.white)
            }
        }
    }
}
