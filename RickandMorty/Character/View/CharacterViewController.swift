//
//  ViewController.swift
//  RickandMorty
//
//  Created by Антон Дубино on 30.03.2022.
//

import UIKit
import RxSwift
import Kingfisher
import RxDataSources

class CharacterViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterImageStatus: UIView!
    @IBOutlet weak var characterStatus: UILabel!
    @IBOutlet weak var characterSpecies: UILabel!
    @IBOutlet weak var characterGender: UILabel!
    @IBOutlet weak var characterLocation: UILabel!
    @IBOutlet weak var characterEpisode: UILabel!
    
    let db = DisposeBag()
    var viewModel: CharacterViewModelType? = CharacterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "CharacterTableViewCell", bundle: nil), forCellReuseIdentifier: "CharacterEpisodeCell")
        updateView()
        bind()
    }
    
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModelEpisodes>(
      configureCell: { dataSource, tableView, indexPath, item in
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterEpisodeCell", for: indexPath) as! CharacterTableViewCell
          cell.initCell(data: item)
        return cell
      })
    
    func bind() {
        guard let viewModel = viewModel else { return }
        
        Observable.of(viewModel.character[0].episode)
            .flatMap{ val in return Observable.from(val) }
            .map { self.viewModel!.cp.loadEpisodes(episode: $0) }
            .concat()
            .toArray()
            .asObservable()
            .map{ [SectionModelEpisodes(header: "", items: $0)] }
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: db)
    }
    
    func updateView() {
        guard let viewModel = viewModel else { return }

        characterImageStatus.layer.cornerRadius = 10
        characterName.rx.text.onNext(viewModel.character[0].name)
        characterStatus.rx.text.onNext(viewModel.character[0].status)
        characterSpecies.rx.text.onNext(viewModel.character[0].species)
        characterGender.rx.text.onNext(viewModel.character[0].gender)
        characterLocation.rx.text.onNext(viewModel.character[0].location.name)
        viewModel.cp.loadEpisode(episode: viewModel.character[0].episode)
            .bind(to: self.characterEpisode.rx.text)
            .disposed(by: db)
        
        if let url = URL(string: viewModel.character[0].image) {
            characterImage.kf.indicatorType = .activity
            characterImage.kf.setImage(with: url)
        }
        
        switch viewModel.character[0].gender {
        case "Male": characterGender.rx.text.onNext("Мужская особь")
        case "Female": characterGender.rx.text.onNext("Женская особь")
        default: break
        }
        
        switch viewModel.character[0].status {
        case "Alive": characterImageStatus.rx.backgroundColor.onNext(.systemGreen)
            characterStatus.rx.text.onNext("Жив")
        case "Dead": characterImageStatus.rx.backgroundColor.onNext(.systemRed)
            characterStatus.rx.text.onNext("Мёртв")
        case "unknown": characterImageStatus.rx.backgroundColor.onNext(.systemGray)
            characterStatus.rx.text.onNext("Неизвестно")
        default: break
        }
    }
    
}

