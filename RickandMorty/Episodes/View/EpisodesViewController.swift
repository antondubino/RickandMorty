//
//  EpisodesViewController.swift
//  RickandMorty
//
//  Created by Антон Дубино on 18.04.2022.
//

import UIKit
import RxSwift
import RxDataSources

class EpisodesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let db = DisposeBag()
    
    var viewModel: EpisodesViewModelType? = EpisodesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "EpisodesTableViewCell", bundle: nil), forCellReuseIdentifier: "EpisodeCell")
        bind()
    }
    
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModelEpisodes>(
      configureCell: { dataSource, tableView, indexPath, item in
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as! EpisodesTableViewCell
          cell.initCell(data: item)
        return cell
      })
    
    func bind() {
        guard let viewModel = viewModel else { return }

        Observable.of(viewModel.fetchEpisodes(page: 1).flatMap{val in return Observable.from(val)},
                      viewModel.fetchEpisodes(page: 2).flatMap{val in return Observable.from(val)},
                      viewModel.fetchEpisodes(page: 3).flatMap{val in return Observable.from(val)})
        .concat()
        .toArray()
        .asObservable()
        .map{ [SectionModelEpisodes(header: "", items: $0)] }
        .bind(to: tableView.rx.items(dataSource: dataSource))
        .disposed(by: db)
        
        tableView.rx.modelSelected(EpisodesResult.self)
            .subscribe({
                let vc = self.storyboard?.instantiateViewController(identifier: "CharactersVC") as! CharactersViewController
                vc.viewModel!.characters = $0.element!.characters
                self.navigationController?.pushViewController(vc, animated: true)
        }).disposed(by: db)
    }
}

