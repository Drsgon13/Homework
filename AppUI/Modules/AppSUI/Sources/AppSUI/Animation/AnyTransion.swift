//
//  File.swift
//  
//
//  Created by Илья Проскурнев on 17.11.2021.
//

import Foundation
import SwiftUI

extension AnyTransition {

    public static var moveAndFade: AnyTransition {

        let insertion = AnyTransition.move(edge: .leading).combined(with: .opacity)
        let removal = AnyTransition.scale.combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)

    }

}
