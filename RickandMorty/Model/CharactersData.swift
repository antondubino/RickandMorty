//
//  CharactersData.swift
//  RickandMorty
//
//  Created by Антон Дубино on 30.03.2022.
//

import Foundation

class CharactersPage: Codable {
    
    let results: CharactersResult

    init(results: CharactersResult) {
        self.results = results
    }
}

class CharactersResult: Codable {
    
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    init(id: Int, name: String, status: String, species: String, gender: String, origin: Origin, location: Location, image: String, episode: [String], url: String, created: String) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
}

class Origin: Codable {
    
    let name, url: String
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}

class Location: Codable {
    
    let name, url: String
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}

