//
//  CategoryViewController.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 5/4/22.
//

import UIKit
import RxSwift

class CategoryViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingView: LoadingView!
    @IBOutlet weak var errorView: ErrorView!
    
    // MARK: Private Property
    private let refreshControl = UIRefreshControl()
    private let transition = FadedViewControllerTransition(transition: .fadeIn)
    
    var viewModel: CategoryViewModel
    
    // MARK: - Private Properties
    private var items: [CategoryCellViewModel] = []
    
    
    init(viewModel: CategoryViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTable()
        self.configureErrorView()
        self.bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.viewModel.onReceiveEvents(.viewDidload)
    }
    
    private func configureErrorView() {

        errorView.onRetryButtonTapped = { [weak self] in
            self?.viewModel.onReceiveEvents(.retryButtonTapped)
        }
    }
    
    func configureTable() {
        tableView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellReuseIdentifier: "CategoryCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.refreshControl = refreshControl
        
        refreshControl.rx.controlEvent(.valueChanged)
            .subscribe(onNext: { [weak viewModel] in
                viewModel?.onReceiveEvents(.pulledToRefresh)
            })
            .disposed(by: disposeBag)
    }
    
    private func showLoading(_ show: Bool) {
        
        self.loadingView.isHidden = !show
        if !show {
            self.refreshControl.endRefreshing()
        }
        
    }
    
    private func navigateTo(nexVC: UIViewController) {
        self.navigationController?.pushViewController(nexVC, animated: true)
    }
}

extension CategoryViewController {
    
    private func bindViewModel() {
        viewModel.state
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] (state: CategoryViewModel.State) in
                switch state {
                case .itemUpdate(let categoryData):
                    self?.onDataUpdated(with: categoryData)
                case .showLoading(let show):
                    self?.showLoading(show)
                case .showError(let show):
                    self?.errorView.isHidden = !show
                case .showSnacBar(let message):
                    print("cek message; \(message)")
                case .showListMeal(let cellViewModel):
                    print("cek listmeal")
                    guard let dataPicked = cellViewModel.data else {
                        return
                    }
                    let listMealUseCase = Injection.init().provideListMealUseCase()
                    let listMealViewModel = ListMealViewModel(
                        listMealUseCase: listMealUseCase,
                        dataMeal: dataPicked
                    )

                    self?.navigateTo(nexVC: ListMealViewController(viewModel: listMealViewModel))
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func onDataUpdated(with newItems: [CategoryCellViewModel]) {
        self.items = newItems
        tableView.reloadData()
    }
    
}

extension CategoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(for: indexPath) as CategoryCell
        cell.configureCell(with: cellViewModel)
        return cell
    }
    
}

extension CategoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellViewModel = items[indexPath.row]
        self.viewModel.onReceiveEvents(.onCategoryTapped(cellViewModel))
    }
    
}
