//
//  EpisodesData.swift
//  RickandMorty
//
//  Created by Антон Дубино on 18.04.2022.
//

import Foundation

class EpisodesPage: Codable {
    
    let results: [EpisodesResult]

    init(results: [EpisodesResult]) {
        self.results = results
    }
}

class EpisodesResult: Codable {
    
    var id: Int
    var name: String
    var air_date: String
    var episode: String
    var characters: [String]

    init(id: Int, name: String, air_date: String, episode: String, characters: [String]) {
        self.id = id
        self.name = name
        self.air_date = air_date
        self.episode = episode
        self.characters = characters
    }
}
