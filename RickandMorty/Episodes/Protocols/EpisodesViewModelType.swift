//
//  EpisodesViewModelType.swift
//  RickandMorty
//
//  Created by Антон Дубино on 18.04.2022.
//

import Foundation
import RxSwift

protocol EpisodesViewModelType {
    
    func fetchEpisodes(page: Int) -> Observable<[EpisodesResult]>
}
