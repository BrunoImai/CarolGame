//
//  File.swift
//  
//
//  Created by Caroline Revay on 20/04/22.
//

import Foundation
import SwiftUI
struct Ball : View {
    
    @State var dragAmount = CGSize.zero

    
    var body: some View {
        ZStack{
            Image("Iguana")
                .frame(width: 200, height: 200)
                .offset(dragAmount)
                .gesture(
                    DragGesture(coordinateSpace: .global)
                        .onChanged {
                            self.dragAmount = CGSize(width: $0.translation.width, height: $0.translation.height)
                        }
                        .onEnded { _ in
                            self.dragAmount = .zero
                        }
                )
        }
    }
    
    
}
struct Ball_Previews: PreviewProvider {
    static var previews: some View {
        Ball()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

