//
//  CharacterViewControllerViewModel.swift
//  RickandMorty
//
//  Created by Антон Дубино on 14.04.2022.
//

import Foundation
import RxSwift
import RxCocoa
import RxAlamofire

class CharacterViewModel: CharacterViewModelType {
    
    var character: [CharactersResult] = []
    
    let cp = CharacterParsing()
    
    
}
