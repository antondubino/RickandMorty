//
//  CharactersViewModelType.swift
//  RickandMorty
//
//  Created by Антон Дубино on 19.05.2022.
//

import Foundation

protocol CharactersViewModelType {
    
    var characters: [String] { get set }
    var cp: CharactersParsing { get }
    
}
