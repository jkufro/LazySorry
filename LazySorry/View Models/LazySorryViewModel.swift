//
//  LazySorryViewModel.swift
//  LazySorry
//
//  Created by Justin Kufro on 7/9/20.
//  Copyright © 2020 Justin Kufro. All rights reserved.
//

import Foundation
import SwiftUI
import AVFoundation


class LazySorryViewModel: ObservableObject {
    static let drawCooldown:Int = 750  // milliseconds that must pass between draws

    @Published var deck: Deck
    @Published var drawnCards:[String]  // track a short history of cards drawn
    var lastDraw:Int = Int(Date().timeIntervalSince1970 * 1_000)
    var avPlayer:AVAudioPlayer?

    init() {
        self.deck = Deck()
        self.drawnCards = ["", "", "", "", "", "", "sorry"]
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
            self.playShuffleSound()
        } else {
            self.playDrawSound()
        }

        // draw a card
        let drawnCard:String = self.deck.drawCard()
        self.drawnCards.append(drawnCard)
        self.drawnCards.removeFirst()
        self.lastDraw = Int(Date().timeIntervalSince1970 * 1_000)
    }
    
    private func isDrawCooledDown() -> Bool {
        return (Int(Date().timeIntervalSince1970 * 1_000) - self.lastDraw) >= LazySorryViewModel.drawCooldown
    }

    // https://www.hackingwithswift.com/example-code/media/how-to-play-sounds-using-avaudioplayer
    private func playShuffleSound() {
        var options:[String] = [
            "shuffle_1"
        ]
        options.shuffle()
        let resourceName:String = options[0]
        let path = Bundle.main.path(forResource: resourceName, ofType: "mp3")!
        let url = URL(fileURLWithPath: path)

        do {
            self.avPlayer = try AVAudioPlayer(contentsOf: url)
            self.avPlayer?.play()
        } catch {
            // couldn't load file :(
        }
    }

    private func playDrawSound() {
        var options:[String] = [
            "pickup_3",
            "pickup_4",
            "pickup_5",
            "pickup_6",
        ]
        options.shuffle()
        let resourceName:String = options[0]
        let path = Bundle.main.path(forResource: resourceName, ofType: "mp3")!
        let url = URL(fileURLWithPath: path)

        do {
            self.avPlayer = try AVAudioPlayer(contentsOf: url)
            self.avPlayer?.play()
        } catch {
            // couldn't load file :(
        }
    }
}
