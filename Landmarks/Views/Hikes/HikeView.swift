/*
 See the LICENSE.txt file for this sample’s licensing information.
 
 Abstract:
 A view displaying information about a hike, including an elevation graph.
 */

import SwiftUI

extension AnyTransition {
    // A custom transition for moving and fading views.
    static var moveAndFade: AnyTransition {
        .asymmetric(
            // Transition for insertion (when view appears).
            insertion: .move(edge: .trailing).combined(with: .opacity),
            // Transition for removal (when view disappears).
            removal: .scale.combined(with: .opacity)
        )
    }
}

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false // State to control detail view visibility.
    
    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                
                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }
                
                Spacer()
                
                // Button to toggle detail view visibility.
                Button {
                    withAnimation {
                        showDetail.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .padding()
                }
            }
            
            // Display hike detail view when showDetail is true.
            if showDetail {
                HikeDetail(hike: hike)
                    .transition(.slide) // Apply transition effect.
            }
        }
    }
}

#Preview {
    VStack {
        HikeView(hike: ModelData().hikes[0])
            .padding()
        Spacer()
    }
}
