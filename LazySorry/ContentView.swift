//
//  ContentView.swift
//  LazySorry
//
//  Created by Justin Kufro on 7/9/20.
//  Copyright © 2020 Justin Kufro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var lazySorryVM: LazySorryViewModel

    init() {
        lazySorryVM = LazySorryViewModel()
    }

    var body: some View {
        VStack {
            Spacer()
            ZStack {
                ForEach(lazySorryVM.drawnCards, id: \.self) {
                    CardView(imageName: $0)
                        .padding()
                        .shadow(radius: 10)
                }
                .onTapGesture {
                    self.lazySorryVM.drawCardTrigger()
                }
            }
            Spacer()
            HStack {
                Spacer()
                Text(
                    String("\(lazySorryVM.deck.numPlayingCardsLeft()) cards left until shuffle")
                )
                .font(.custom("PaytoneOne-Regular", size: 18))
                Spacer()
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
