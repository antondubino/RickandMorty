//
//  SectionModel.swift
//  RickandMorty
//
//  Created by Антон Дубино on 16.04.2022.
//

import Foundation
import RxDataSources

struct SectionModelEpisodes {
    var header: String
    var items: [EpisodesResult]
}

extension SectionModelEpisodes: SectionModelType {
    
    init(original: SectionModelEpisodes, items: [EpisodesResult]) {
        self = original
        self.items = items
    }
}
