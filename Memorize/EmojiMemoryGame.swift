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

class EmojiMemoryGame {
    
    static let emojis = ["🚂","🚀","🚁","🛺","🚄","🛶","⛴","🛸","🚛","🛴","🏎","🚑","🚔"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) {pairIndex in
            emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    

}
