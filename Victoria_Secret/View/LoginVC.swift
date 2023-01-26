//
//  ViewController.swift
//  Victoria_Secret
//
//  Created by Admin on 24/01/23.
//

import UIKit

class LoginVC: UIViewController {
    //MARK:- IBoutlets
    @IBOutlet weak var passwordBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subTitleLbl: UILabel!
    @IBOutlet weak var forgotBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var passTxtFld: UITextField!
    @IBOutlet weak var userTxtFld: UITextField!
    
    var viewModel = LoginVM()
    
    //MARK:- ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetUp()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loginBtn.layer.cornerRadius = 5.0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func initialSetUp(){
        self.setupFontAndColor()
    }
    
    private func setupFontAndColor(){
        titleLbl.textColor      = UIColor.white
        titleLbl.font          = UIFont.boldSystemFont(ofSize: 40)
        subTitleLbl.textColor   = UIColor.white
        subTitleLbl.font       = UIFont.boldSystemFont(ofSize: 20)
        loginBtn.setTitle("LOG IN", for: .normal)
        [userTxtFld,passTxtFld].forEach({$0?.delegate = self})
        [userTxtFld,passTxtFld].forEach({$0?.textColor = .white})
        [userTxtFld,passTxtFld].forEach({$0?.font = UIFont.boldSystemFont(ofSize: 16.5)})
        loginBtn.setTitleColor(UIColor.white, for: .normal)
        loginBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.5)
        forgotBtn.setTitleColor(.red, for: .normal)
        forgotBtn.setTitle("Forgot Password?", for: .normal)
        forgotBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13.5)
        passTxtFld.isSecureTextEntry = true
        passwordBtn.setImage(UIImage(named: "icPassword"), for: .normal)
        passwordBtn.setImage(UIImage(named: "icPasswordHide"), for: .selected)
    }
    
    
//MARK:- IBActions========================
//=========================================
    @IBAction func loginBtnAction(_ sender: UIButton) {
        self.view.endEditing(true)
        if self.viewModel.authenticateUser().isValid{
            UserDefaults.standard.set(true, forKey: "isLogin")
            AppRouter.goToDashboard(UIApplication.shared.currentWindow!)
        }else{
            showAlert(msg: self.viewModel.authenticateUser().message ?? "")
        }
    }
    
    @IBAction func passwordBtnAction(_ sender: UIButton) {
        sender.isSelected.toggle()
        passTxtFld.isSecureTextEntry = !sender.isSelected
    }
    
    @IBAction func forgotBtnAction(_ sender: UIButton) {
        self.view.endEditing(true)
        showAlert(msg: "Under Development")
    }
}


// MARK: - Extension For TextField Delegate
//=========================================
extension LoginVC : UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        let text = textField.text ?? ""
        switch textField {
        case userTxtFld:
            self.viewModel.model.email = text
        default:
            self.viewModel.model.password = text
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        switch textField {
        case userTxtFld:
            return (string.checkIfValidCharaters(.email) || string.isEmpty) && newString.length <= 50
        case passTxtFld:
            return (string.checkIfValidCharaters(.password) || string.isEmpty) && newString.length <= 19
        default:
            return false
        }
    }
    
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
