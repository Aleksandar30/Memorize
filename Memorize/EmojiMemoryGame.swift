//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Aleksandar Ivanovic on 1.2.22..
//

// MARK: - OVO JE VIEWMODEL
//OVo je deo UI pa izbacujem foundation
//import Foundation
import SwiftUI

/* Ovo je isto kao {_ in "smajli"}
func makeCardContent(index: Int) -> String {
    return "😀"
}
*/
// VIEW MODEL JE OBESRVABLE
class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["🚂","🚀","🚁","🛺","🚄","🛶","⛴","🛸","🚛","🛴","🏎","🚑","🚔"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) {pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intents
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    
}
