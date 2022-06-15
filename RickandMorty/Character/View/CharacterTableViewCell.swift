//
//  TableViewCell.swift
//  RickandMorty
//
//  Created by Антон Дубино on 02.04.2022.
//

import UIKit
import RxSwift
import Kingfisher

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var episodeName: UILabel!
    
    func initCell(data: EpisodesResult) {
        
        self.episodeName.rx.text.onNext(data.name)
    }
}
