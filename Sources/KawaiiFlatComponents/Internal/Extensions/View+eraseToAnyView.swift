//
//  File+eraseToAnyView..swift
//  
//
//  Created by Alexander Ignatov on 13.02.21.
//

import SwiftUI

extension View {
    func erasedToAnyView() -> AnyView {
        AnyView(self)
    }
}
