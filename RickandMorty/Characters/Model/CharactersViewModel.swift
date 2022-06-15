//
//  CharactersViewModel.swift
//  RickandMorty
//
//  Created by Антон Дубино on 19.05.2022.
//

import Foundation
import RxSwift
import RxAlamofire

class CharactersViewModel: CharactersViewModelType {
    
    var characters: [String] = []
    
    let cp = CharactersParsing()
    
}
