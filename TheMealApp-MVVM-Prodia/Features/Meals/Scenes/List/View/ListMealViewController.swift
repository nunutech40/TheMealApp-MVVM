//
//  ListMealViewController.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 18/4/22.
//

import UIKit
import RxSwift
import RxCocoa

class ListMealViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorView: ErrorView!
    @IBOutlet weak var loadingView: LoadingView!
    
    var viewModel: ListMealViewModel
    
    // MARK: Private Property
    private var sections = [ListMealViewModel.Section]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        self.bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel.onReceiveEvents(.viewDidload)
    }
    
    init(viewModel: ListMealViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureTable() {
        
        tableView.register(UINib(nibName: "TitleListMealCell", bundle: nil), forCellReuseIdentifier: "TitleListMealCell")
        tableView.register(UINib(nibName: "ImageListMealCell", bundle: nil), forCellReuseIdentifier: "ImageListMealCell")
        tableView.register(UINib(nibName: "OtherListMealCell", bundle: nil), forCellReuseIdentifier: "OtherListMealCell")
        tableView.register(UINib(nibName: "DescListMealCell", bundle: nil), forCellReuseIdentifier: "DescListMealCell")
      
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    private func onDataUpdated(with sections: [ListMealViewModel.Section]) {
        self.sections = sections
        tableView.reloadData()
    }
    
    private func navigateTo(nexVC: UIViewController) {
        self.navigationController?.pushViewController(nexVC, animated: true)
    }
    
    
}

extension ListMealViewController {
    
    private func bindViewModel() {
        viewModel.state
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] (state: ListMealViewModel.State) in
                switch state {
                case .showLoading(let show):
                    self?.loadingView.isHidden = !show
                case .showError(let show):
                    self?.errorView.isHidden = !show
                case .dataUpdated(let sections):
                    self?.onDataUpdated(with: sections)
                case .showDetailMeal(let idMeal):
                    let mealUseCase = Injection.init().provideMealUseCase()
                    let mealViewModel = DetailMealViewModel(mealUseCase: mealUseCase, idMeal: idMeal)
                    self?.navigateTo(nexVC: DetailMealViewController(viewModel: mealViewModel))
                }
            })
            .disposed(by: disposeBag)
    }
    
    
    
}

extension ListMealViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch sections[indexPath.section] {
            
        case .title(let title):
            let cell = tableView.dequeueReusableCell(for: indexPath) as TitleListMealCell
            cell.configure(title: title)
            return cell
        
        case .imageMeal(let strImage):
            let cell = tableView.dequeueReusableCell(for: indexPath) as ImageListMealCell
            cell.configure(strImage: strImage)
            return cell
        
        case .listMeals(let strList, let cellViewModels):
            let cell = tableView.dequeueReusableCell(for: indexPath) as OtherListMealCell
            cell.configure(category: strList, cellViewModels: cellViewModels)
            
            cell.onItemTapped = { [weak self] (cellViewModel: OhterListMealCellViewModel) in
                self?.viewModel.onReceiveEvents(.otherMealTapped(cellViewModel))
            }
            return cell
        
        case .description(let desc):
            let cell = tableView.dequeueReusableCell(for: indexPath) as DescListMealCell
            cell.configure(desc: desc)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

