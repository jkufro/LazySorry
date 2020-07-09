//
//  CardView.swift
//  LazySorry
//
//  Created by Justin Kufro on 7/9/20.
//  Copyright © 2020 Justin Kufro. All rights reserved.
//

import SwiftUI

struct CardView: View {
    let imageName: String
    @State private var offset = CGSize.zero

    var body: some View {
        ZStack {
            if (imageName == "") {
                EmptyView()
            } else {
                Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                // https://www.hackingwithswift.com/books/ios-swiftui/moving-views-with-draggesture-and-offset
                .offset(x: offset.width, y: offset.height)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            self.offset = gesture.translation
                        }
                        .onEnded { _ in
                            self.offset = CGSize.zero
                        }

                )
                .animation(.spring())
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(imageName: "1")
    }
}
