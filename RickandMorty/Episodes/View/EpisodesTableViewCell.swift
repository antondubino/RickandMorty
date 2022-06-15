//
//  EpisodesTableViewCell.swift
//  RickandMorty
//
//  Created by Антон Дубино on 18.04.2022.
//

import UIKit
import RxSwift

class EpisodesTableViewCell: UITableViewCell {

    @IBOutlet weak var episode: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var air_date: UILabel!
    
    
    func initCell(data: EpisodesResult) {
        
        self.episode.rx.text.onNext(data.episode)
        self.name.rx.text.onNext(data.name)
        self.air_date.rx.text.onNext(data.air_date)
    }
}
