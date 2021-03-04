//
//  View+kawaiiFlatWrapped.swift
//  
//
//  Created by Alexander Ignatov on 4.03.21.
//

import SwiftUI

public extension View {
    func kawaiiFlatWrapped<V: View>(
        cornerRadius: CGFloat = KawaiiFlatDefaults.cornerRadius,
        coloredEdge: Edge = KawaiiFlatDefaults.coloredEdge,
        @ViewBuilder coloredEdgeView: () -> V
    ) -> some View {
        return KawaiiFlatWrapper(
            cornerRadius: cornerRadius,
            coloredEdge: coloredEdge,
            coloredEdgeView: coloredEdgeView,
            wrappedView: { self }
        )
    }
    
    func kawaiiFlatWrapped(
        cornerRadius: CGFloat = KawaiiFlatDefaults.cornerRadius,
        coloredEdge: Edge = KawaiiFlatDefaults.coloredEdge
    ) -> some View {
        return KawaiiFlatWrapper(
            cornerRadius: cornerRadius,
            coloredEdge: coloredEdge,
            coloredEdgeView: { EmptyView() },
            wrappedView: { self }
        )
    }
}

