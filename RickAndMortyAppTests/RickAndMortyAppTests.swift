//
//  RickAndMortyAppTests.swift
//  RickAndMortyAppTests
//
//  Created by Vicente Veltri on 31/10/2024.
//

import XCTest
@testable import RickAndMortyApp

final class RickAndMortyAppTests: XCTestCase {
    
    var viewModel: CharacterViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = CharacterViewModel()
        viewModel.allCharacters = [
            Character(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", gender: "Male", image: "", location: Location(name: "", url: ""), origin: Location(name: "", url: "")),
            Character(id: 2, name: "Morty Smith", status: "Alive", species: "Human", gender: "Male", image: "", location: Location(name: "", url: ""), origin: Location(name: "", url: ""))
        ]
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testFilterCharacters() {
        // Test with non-empty name that matches
        viewModel.filterCharacters(by: "Rick")
        XCTAssertEqual(viewModel.characters.count, 1)
        XCTAssertEqual(viewModel.characters.first?.name, "Rick Sanchez")
        
        // Test with name that does not match
        viewModel.filterCharacters(by: "Summer")
        XCTAssertTrue(viewModel.characters.isEmpty)
        
        // Test with empty string should reset characters
        viewModel.filterCharacters(by: "")
        XCTAssertEqual(viewModel.characters.count, 2)
    }
    
}
