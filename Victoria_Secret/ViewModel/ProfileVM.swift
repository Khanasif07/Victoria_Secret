//
//  ProfileVM.swift
//  Victoria_Secret
//
//  Created by Admin on 25/01/23.
//

import Foundation
class ProfileVM{
    var profile : Profile?
    var profileData: [(String,String)] = []
    
    func getProfileData(_ completionHandler: @escaping (Result<Profile,Error>)->Void){
        NetworkManager.shared.getDataFromServer(EndPoint.profile.rawValue) { (results : Result<Profile,Error>)  in
            switch results{
            case .success(let result):
                self.profile = result
                self.prepareProfileData()
                completionHandler(.success(result))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func prepareProfileData(){
        if let profiles = profile{
            profileData.removeAll()
            profileData.append(("First Name", profiles.firstname))
            profileData.append(("Last Name", profiles.lastName))
            profileData.append(("DOB", profiles.dob))
            profileData.append(("Address", profiles.address))
            profileData.append(("Points Earned", profiles.pointsEarned))
            profileData.append(("Wallet Balance", profiles.walletBalance))
        }
    }
}
