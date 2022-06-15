//
//  CharactersTableViewCell.swift
//  RickandMorty
//
//  Created by Антон Дубино on 21.05.2022.
//

import UIKit
import RxSwift
import Kingfisher

class CharactersTableViewCell: UITableViewCell {

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var aliveImageColor: UIImageView!
    @IBOutlet weak var liveLabel: UILabel!
    @IBOutlet weak var aliveLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        characterImageView.layer.cornerRadius = characterImageView.frame.size.width / 2 - 10
        
        self.aliveImageColor.layer.cornerRadius = 8
        self.aliveImageColor.layer.masksToBounds = true
    }
    
    func initCell(data: CharactersResult) {
        
        if let url = URL(string: data.image) {
            characterImageView.kf.indicatorType = .activity
            characterImageView.kf.setImage(with: url)
        }
        
        self.name.rx.text.onNext(data.name)
        self.aliveLabel.rx.text.onNext(data.species)
        self.locationLabel.rx.text.onNext(data.location.name)
        self.liveLabel.rx.text.onNext(data.status)
        
        switch data.status {
        case "Alive": aliveImageColor.rx.backgroundColor.onNext(.systemGreen)
            liveLabel.rx.text.onNext("Жив")
        case "Dead": aliveImageColor.rx.backgroundColor.onNext(.red)
            liveLabel.rx.text.onNext("Мёртв")
        case "unknown": aliveImageColor.rx.backgroundColor.onNext(.systemGray)
            liveLabel.rx.text.onNext("Неизвестно")
        default: break
        }
        
    }
}

