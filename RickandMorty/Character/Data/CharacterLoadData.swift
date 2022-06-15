//
//  LoadData.swift
//  RickandMorty
//
//  Created by Антон Дубино on 02.04.2022.
//

import Foundation
import RxSwift
import RxAlamofire

class CharacterParsing {
    
    func loadEpisodes(episode: String) -> Observable<EpisodesResult> {
        return RxAlamofire.data(.get, episode).map {
            response in
            do {
                let data = try JSONDecoder().decode(EpisodesResult.self, from: response)
                return data
            } catch {
                print(error)
                return EpisodesResult(id: 1, name: "", air_date: "", episode: "", characters: [])
            }
        }.asObservable()
    }
    
    func loadEpisode(episode: [String]) -> Observable<String> {
        return RxAlamofire.data(.get, episode[0]).map {
            response in
            do {
                let data = try JSONDecoder().decode(EpisodesResult.self, from: response)
                return data.name
            } catch {
                print(error)
                return ""
            }
        }.asObservable()
    }
    
        
}
