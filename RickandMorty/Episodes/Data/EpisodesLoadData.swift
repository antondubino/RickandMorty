//
//  EpisodesLoadData.swift
//  RickandMorty
//
//  Created by Антон Дубино on 18.04.2022.
//

import Foundation
import RxSwift
import RxAlamofire

class EpisodesParsing {
    
    let db = DisposeBag()
    
    func loadEpisodes(epPage: Int) -> Observable<[EpisodesResult]> {
        return RxAlamofire.data(.get, Url.shared.getEpisodeUrl(page: epPage)).map { response in
            do {
                let data = try JSONDecoder().decode(EpisodesPage.self, from: response)
                return data.results
            } catch {
                print(error)
                return []
            }
        }.asObservable()
    }

}
