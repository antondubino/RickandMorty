//
//  CharactersLoadData.swift
//  RickandMorty
//
//  Created by Антон Дубино on 19.05.2022.
//

import Foundation
import RxSwift
import RxAlamofire

class CharactersParsing {
    
    func loadCharacters(character: String) -> Observable<CharactersResult> {
        return RxAlamofire.data(.get, character).map{ response in
            do {
                let data = try JSONDecoder().decode(CharactersResult.self, from: response)
                return data
            } catch {
                print(error)
                return CharactersResult(id: 50, name: "", status: "", species: "", gender: "", origin: Origin(name: "", url: ""), location: Location(name: "", url: ""), image: "", episode: [], url: "", created: "")
            }
        }.asObservable()
    }
}
