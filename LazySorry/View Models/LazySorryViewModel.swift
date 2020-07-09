//
//  LazySorryViewModel.swift
//  LazySorry
//
//  Created by Justin Kufro on 7/9/20.
//  Copyright © 2020 Justin Kufro. All rights reserved.
//

import Foundation


class LazySorryViewModel: ObservableObject {
    @Published var deck: Deck
    @Published var drawnCards:[String]  // track a short history of cards drawn

    init() {
        self.deck = Deck()
        self.drawnCards = ["", "", "", "sorry"]
    }

    func drawCardTrigger() {
        // make sure the deck is not empty
        if (self.deck.isPlayingDeckEmpty()) {
            self.deck.newPlayingDeck()
            // play shuffle sound?
        }

        // draw a card
        let drawnCard:String = self.deck.drawCard()
        self.drawnCards.append(drawnCard)
        self.drawnCards.removeFirst()

        // play draw card sound?
    }
}
