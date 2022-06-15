//
//  CharactersViewControllerViewModelType.swift
//  RickandMorty
//
//  Created by Антон Дубино on 14.04.2022.
//

import Foundation
import RxSwift
import RxCocoa

protocol CharacterViewModelType {
    
    var character: [CharactersResult] { get set }
    var cp: CharacterParsing { get }
}
