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

    var body: some View {
        ZStack {
            if (imageName == "") {
                EmptyView()
            } else {
                Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(imageName: "1")
    }
}
