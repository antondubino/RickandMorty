//
//  EpisodesViewModel.swift
//  RickandMorty
//
//  Created by Антон Дубино on 18.04.2022.
//

import Foundation
import RxSwift
import RxAlamofire

class EpisodesViewModel: EpisodesViewModelType {
    
    var data = EpisodesParsing()
    
    let db = DisposeBag()
    
    func fetchEpisodes(page: Int) -> Observable<[EpisodesResult]> {
        let page = data.loadEpisodes(epPage: page)
        return page
    }
    
}
