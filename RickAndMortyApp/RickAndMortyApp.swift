//
//  RickAndMortyApp.swift
//  RickAndMortyApp
//
//  Created by Vicente Veltri on 31/10/2024.
//

import SwiftUI

@main
struct RickAndMortyApp: App {
    var body: some Scene {
        WindowGroup {
            CharacterListView(viewModel: CharacterViewModel())
        }
    }
}
