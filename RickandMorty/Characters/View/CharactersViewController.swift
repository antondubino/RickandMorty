//
//  CharactersViewController.swift
//  RickandMorty
//
//  Created by Антон Дубино on 19.05.2022.
//

import UIKit
import RxSwift
import RxDataSources

class CharactersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let db = DisposeBag()
    var viewModel: CharactersViewModelType? = CharactersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "CharactersTableViewCell", bundle: nil), forCellReuseIdentifier: "CharactersCell")
        bind()
    }
    
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModelCharacters>(
      configureCell: { dataSource, tableView, indexPath, item in
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharactersCell", for: indexPath) as! CharactersTableViewCell
          cell.initCell(data: item)
        return cell
      })
    
    func bind() {
        guard let viewModel = viewModel else { return }

        Observable.of(viewModel.characters)
            .flatMap{ val in return Observable.from(val) }
            .map{
                self.viewModel!.cp.loadCharacters(character: $0)
            }
            .concat()
            .toArray()
            .asObservable()
            .map{ [SectionModelCharacters(header: "", items: $0)] }
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: db)
        
        tableView.rx.modelSelected(CharactersResult.self)
            .subscribe({
                let vc = self.storyboard?.instantiateViewController(identifier: "CharacterVC") as! CharacterViewController
                vc.viewModel!.character = [$0.map{
                    CharactersResult(id: $0.id, name: $0.name, status: $0.status, species: $0.species, gender: $0.gender, origin: $0.origin, location: $0.location, image: $0.image, episode: $0.episode, url: $0.url, created: $0.created)
                }.element!]
                self.navigationController?.pushViewController(vc, animated: true)
        }).disposed(by: db)
    }

}
