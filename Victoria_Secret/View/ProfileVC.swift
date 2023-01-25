//
//  ProfileVC.swift
//  Victoria_Secret
//
//  Created by Admin on 25/01/23.
//

import UIKit

class ProfileVC: UIViewController {
    //MARK:- IBoutlets
    @IBOutlet weak var mainTableView: UITableView!
    var viewModel = ProfileVM()
    
    //MARK:- ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTableView()
        self.getProfileData()
    }
    
    private func getProfileData(){
        viewModel.getProfileData { [weak self] results in
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
        self.mainTableView.register(UINib(nibName: "ProfileTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ProfileTableViewCell")
    }

}


//MARK:- Extension TableView Delegate and DataSource
//==================================================
extension ProfileVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.profileData.isEmpty ? self.mainTableView.setEmptyMessage("Profile is not available") : self.mainTableView.restore()
        return viewModel.profileData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as? ProfileTableViewCell else { return UITableViewCell()}
        cell.populateCell(viewModel.profileData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
