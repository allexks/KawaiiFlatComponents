import SwiftUI

public struct KawaiiFlatWrapper<WrappedView: View, ColoredEdgeView: View>: View {
    
    private let cornerRadius: CGFloat
    private let coloredEdge: Edge
    private let wrappedView: WrappedView
    private let coloredEdgeView: ColoredEdgeView
    
    public init(
        cornerRadius: CGFloat = KawaiiFlatDefaults.cornerRadius,
        coloredEdge: Edge = KawaiiFlatDefaults.coloredEdge,
        @ViewBuilder coloredEdgeView: () -> ColoredEdgeView,
        @ViewBuilder wrappedView: () -> WrappedView
    ) {
        self.cornerRadius = cornerRadius
        self.coloredEdge = coloredEdge
        self.coloredEdgeView = coloredEdgeView()
        self.wrappedView = wrappedView()
    }
    
    public var body: some View {
        wrappedView
            .padding()
            .overlay(coloredEdgeOverlay)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
    
    private var coloredEdgeOverlay: some View {
        switch coloredEdge {
        case .leading:
            return HStack {
                coloredEdgeView
                    .frame(width: cornerRadius)
                Spacer()
            }.erasedToAnyView()
        case .trailing:
            return HStack {
                Spacer()
                coloredEdgeView
                    .frame(width: cornerRadius)
            }.erasedToAnyView()
        case .top:
            return VStack {
                coloredEdgeView
                    .frame(height: cornerRadius)
                Spacer()
            }.erasedToAnyView()
        case .bottom:
            return VStack {
                Spacer()
                coloredEdgeView
                    .frame(height: cornerRadius)
            }.erasedToAnyView()
        }
    }
}

struct KawaiiFlatWrapper_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(Edge.allCases, id: \.self) {
            KawaiiFlatWrapper(
                coloredEdge: $0,
                coloredEdgeView: {
                    Color.red
                }, wrappedView: {
                    Text("Hello world!")
                }
            ).previewDisplayName(String(describing: $0))
        }
        
        Text("Test")
            .background(Color.orange)
            .kawaiiFlatWrapped {
                Color.red
            }
    }
}
