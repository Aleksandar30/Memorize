//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Aleksandar Ivanovic on 3.1.22..
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()    //Moze let jer se pointer game ne menja, ono na sta pokazuje moze da se poromeni
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
