//
//  LazySorryViewModel.swift
//  LazySorry
//
//  Created by Justin Kufro on 7/9/20.
//  Copyright © 2020 Justin Kufro. All rights reserved.
//

import Foundation
import SwiftUI

class LazySorryViewModel: ObservableObject {
    static let drawCooldown:Int = 1_000  // milliseconds that must pass between draws

    @Published var deck: Deck
    @Published var drawnCards:[String]  // track a short history of cards drawn
    var lastDraw:Int = Int(Date().timeIntervalSince1970 * 1_000)

    init() {
        self.deck = Deck()
        self.drawnCards = ["", "", "", "sorry"]
    }

    func drawCardTrigger() {
        guard (self.isDrawCooledDown()) else {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
            return
        }

        // make sure the deck is not empty
        if (self.deck.isPlayingDeckEmpty()) {
            self.deck.newPlayingDeck()
            // play shuffle sound?
        }

        // draw a card
        let drawnCard:String = self.deck.drawCard()
        self.drawnCards.append(drawnCard)
        self.drawnCards.removeFirst()
        self.lastDraw = Int(Date().timeIntervalSince1970 * 1_000)

        // play draw card sound?
    }
    
    private func isDrawCooledDown() -> Bool {
        return (Int(Date().timeIntervalSince1970 * 1_000) - self.lastDraw) >= LazySorryViewModel.drawCooldown
    }
}
