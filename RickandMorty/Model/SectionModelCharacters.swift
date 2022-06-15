//
//  SectionModelCharacters.swift
//  RickandMorty
//
//  Created by Антон Дубино on 19.05.2022.
//

import Foundation
import RxDataSources

struct SectionModelCharacters {
    var header: String
    var items: [CharactersResult]
}

extension SectionModelCharacters: SectionModelType {
    
    init(original: SectionModelCharacters, items: [CharactersResult]) {
        self = original
        self.items = items
    }
}
