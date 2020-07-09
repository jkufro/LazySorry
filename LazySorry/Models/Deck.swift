//
//  Deck.swift
//  LazySorry
//
//  Created by Justin Kufro on 7/9/20.
//  Copyright © 2020 Justin Kufro. All rights reserved.
//

import Foundation

class Deck {
    // The modern deck contains 45 cards: there are five 1 cards as well as four
    // each of the other cards (Sorry!, 2, 3, 4, 5, 7, 8, 10, 11 and 12).
    // The 6s or 9s are omitted to avoid confusion with each other.
    static let baseTruthDeck:[String] = [
        "1", "1", "1", "1", "1",
        "2", "2", "2", "2",
        "3", "3", "3", "3",
        "4", "4", "4", "4",
        "5", "5", "5", "5",
        "7", "7", "7", "7",
        "8", "8", "8", "8",
        "9", "9", "9", "9",
        "10", "10", "10", "10",
        "11", "11", "11", "11",
        "12", "12", "12", "12",
        "sorry", "sorry", "sorry", "sorry",
    ]

    private var playingDeck:[String] = []

    func isPlayingDeckEmpty() -> Bool {
        return self.playingDeck.count == 0
    }

    func newPlayingDeck() {
        self.playingDeck = Deck.baseTruthDeck
        self.playingDeck.shuffle()
    }

    func drawCard() -> String {
        if (self.isPlayingDeckEmpty()) {
            return ""
        }
        return self.playingDeck.remove(at: 0)
    }

    func numPlayingCardsLeft() -> Int {
        return self.playingDeck.count
    }
}
