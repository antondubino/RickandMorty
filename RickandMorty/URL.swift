//
//  URL.swift
//  RickandMorty
//
//  Created by Антон Дубино on 02.04.2022.
//

import Foundation
import RxSwift
import RxCocoa

class Url {
    
    static let shared = Url()
    
    func getEpisodeUrl(page: Int) -> String {
       return "https://rickandmortyapi.com/api/episode?page=\(page)"
    }
    
}
