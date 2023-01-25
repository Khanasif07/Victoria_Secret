//
//  ViewController.swift
//  Victoria_Secret
//
//  Created by Admin on 24/01/23.
//

import UIKit

class LoginVC: UIViewController {
    //MARK:- IBoutlets
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
        self.signInBtnStatus()
    }
    
    private func setupFontAndColor(){
        titleLbl.textColor      = UIColor.white
        titleLbl.font          = UIFont.boldSystemFont(ofSize: 40)
        subTitleLbl.textColor   = UIColor.white
        subTitleLbl.font       = UIFont.boldSystemFont(ofSize: 20)
        loginBtn.setTitle("Login", for: .normal)
        forgotBtn.setTitle("Forgot Password?", for: .normal)
        [userTxtFld,passTxtFld].forEach({$0?.delegate = self})
        [userTxtFld,passTxtFld].forEach({$0?.font = UIFont.boldSystemFont(ofSize: 15)})
        loginBtn.setTitleColor(UIColor.white, for: .normal)
        loginBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.5)
        forgotBtn.setTitleColor(.red, for: .normal)
        loginBtn.isEnabled = true
    }
    
    @discardableResult
    private func signInBtnStatus()-> Bool{
        return !self.viewModel.model.email.isEmpty && !self.viewModel.model.password.isEmpty
    }
    
    
    //MARK:- IBActions
    @IBAction func loginBtnAction(_ sender: UIButton) {
        self.view.endEditing(true)
        if self.viewModel.checkSignInValidations(parameters: self.viewModel.model.dict).status{
            self.viewModel.signIn(self.viewModel.model.dict)
            UserDefaults.standard.set(true, forKey: "isLogin")
            AppRouter.goToDashboard(UIApplication.shared.windows.first!)
        }else{
            if !self.viewModel.checkSignInValidations(parameters: self.viewModel.model.dict).message.isEmpty{
                self.showAlert(msg: self.viewModel.checkSignInValidations(parameters: self.viewModel.model.dict).message)
            }
        }
    }
    
    @IBAction func forgotBtnAction(_ sender: UIButton) {
        self.view.endEditing(true)
        
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
            loginBtn.isEnabled = signInBtnStatus()
        default:
            self.viewModel.model.password = text
            loginBtn.isEnabled = signInBtnStatus()
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        switch textField {
        case userTxtFld:
            loginBtn.isEnabled = signInBtnStatus()
            return (string.checkIfValidCharaters(.email) || string.isEmpty) && newString.length <= 50
        case passTxtFld:
            loginBtn.isEnabled = signInBtnStatus()
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
