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
    @State var topCardRotation:Double = 90.0
    @State var topCardOffset:CGSize = CGSize(width: 0, height: -300)

    init() {
        lazySorryVM = LazySorryViewModel()
    }

    var body: some View {
        VStack {
            Spacer()
            ZStack {
                ForEach(0 ..< lazySorryVM.drawnCards.count) {
                    CardView(imageName: self.lazySorryVM.drawnCards[$0])
                }
                // https://www.hackingwithswift.com/quick-start/swiftui/how-to-start-an-animation-immediately-after-a-view-appears
                CardView(imageName: self.lazySorryVM.topCard)
                .onTapGesture {
                    self.topCardRotation = 90
                    self.topCardOffset = CGSize(width: 0, height: -300)
                    self.lazySorryVM.drawCardTrigger()
                    withAnimation {
                        self.topCardRotation = 0
                        self.topCardOffset = CGSize.zero
                    }
                }
                .rotation3DEffect(.degrees(topCardRotation), axis: (x: 1, y: 0.3, z: 0))
                .offset(x: topCardOffset.width, y: topCardOffset.height)
                .animation(.easeInOut)
                .onAppear {
                    _ = Animation.easeInOut(duration: 0.5)
                    return withAnimation {
                        self.topCardRotation = 0
                        self.topCardOffset = CGSize.zero
                    }
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
