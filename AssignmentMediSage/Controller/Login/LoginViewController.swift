//
//  ViewController.swift
//  AssignmentMediSage
//
//  Created by Ganesh Sonawane on 11/03/21.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    var login = LoginVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        //loginBtn.isEnabled = false
    }
    func verify_Login(){
        login.VerifyCredentials(uname: username.text!, pass: password.text!) { (bValue, response) in
            if bValue == false{
                self.displayalert(message: response)
            }
            else{
                self.displayalert(message: response)
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "myTabBar") as? UITabBarController
                vc?.modalPresentationStyle = .fullScreen
                self.present(vc!, animated: true, completion: nil)
            }
        }
    }
    @IBAction func loginBtnClicked(_ sender: Any) {
        verify_Login()
    }
    

}

