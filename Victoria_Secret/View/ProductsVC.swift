//
//  ProductsVC.swift
//  Victoria_Secret
//
//  Created by Admin on 25/01/23.
//

import UIKit

class ProductsVC: UIViewController {
    //MARK:- IBoutlets
    @IBOutlet weak var mainTableView: UITableView!
    private var viewModel = ProductsVM()
    
    //MARK:- ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpSearchBar()
        self.setUpTableView()
        self.getProducts()
    }
    
    private func setUpSearchBar(){
        let search = UISearchController()
        navigationItem.hidesSearchBarWhenScrolling = true
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Search products"
        navigationItem.searchController = search
    }
    
    private func getProducts(){
        viewModel.getProductListing { [weak self] results in
            guard let self = self else { return }
            switch results{
            case .success(_):
                self.mainTableView.reloadTableView()
            case .failure(let err):
                self.mainTableView.reloadTableView()
                self.showAlert(msg: err.localizedDescription)
            }
        }
    }
    
    private func setUpTableView(){
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.register(UINib(nibName: "ProductTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ProductTableViewCell")
    }
}

//MARK:- Extension TableView Delegate and DataSource
//==================================================
extension ProductsVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.listing.isEmpty ? self.mainTableView.setEmptyMessage("Product is not available") : self.mainTableView.restore()
        return viewModel.listing.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell else { return UITableViewCell()}
        cell.populateCell(viewModel.listing[indexPath.row],indexPath.row == 1)
        cell.rewardBtnAction = { [weak self] in
            guard let `self` = self else {return}
            self.showAlert(msg: "Thank you for joining our rewards program")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productDetailVC = ProductDetailVC.instantiate(fromAppStoryboard: .Dashboard)
        productDetailVC.setUpViewModel(viewModel.listing[indexPath.row])
        self.navigationController?.pushViewController(productDetailVC, animated: true)
    }
}

//MARK:- Extension UISearchResultsUpdating
//========================================
extension ProductsVC: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        self.viewModel.filteredPdttListing =  viewModel.productListing.filter({$0.name.lowercased().contains(text.lowercased())})
        self.viewModel.isFiltering = !text.isEmpty
        self.mainTableView.reloadTableView()
    }
}
